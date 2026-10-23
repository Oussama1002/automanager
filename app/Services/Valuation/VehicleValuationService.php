<?php

namespace App\Services\Valuation;

/**
 * Vehicle valuation engine – Moroccan used-car market.
 *
 * Pure calculation (no database, no HTTP, no view) so it can be reused by the public
 * estimator, fleet management, insurance, reports or an API. It receives the vehicle,
 * the base value and the rules, and returns every step so the result is explainable.
 *
 *   BASE → AGE → MILEAGE → CONDITION → ACCIDENT HISTORY → OPTIONS → MARKET → FINAL
 *
 * Each step is applied to the value left by the previous one. All coefficients come
 * from $rules (see ValuationRules); none of them is an official Moroccan rate.
 */
class VehicleValuationService
{
    public const FUELS = [
        'essence' => 'Essence', 'diesel' => 'Diesel', 'hybride' => 'Hybride',
        'electrique' => 'Électrique', 'gpl' => 'GPL',
    ];
    public const CONDITIONS = ['excellent' => 'Excellent', 'bon' => 'Bon', 'moyen' => 'Moyen', 'mauvais' => 'Mauvais'];
    public const MAINTENANCE = ['complet' => 'Complet (carnet à jour)', 'partiel' => 'Partiel', 'inconnu' => 'Inconnu'];
    public const OWNERS = ['1' => '1 propriétaire', '2' => '2 propriétaires', '3plus' => '3 ou plus'];
    public const ACCIDENTS = [
        'aucun'      => 'Aucun accident',
        'leger'      => 'Accident léger (carrosserie)',
        'repare'     => 'Véhicule réparé (sinistre déclaré)',
        'important'  => 'Accident important',
        'structurel' => 'Dommage structurel (châssis)',
    ];
    public const OPTIONS = [
        'cuir'                => 'Sellerie cuir intégrale',
        'toit_panoramique'    => 'Toit panoramique',
        'toit_ouvrant'        => 'Toit ouvrant',
        'multimedia'          => 'Multimédia avancé',
        'adas'                => 'Aides à la conduite (ADAS)',
        'radar_stationnement' => 'Radars de stationnement',
        'camera'              => 'Caméra de recul',
        'jantes_alu'          => 'Jantes aluminium',
        'gps'                 => 'Navigation GPS',
    ];
    /** Same values as the admin annonce form's "Origine" field. */
    public const ORIGINS = [
        'ww_maroc'     => 'WW au Maroc',
        'importe_neuf' => 'Importé neuf',
        'dedouane'     => 'Dédouané',
        'non_dedouane' => 'Pas encore dédouané',
    ];
    public const BRAND_TIERS = [
        'budget' => 'économique', 'mainstream' => 'généraliste', 'premium' => 'premium',
        'luxury' => 'de luxe', 'ultra' => 'très haut de gamme',
    ];
    public const CONFIDENCE_LABELS = ['HIGH' => 'Élevée', 'MEDIUM' => 'Moyenne', 'LOW' => 'Faible'];

    /** [rule key, band start (years), band end (years)] */
    private const AGE_BANDS = [
        ['age.rate_0_1', 0, 1],
        ['age.rate_1_3', 1, 3],
        ['age.rate_3_5', 3, 5],
        ['age.rate_5_7', 5, 7],
        ['age.rate_7_10', 7, 10],
        ['age.rate_10_plus', 10, INF],
    ];

    /** @param array $rules key => value (ValuationRules::load()['values']) */
    public function __construct(private array $rules)
    {
    }

    /**
     * @param array $vehicle fuel, km, first_registration (DateTimeInterface), gearbox, power_cv, origin,
     *                       brand_tier (budget|mainstream|premium|luxury|ultra),
     *                       condition_mechanical, condition_body, condition_interior,
     *                       maintenance, owners, accident, options (list of keys)
     * @param array $base    ['value' => float, 'source' => string, 'source_label' => string]
     * @param int   $comparables number of comparable listings on the market (for confidence)
     */
    public function calculate(array $vehicle, array $base, int $comparables, \DateTimeInterface $date): array
    {
        $fuel = array_key_exists($vehicle['fuel'] ?? '', self::FUELS) ? $vehicle['fuel'] : 'essence';
        $tier = array_key_exists($vehicle['brand_tier'] ?? '', self::BRAND_TIERS) ? $vehicle['brand_tier'] : 'mainstream';
        $baseValue = max(0.0, (float) $base['value']);
        $ageYears = $this->ageInYears($vehicle['first_registration'], $date);

        $value = $baseValue;
        $steps = [];

        $steps[] = $step = $this->ageStep($value, $ageYears, $fuel, $tier, $baseValue);
        $value += $step['amount'];
        $valueAfterAge = $value;

        $steps[] = $step = $this->mileageStep($value, $ageYears, $fuel, (int) ($vehicle['km'] ?? 0));
        $value += $step['amount'];

        $steps[] = $step = $this->conditionStep($value, $vehicle);
        $value += $step['amount'];

        $steps[] = $step = $this->accidentStep($value, $vehicle['accident'] ?? 'aucun');
        $value += $step['amount'];

        $steps[] = $step = $this->optionsStep($value, (array) ($vehicle['options'] ?? []));
        $value += $step['amount'];

        $steps[] = $step = $this->marketStep($value, $vehicle, $fuel);
        $value += $step['amount'];

        // Final safeguards, each shown as its own line so the total always adds up
        $final = $value;
        $corrections = [];

        // Net bonuses of the steps after age are capped together, so stacked "excellent"
        // answers, options and market premiums can't inflate the price
        $bonuses = 0.0;
        foreach ($steps as $s) {
            if ($s['key'] !== 'age') {
                $bonuses += max(0, $s['amount']);
            }
        }
        $bonusCap = $valueAfterAge * $this->rule('general.max_total_bonus_pct') / 100;
        if ($bonuses > $bonusCap) {
            $corrections[] = $this->line(
                'Plafond des bonus cumulés (' . $this->pct($this->rule('general.max_total_bonus_pct')) . ' de la valeur après âge)',
                null,
                $bonusCap - $bonuses
            );
            $final += $bonusCap - $bonuses;
        }

        $cap = $baseValue * $this->rule('general.max_pct_of_base') / 100;
        if ($baseValue > 0 && $final > $cap) {
            $corrections[] = $this->line('Plafond : ' . $this->pct($this->rule('general.max_pct_of_base'), false) . ' de la valeur de base', null, $cap - $final);
            $final = $cap;
        }
        $min = $this->rule('general.min_value');
        if ($final < $min) {
            $corrections[] = $this->line('Valeur minimale', null, $min - $final);
            $final = $min;
        }
        $rounding = max(1, $this->rule('general.rounding'));
        $rounded = round($final / $rounding) * $rounding;
        if ($rounded != $final) {
            $corrections[] = $this->line('Arrondi à ' . number_format($rounding, 0, ',', ' ') . ' MAD', null, $rounded - $final);
            $final = $rounded;
        }
        if ($corrections) {
            $steps[] = [
                'key' => 'corrections', 'label' => 'Arrondi et garde-fous',
                'amount' => array_sum(array_column($corrections, 'amount')),
                'details' => [], 'lines' => $corrections,
            ];
        }

        $confidence = $this->confidence($comparables);
        $rangePct = $this->rule('confidence.range_' . strtolower($confidence) . '_pct') / 100;

        return [
            'date'        => $date->format('Y-m-d'),
            'methodology' => 'NADO-VAL v' . rtrim(rtrim(number_format($this->rule('general.methodology_version'), 2, '.', ''), '0'), '.'),
            'base'        => ['value' => round($baseValue), 'source' => $base['source'] ?? 'unknown', 'source_label' => $base['source_label'] ?? ''],
            'age_years'   => round($ageYears, 1),
            'steps'       => $steps,
            'final_value' => (int) $final,
            'range'       => [
                'min' => (int) max($min, round($final * (1 - $rangePct) / $rounding) * $rounding),
                'max' => (int) (round($final * (1 + $rangePct) / $rounding) * $rounding),
            ],
            'confidence'  => [
                'level'       => $confidence,
                'label'       => self::CONFIDENCE_LABELS[$confidence],
                'comparables' => $comparables,
            ],
        ];
    }

    /**
     * Share of the base value left after $ageYears (0..1), and the per-band explanation.
     * Public so the base-value resolver can back-project listing prices with the same curve.
     */
    public function residualFactor(float $ageYears, string $fuel, string $tier = 'mainstream'): array
    {
        $fuelFactor = $this->rule("age.fuel_factor_$fuel", 100) / 100;
        $brandFactor = $this->rule("age.brand_factor_$tier", 100) / 100;
        $residual = 1.0;
        $details = [];

        foreach (self::AGE_BANDS as [$key, $from, $to]) {
            if ($ageYears <= $from) {
                break;
            }
            $years = min($ageYears, $to) - $from;
            $rate = min(0.95, $this->rule($key) / 100 * $fuelFactor * $brandFactor);
            $residual *= (1 - $rate) ** $years;
            $details[] = sprintf(
                '%s : %s par an × %s an%s',
                is_infinite($to) ? "Au-delà de $from ans" : "De $from à $to an" . ($to > 1 ? 's' : ''),
                $this->pct($rate * 100, false),
                $this->num($years, 1),
                $years > 1 ? 's' : ''
            );
        }

        $minResidual = $this->rule('age.min_residual_pct') / 100;
        $floored = $residual < $minResidual;

        return [
            'factor'  => $floored ? $minResidual : $residual,
            'details' => $details,
            'floored' => $floored,
            'fuel_factor' => $fuelFactor,
            'brand_factor' => $brandFactor,
        ];
    }

    private function ageStep(float $value, float $ageYears, string $fuel, string $tier, float $baseValue): array
    {
        $residual = $this->residualFactor($ageYears, $fuel, $tier);
        $details = array_merge(
            ['Âge : ' . $this->num($ageYears, 1) . ' an(s) depuis la 1ère mise en circulation'],
            $residual['details']
        );
        if ($residual['fuel_factor'] != 1.0) {
            $details[] = 'Taux ajustés pour le carburant ' . self::FUELS[$fuel] . ' (× ' . $this->num($residual['fuel_factor'], 2) . ')';
        }
        if ($residual['brand_factor'] != 1.0) {
            $details[] = 'Taux ajustés pour une marque ' . self::BRAND_TIERS[$tier] . ' (× ' . $this->num($residual['brand_factor'], 2) . ')';
        }
        if ($residual['floored']) {
            $details[] = 'Valeur résiduelle minimale appliquée : ' . $this->pct($this->rule('age.min_residual_pct'), false) . ' de la base';
        }

        return [
            'key' => 'age', 'label' => 'Dépréciation liée à l\'âge',
            'amount' => $baseValue * $residual['factor'] - $value,
            'details' => $details, 'lines' => [],
        ];
    }

    private function mileageStep(float $value, float $ageYears, string $fuel, int $km): array
    {
        $perYear = $this->rule("mileage.expected_km_$fuel", 15000);
        $expected = $perYear * $ageYears;
        $tolerance = max($expected * $this->rule('mileage.tolerance_pct') / 100, $this->rule('mileage.tolerance_min_km'));
        $delta = $km - $expected;

        $details = [
            'Kilométrage attendu : ' . $this->km($expected) . ' (' . $this->km($perYear) . '/an × ' . $this->num($ageYears, 1) . ' an(s))',
            'Kilométrage réel : ' . $this->km($km) . ' — tolérance ± ' . $this->km($tolerance),
        ];

        $pct = 0.0;
        if (abs($delta) > $tolerance) {
            $excess = abs($delta) - $tolerance;
            if ($delta > 0) {
                $pct = -min($excess / 10000 * $this->rule('mileage.pct_per_10000_over'), $this->rule('mileage.max_penalty_pct'));
                $details[] = $this->km($excess) . ' au-dessus de la tolérance → ' . $this->pct($pct) .
                    ' (' . $this->pct(-$this->rule('mileage.pct_per_10000_over')) . ' / 10 000 km, max ' . $this->pct(-$this->rule('mileage.max_penalty_pct')) . ')';
            } else {
                $pct = min($excess / 10000 * $this->rule('mileage.pct_per_10000_under'), $this->rule('mileage.max_bonus_pct'));
                $details[] = $this->km($excess) . ' en dessous de la tolérance → ' . $this->pct($pct) .
                    ' (' . $this->pct($this->rule('mileage.pct_per_10000_under')) . ' / 10 000 km, max ' . $this->pct($this->rule('mileage.max_bonus_pct')) . ')';
            }
        } else {
            $details[] = 'Dans la tolérance → aucun ajustement';
        }

        return [
            'key' => 'mileage', 'label' => 'Ajustement kilométrique',
            'amount' => $value * $pct / 100, 'details' => $details, 'lines' => [],
        ];
    }

    private function conditionStep(float $value, array $vehicle): array
    {
        $items = [
            ['condition.mechanical_', $vehicle['condition_mechanical'] ?? 'bon', 'État mécanique', self::CONDITIONS],
            ['condition.body_', $vehicle['condition_body'] ?? 'bon', 'État carrosserie', self::CONDITIONS],
            ['condition.interior_', $vehicle['condition_interior'] ?? 'bon', 'État intérieur', self::CONDITIONS],
            ['condition.maintenance_', $vehicle['maintenance'] ?? 'partiel', 'Historique d\'entretien', self::MAINTENANCE],
        ];
        if (!empty($vehicle['owners'])) {
            $items[] = ['condition.owners_', $vehicle['owners'], 'Nombre de propriétaires', self::OWNERS];
        }

        $lines = [];
        foreach ($items as [$prefix, $choice, $label, $choices]) {
            if (!isset($choices[$choice])) {
                continue;
            }
            $pct = $this->rule($prefix . $choice);
            $lines[] = $this->line($label . ' : ' . $choices[$choice], $pct, $value * $pct / 100);
        }

        // Positive answers are capped together (penalties are not)
        $bonusPct = array_sum(array_filter(array_column($lines, 'pct'), fn ($p) => $p > 0));
        $cap = $this->rule('condition.max_bonus_pct');
        if ($bonusPct > $cap) {
            $lines[] = $this->line('Plafond des bonus d\'état (' . $this->pct($cap) . ')', $cap - $bonusPct, $value * ($cap - $bonusPct) / 100);
        }

        return [
            'key' => 'condition', 'label' => 'État actuel du véhicule',
            'amount' => array_sum(array_column($lines, 'amount')), 'details' => [], 'lines' => $lines,
        ];
    }

    private function accidentStep(float $value, string $accident): array
    {
        $accident = isset(self::ACCIDENTS[$accident]) ? $accident : 'aucun';
        $pct = $this->rule("accident.$accident");

        return [
            'key' => 'accident', 'label' => 'Historique d\'accident',
            'amount' => $value * $pct / 100,
            'details' => [self::ACCIDENTS[$accident] . ' → ' . $this->pct($pct) . ' (indépendant de l\'état actuel)'],
            'lines' => [],
        ];
    }

    private function optionsStep(float $value, array $options): array
    {
        $lines = [];
        foreach (array_unique($options) as $option) {
            if (!isset(self::OPTIONS[$option])) {
                continue;
            }
            $pct = $this->rule("options.$option");
            $lines[] = $this->line(self::OPTIONS[$option], $pct, $value * $pct / 100);
        }

        $total = array_sum(array_column($lines, 'pct'));
        $cap = $this->rule('options.max_total_pct');
        if ($total > $cap) {
            $lines[] = $this->line('Plafond des options (' . $this->pct($cap) . ')', $cap - $total, $value * ($cap - $total) / 100);
        }

        return [
            'key' => 'options', 'label' => 'Équipements optionnels',
            'amount' => array_sum(array_column($lines, 'amount')),
            'details' => $lines ? [] : ['Aucune option déclarée'], 'lines' => $lines,
        ];
    }

    private function marketStep(float $value, array $vehicle, string $fuel): array
    {
        $items = [];
        if (($vehicle['gearbox'] ?? null) === 'Automatique') {
            $items[] = ['Boîte automatique', $this->rule('market.gearbox_automatique')];
        }
        $items[] = ['Demande carburant ' . self::FUELS[$fuel], $this->rule("market.fuel_$fuel")];
        if (!empty($vehicle['origin']) && isset(self::ORIGINS[$vehicle['origin']])) {
            $items[] = ['Origine : ' . self::ORIGINS[$vehicle['origin']], $this->rule('origin.' . $vehicle['origin'])];
        }
        $cv = (int) ($vehicle['power_cv'] ?? 0);
        if ($cv > 0) {
            [$band, $label] = match (true) {
                $cv >= 15 => ['15_plus', '15 CV et plus'],
                $cv >= 11 => ['11_14', '11 à 14 CV'],
                default   => ['1_10', 'jusqu\'à 10 CV'],
            };
            $items[] = ["Puissance fiscale $cv CV ($label, vignette)", $this->rule("market.cv_$band")];
        }
        $items[] = ['Tendance générale du marché marocain', $this->rule('market.general_pct')];

        $lines = [];
        foreach ($items as [$label, $pct]) {
            $lines[] = $this->line($label, $pct, $value * $pct / 100);
        }

        return [
            'key' => 'market', 'label' => 'Ajustement marché',
            'amount' => array_sum(array_column($lines, 'amount')), 'details' => [], 'lines' => $lines,
        ];
    }

    private function confidence(int $comparables): string
    {
        if ($comparables >= $this->rule('confidence.high_min_comparables')) {
            return 'HIGH';
        }
        if ($comparables >= $this->rule('confidence.medium_min_comparables')) {
            return 'MEDIUM';
        }
        return 'LOW';
    }

    private function ageInYears(\DateTimeInterface $firstRegistration, \DateTimeInterface $date): float
    {
        $days = (float) $firstRegistration->diff($date)->days;
        if ($firstRegistration > $date) {
            return 0.0;
        }
        return $days / 365.25;
    }

    private function rule(string $key, float $fallback = 0.0): float
    {
        return (float) ($this->rules[$key] ?? ValuationRules::defaults()[$key] ?? $fallback);
    }

    private function line(string $label, ?float $pct, float $amount): array
    {
        return ['label' => $label, 'pct' => $pct, 'amount' => $amount];
    }

    private function pct(float $pct, bool $signed = true): string
    {
        $text = $this->num(abs($pct), 1) . ' %';
        if (!$signed) {
            return $this->num($pct, 1) . ' %';
        }
        return ($pct < 0 ? '−' : '+') . $text;
    }

    private function num(float $n, int $decimals): string
    {
        $text = number_format($n, $decimals, ',', ' ');
        return str_contains($text, ',') ? rtrim(rtrim($text, '0'), ',') : $text;
    }

    private function km(float $km): string
    {
        return number_format(round($km), 0, ',', ' ') . ' km';
    }
}
