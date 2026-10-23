<?php

namespace App\Services\Valuation;

use Illuminate\Support\Facades\DB;

/**
 * Valuation coefficients.
 *
 * The live values are stored in the `valuation_rules` table (editable in phpMyAdmin,
 * see valuation_rules.sql). DEFAULTS is only the fallback when a row is missing or the
 * table does not exist yet, so the page never breaks.
 *
 * IMPORTANT: none of these numbers is an official / legal Moroccan rate. They are
 * internal starting values (taken from the previous NADO estimator) meant to be
 * calibrated against real sales.
 *
 * Units: '%' values are percentages (19 = 19 %), negative = lowers the value.
 */
class ValuationRules
{
    public const TABLE = 'valuation_rules';

    /** key => [group, label, default value, unit] */
    public const DEFAULTS = [
        // ── General ──
        'general.methodology_version' => ['general', 'Version de la méthodologie', 1.2, 'v'],
        'general.rounding'            => ['general', 'Arrondi du résultat', 500, 'MAD'],
        'general.min_value'           => ['general', 'Valeur minimale affichée', 5000, 'MAD'],
        'general.max_pct_of_base'     => ['general', 'Plafond : % maximum de la valeur de base', 98, '%'],
        // All bonuses together (mileage, condition, options, market) can't add more than this
        // % to the value left after age depreciation — stops "everything excellent" from inflating prices
        'general.max_total_bonus_pct' => ['general', 'Plafond des bonus cumulés (% de la valeur après âge)', 8, '%'],

        // ── Age depreciation: annual rate per age band (compounded) ──
        'age.rate_0_1'        => ['age', 'Dépréciation annuelle 0–1 an', 19, '%'],
        'age.rate_1_3'        => ['age', 'Dépréciation annuelle 1–3 ans', 11, '%'],
        'age.rate_3_5'        => ['age', 'Dépréciation annuelle 3–5 ans', 11.5, '%'],
        'age.rate_5_7'        => ['age', 'Dépréciation annuelle 5–7 ans', 9, '%'],
        'age.rate_7_10'       => ['age', 'Dépréciation annuelle 7–10 ans', 8, '%'],
        'age.rate_10_plus'    => ['age', 'Dépréciation annuelle au-delà de 10 ans', 6, '%'],
        'age.min_residual_pct'=> ['age', 'Valeur résiduelle minimale (% de la base)', 12, '%'],
        // Multiplies the annual rates above (100 = unchanged, 87 = depreciates 13 % slower)
        'age.fuel_factor_essence'    => ['age', 'Facteur de dépréciation – Essence', 100, '%'],
        'age.fuel_factor_diesel'     => ['age', 'Facteur de dépréciation – Diesel', 87, '%'],
        'age.fuel_factor_hybride'    => ['age', 'Facteur de dépréciation – Hybride', 93, '%'],
        'age.fuel_factor_electrique' => ['age', 'Facteur de dépréciation – Électrique', 112, '%'],
        'age.fuel_factor_gpl'        => ['age', 'Facteur de dépréciation – GPL', 108, '%'],
        // Multiplies the annual rates by brand tier: premium/luxury lose value faster in Morocco
        // (maintenance cost, fewer buyers); budget brands hold their value better
        'age.brand_factor_budget'     => ['age', 'Facteur de dépréciation – marques économiques (Dacia, Suzuki…)', 92, '%'],
        'age.brand_factor_mainstream' => ['age', 'Facteur de dépréciation – marques généralistes (Renault, Peugeot, VW…)', 100, '%'],
        'age.brand_factor_premium'    => ['age', 'Facteur de dépréciation – marques premium (Volvo, Jeep, Mini…)', 105, '%'],
        'age.brand_factor_luxury'     => ['age', 'Facteur de dépréciation – marques de luxe (Audi, BMW, Mercedes…)', 110, '%'],
        'age.brand_factor_ultra'      => ['age', 'Facteur de dépréciation – très haut de gamme (Bentley, Ferrari…)', 115, '%'],

        // ── Mileage ──
        'mileage.expected_km_essence'    => ['mileage', 'Kilométrage annuel attendu – Essence', 18500, 'km/an'],
        'mileage.expected_km_diesel'     => ['mileage', 'Kilométrage annuel attendu – Diesel', 25000, 'km/an'],
        'mileage.expected_km_hybride'    => ['mileage', 'Kilométrage annuel attendu – Hybride', 20000, 'km/an'],
        'mileage.expected_km_electrique' => ['mileage', 'Kilométrage annuel attendu – Électrique', 17500, 'km/an'],
        'mileage.expected_km_gpl'        => ['mileage', 'Kilométrage annuel attendu – GPL', 18500, 'km/an'],
        'mileage.tolerance_pct'          => ['mileage', 'Tolérance sans ajustement (% du km attendu)', 15, '%'],
        'mileage.tolerance_min_km'       => ['mileage', 'Tolérance minimale', 5000, 'km'],
        'mileage.pct_per_10000_over'     => ['mileage', 'Malus par tranche de 10 000 km au-dessus', 3.5, '%'],
        'mileage.pct_per_10000_under'    => ['mileage', 'Bonus par tranche de 10 000 km en dessous', 2.5, '%'],
        'mileage.max_penalty_pct'        => ['mileage', 'Malus kilométrique maximum', 12, '%'],
        'mileage.max_bonus_pct'          => ['mileage', 'Bonus kilométrique maximum', 8, '%'],

        // ── Current condition ──
        'condition.mechanical_excellent' => ['condition', 'État mécanique – Excellent', 1.5, '%'],
        'condition.mechanical_bon'       => ['condition', 'État mécanique – Bon', 0, '%'],
        'condition.mechanical_moyen'     => ['condition', 'État mécanique – Moyen', -6, '%'],
        'condition.mechanical_mauvais'   => ['condition', 'État mécanique – Mauvais', -15, '%'],
        'condition.body_excellent'       => ['condition', 'État carrosserie – Excellent', 1, '%'],
        'condition.body_bon'             => ['condition', 'État carrosserie – Bon', 0, '%'],
        'condition.body_moyen'           => ['condition', 'État carrosserie – Moyen', -4, '%'],
        'condition.body_mauvais'         => ['condition', 'État carrosserie – Mauvais', -10, '%'],
        'condition.interior_excellent'   => ['condition', 'État intérieur – Excellent', 0.5, '%'],
        'condition.interior_bon'         => ['condition', 'État intérieur – Bon', 0, '%'],
        'condition.interior_moyen'       => ['condition', 'État intérieur – Moyen', -3, '%'],
        'condition.interior_mauvais'     => ['condition', 'État intérieur – Mauvais', -7, '%'],
        'condition.maintenance_complet'  => ['condition', 'Historique d\'entretien – Complet', 1.5, '%'],
        'condition.maintenance_partiel'  => ['condition', 'Historique d\'entretien – Partiel', 0, '%'],
        'condition.maintenance_inconnu'  => ['condition', 'Historique d\'entretien – Inconnu', -3, '%'],
        'condition.max_bonus_pct'        => ['condition', 'Plafond des bonus d\'état', 3, '%'],
        'condition.owners_1'             => ['condition', 'Propriétaires – 1', 1, '%'],
        'condition.owners_2'             => ['condition', 'Propriétaires – 2', 0, '%'],
        'condition.owners_3plus'         => ['condition', 'Propriétaires – 3 ou plus', -3, '%'],

        // ── Accident history (independent from the current condition) ──
        'accident.aucun'      => ['accident', 'Aucun accident', 0, '%'],
        'accident.leger'      => ['accident', 'Accident léger', -5, '%'],
        'accident.repare'     => ['accident', 'Véhicule réparé (sinistre déclaré)', -8, '%'],
        'accident.important'  => ['accident', 'Accident important', -15, '%'],
        'accident.structurel' => ['accident', 'Dommage structurel (châssis)', -30, '%'],

        // ── Origin (same choices as the admin annonce form). "WW au Maroc" = bought new in
        // Morocco, the reference. Imports: unknown history / mileage; not yet cleared: the
        // buyer still pays the customs duties.
        'origin.ww_maroc'     => ['origin', 'Origine – WW au Maroc', 0, '%'],
        'origin.importe_neuf' => ['origin', 'Origine – Importé neuf', -2, '%'],
        'origin.dedouane'     => ['origin', 'Origine – Dédouané (importé d\'occasion)', -7, '%'],
        'origin.non_dedouane' => ['origin', 'Origine – Pas encore dédouané', -20, '%'],

        // ── Optional equipment (% of the value, not the option's purchase price) ──
        'options.cuir'                => ['options', 'Sellerie cuir intégrale', 0.75, '%'],
        'options.toit_panoramique'    => ['options', 'Toit panoramique', 1, '%'],
        'options.toit_ouvrant'        => ['options', 'Toit ouvrant', 0.5, '%'],
        'options.multimedia'          => ['options', 'Multimédia avancé (écran, CarPlay/Android Auto)', 0.5, '%'],
        'options.adas'                => ['options', 'Aides à la conduite (ADAS)', 0.75, '%'],
        'options.radar_stationnement' => ['options', 'Radars de stationnement', 0.25, '%'],
        'options.camera'              => ['options', 'Caméra de recul', 0.4, '%'],
        'options.jantes_alu'          => ['options', 'Jantes aluminium', 0.4, '%'],
        'options.gps'                 => ['options', 'Navigation GPS', 0.25, '%'],
        'options.max_total_pct'       => ['options', 'Plafond total des options', 4, '%'],

        // ── Market (Moroccan demand for the characteristics + general trend) ──
        'market.gearbox_automatique' => ['market', 'Boîte automatique', 2, '%'],
        'market.fuel_essence'        => ['market', 'Demande – Essence', 0, '%'],
        'market.fuel_diesel'         => ['market', 'Demande – Diesel', 0, '%'],
        'market.fuel_hybride'        => ['market', 'Demande – Hybride', 3, '%'],
        'market.fuel_electrique'     => ['market', 'Demande – Électrique', 5, '%'],
        'market.fuel_gpl'            => ['market', 'Demande – GPL', -7, '%'],
        // Fiscal power bands follow the vignette (TSAV) thresholds: the yearly tax jumps
        // from 11 CV and again from 15 CV, which lowers resale demand
        'market.cv_1_10'             => ['market', 'Puissance fiscale jusqu\'à 10 CV', 0, '%'],
        'market.cv_11_14'            => ['market', 'Puissance fiscale 11 à 14 CV', -5, '%'],
        'market.cv_15_plus'          => ['market', 'Puissance fiscale 15 CV et plus', -10, '%'],
        'market.general_pct'         => ['market', 'Tendance générale du marché marocain', 0, '%'],

        // ── Confidence (based on comparable NADO listings) ──
        'confidence.high_min_comparables'   => ['confidence', 'Annonces comparables pour confiance ÉLEVÉE', 8, 'annonces'],
        'confidence.medium_min_comparables' => ['confidence', 'Annonces comparables pour confiance MOYENNE', 3, 'annonces'],
        'confidence.range_high_pct'         => ['confidence', 'Fourchette ± si confiance élevée', 5, '%'],
        'confidence.range_medium_pct'       => ['confidence', 'Fourchette ± si confiance moyenne', 8, '%'],
        'confidence.range_low_pct'          => ['confidence', 'Fourchette ± si confiance faible', 12, '%'],
    ];

    /** Default values only: key => value. */
    public static function defaults(): array
    {
        return array_map(fn ($rule) => (float) $rule[2], self::DEFAULTS);
    }

    public static function label(string $key): string
    {
        return self::DEFAULTS[$key][1] ?? $key;
    }

    /**
     * Live rules: database values over the defaults.
     * Returns ['values' => key => float, 'source' => 'database'|'defaults', 'updated_at' => ?string].
     */
    public static function load(): array
    {
        $values = self::defaults();

        try {
            $rows = DB::table(self::TABLE)->where('is_active', 1)->get(['key', 'value', 'updated_at']);
        } catch (\Throwable $e) {
            return ['values' => $values, 'source' => 'defaults', 'updated_at' => null];
        }

        $updatedAt = null;
        foreach ($rows as $row) {
            if (is_numeric($row->value)) {
                $values[$row->key] = (float) $row->value;
            }
            if ($row->updated_at && (!$updatedAt || $row->updated_at > $updatedAt)) {
                $updatedAt = $row->updated_at;
            }
        }

        return ['values' => $values, 'source' => $rows->isEmpty() ? 'defaults' : 'database', 'updated_at' => $updatedAt];
    }
}
