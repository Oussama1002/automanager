<?php

namespace App\Services\Valuation;

use App\Models\Annonces;
use App\Models\CarTarifier;
use Illuminate\Support\Facades\Cache;

/**
 * Finds the base (reference new) value of a vehicle and records where it came from.
 *
 * Priority:
 *   1. Value entered by the user (manual reference)
 *   2. car_tarifiers table (admin reference prices)
 *   3. Comparable NADO listings, back-projected with the same age curve as the engine
 *   4. Indicative brand-tier × category grid (internal estimate, last resort)
 *
 * Also counts comparable listings (same brand + model, year ± 2) for the confidence level.
 */
class ValuationBaseResolver
{
    public const SOURCES = [
        'manual'      => 'Valeur de référence saisie',
        'tarif'       => 'Tarif de référence NADO',
        'comparables' => 'Annonces comparables NADO',
        'grid'        => 'Grille indicative marque × catégorie (estimation interne)',
    ];

    public function __construct(private VehicleValuationService $engine)
    {
    }

    /**
     * @return array value, source, source_label, comparables, comparables_median
     */
    public function resolve(string $brand, string $model, int $year, ?float $manualValue = null): array
    {
        $market = $this->comparables($brand, $model, $year);

        if ($manualValue && $manualValue > 0) {
            return $this->result($manualValue, 'manual', self::SOURCES['manual'], $market);
        }

        $cacheKey = 'valuation_base_v1_1_' . md5(strtolower("$brand|$model"));
        $base = Cache::remember($cacheKey, 3600, fn () => $this->lookup($brand, $model));

        return $this->result($base['value'], $base['source'], $base['label'], $market);
    }

    private function lookup(string $brand, string $model): array
    {
        // 1) Admin reference prices
        try {
            $tarif = CarTarifier::query()
                ->whereRaw('LOWER(brand) = ?', [strtolower($brand)])
                ->whereRaw('LOWER(model) = ?', [strtolower($model)])
                ->orderByDesc('year')
                ->first();
            if ($tarif && (int) $tarif->base_price > 0) {
                $label = self::SOURCES['tarif'] . ($tarif->year ? ' (' . $tarif->year . ')' : '');
                return ['value' => (float) $tarif->base_price, 'source' => 'tarif', 'label' => $label];
            }
        } catch (\Throwable $e) {
            // table missing → next source
        }

        // 2) Back-project listing prices of the same brand + model to a new price
        try {
            $ads = $this->listings($brand, $model)->limit(200)->get(['annonces.prix', 'annonces.year', 'annonces.carburant']);
            $currentYear = (int) date('Y');
            $tier = $this->brandTier($brand);

            $projected = $ads->map(function ($ad) use ($currentYear, $tier) {
                $age = max($currentYear - (int) $ad->year, 0) + 0.5; // mid-year
                $fuel = strtolower((string) ($ad->carburant ?: 'essence'));
                $fuel = array_key_exists($fuel, VehicleValuationService::FUELS) ? $fuel : 'essence';
                $factor = $this->engine->residualFactor($age, $fuel, $tier)['factor'];
                return (float) $ad->prix / max($factor, 0.12);
            })->filter(fn ($v) => $v > 30000 && $v < 20000000)->values();

            if ($projected->count() > 0) {
                return [
                    'value'  => round($this->median($projected->all()), -2),
                    'source' => 'comparables',
                    'label'  => self::SOURCES['comparables'] . ' (' . $projected->count() . ' annonce' . ($projected->count() > 1 ? 's' : '') . ')',
                ];
            }
        } catch (\Throwable $e) {
            // ignore DB issues → grid
        }

        // 3) Indicative grid
        return [
            'value'  => (float) $this->gridValue($this->brandTier($brand), $this->category($model)),
            'source' => 'grid',
            'label'  => self::SOURCES['grid'],
        ];
    }

    /** Listings of the same brand + model, year ± 2 (market data for the confidence level). */
    private function comparables(string $brand, string $model, int $year): array
    {
        try {
            $prices = $this->listings($brand, $model)
                ->whereBetween('annonces.year', [$year - 2, $year + 2])
                ->limit(200)
                ->pluck('annonces.prix')
                ->map(fn ($p) => (float) $p)
                ->all();
        } catch (\Throwable $e) {
            $prices = [];
        }

        return ['count' => count($prices), 'median' => $prices ? round($this->median($prices), -2) : null];
    }

    private function listings(string $brand, string $model)
    {
        return Annonces::query()
            ->join('brands', 'brands.id', '=', 'annonces.mark')
            ->join('models', 'models.id', '=', 'annonces.modele')
            ->whereRaw('LOWER(brands.name) = ?', [strtolower($brand)])
            ->whereRaw('LOWER(models.name) = ?', [strtolower($model)])
            ->where('annonces.prix', '>', 10000)
            ->whereNotNull('annonces.year');
    }

    private function result(float $value, string $source, string $label, array $market): array
    {
        return [
            'value'              => $value,
            'source'             => $source,
            'source_label'       => $label,
            'comparables'        => $market['count'],
            'comparables_median' => $market['median'],
        ];
    }

    private function median(array $values): float
    {
        sort($values);
        $n = count($values);
        $mid = intdiv($n, 2);
        return $n % 2 ? $values[$mid] : ($values[$mid - 1] + $values[$mid]) / 2;
    }

    /** Price tier of a brand on the Moroccan market. */
    public function brandTier(string $brand): string
    {
        $b = strtolower(trim($brand));

        $tiers = [
            'ultra'      => ['rolls-royce', 'rolls royce', 'bentley', 'ferrari', 'lamborghini', 'aston martin', 'aston-martin', 'mclaren', 'bugatti', 'pagani', 'koenigsegg'],
            'luxury'     => ['mercedes', 'mercedes-benz', 'bmw', 'audi', 'porsche', 'land rover', 'land-rover', 'range rover', 'jaguar', 'lexus', 'maserati', 'tesla'],
            'premium'    => ['volvo', 'alfa romeo', 'alfa-romeo', 'mini', 'infiniti', 'ds', 'ds automobiles', 'genesis', 'jeep', 'cadillac', 'lincoln', 'acura'],
            'mainstream' => ['volkswagen', 'vw', 'peugeot', 'renault', 'citroen', 'citroën', 'toyota', 'honda', 'nissan', 'hyundai', 'kia', 'mazda', 'ford', 'opel', 'skoda', 'škoda', 'seat', 'fiat', 'mitsubishi', 'subaru', 'chevrolet', 'chrysler', 'dodge', 'gmc'],
            'budget'     => ['dacia', 'suzuki', 'chery', 'geely', 'changan', 'byd', 'mg', 'tata', 'great wall', 'haval', 'lada', 'proton', 'ssangyong', 'daewoo', 'isuzu', 'dfsk', 'foton'],
        ];
        foreach ($tiers as $tier => $brands) {
            if (in_array($b, $brands, true)) {
                return $tier;
            }
        }
        return 'mainstream';
    }

    /** Indicative new price (MAD) by tier × category – last-resort fallback. */
    private function gridValue(string $tier, string $category): int
    {
        $matrix = [
            'ultra'      => ['citadine' => 1200000, 'compacte' => 2000000, 'suv' => 2800000, 'luxe' => 4500000, 'pickup' => 2200000],
            'luxury'     => ['citadine' => 320000,  'compacte' => 480000,  'suv' => 720000,  'luxe' => 1300000, 'pickup' => 560000],
            'premium'    => ['citadine' => 250000,  'compacte' => 360000,  'suv' => 520000,  'luxe' => 950000,  'pickup' => 460000],
            'mainstream' => ['citadine' => 185000,  'compacte' => 270000,  'suv' => 380000,  'luxe' => 560000,  'pickup' => 400000],
            'budget'     => ['citadine' => 125000,  'compacte' => 180000,  'suv' => 250000,  'luxe' => 320000,  'pickup' => 270000],
        ];

        return $matrix[$tier][$category] ?? ($matrix['mainstream'][$category] ?? 250000);
    }

    /** Vehicle category: from existing listings' bodywork first, then model-name keywords. */
    public function category(string $model): string
    {
        $m = strtolower(trim($model));

        $bodywork = Cache::remember('veh_bodywork_' . md5($m), 3600, function () use ($m) {
            try {
                $row = Annonces::query()
                    ->join('models', 'models.id', '=', 'annonces.modele')
                    ->whereRaw('LOWER(models.name) = ?', [$m])
                    ->whereNotNull('annonces.bodywork')
                    ->select('annonces.bodywork')
                    ->groupBy('annonces.bodywork')
                    ->orderByRaw('COUNT(*) DESC')
                    ->first();
                return $row ? strtolower($row->bodywork) : null;
            } catch (\Throwable $e) {
                return null;
            }
        });

        if ($bodywork) {
            if (str_contains($bodywork, 'suv') || str_contains($bodywork, '4x4') || str_contains($bodywork, 'crossover')) return 'suv';
            if (str_contains($bodywork, 'pick') || str_contains($bodywork, 'utilitaire')) return 'pickup';
            if (str_contains($bodywork, 'citadine')) return 'citadine';
            if (str_contains($bodywork, 'coupe') || str_contains($bodywork, 'cabriolet') || str_contains($bodywork, 'sport')) return 'luxe';
        }

        if (preg_match('/(\bsuv\b|\bx[1-7]\b|\bq[1-8]\b|\bglc\b|\bgla\b|\bgle\b|\bgls\b|gl-?|tiguan|touareg|tucson|santa.?fe|sportage|sorento|qashqai|juke|captur|kadjar|ateca|kodiaq|3008|5008|cayenne|macan|rav4|cx-?[0-9]+|urus|range.?rover|discovery|evoque|velar|defender|x-trail|koleos|duster|bronco|explorer|edge|escape|equinox|trax|ecosport|kuga|kicks|qx|cla|ds[3-7]|xc[469]0|c-?hr|highlander|pilot|passport|cr-?v|hr-?v|bz4x|atlas|id\.?[3-7]|enyaq|mokka|grandland|jogger|bigster|karoq|arkana|niro|seltos|stonic|creta|venue|stelvio|tonale|compass|renegade|cherokee|wrangler|grand.?cherokee|gladiator|tiggo|emgrand|haval|boxer?|g-?class|classe.?g)/', $m)) {
            return 'suv';
        }
        if (preg_match('/(\bs-?class\b|classe.?s|\ba8\b|\bq8\b|\bls\b|panamera|continental|ghost|phantom|cullinan|mulsanne|wraith|dawn|spectre|model.?s|model.?x|taycan|\b911\b|\bgt\b|gtc|\bamg\b|\brs[0-9]\b|\bm[3-8]\b|serie.?7|serie.?8|maybach|aventador|huracan|urus|\bdb[0-9]+|dbs|vantage|roma|portofino|f8|sf90|giulia.?quad|\bi8\b|\bi7\b|\bix\b|\beqs\b|eqe)/', $m)) {
            return 'luxe';
        }
        if (preg_match('/(hilux|ranger|amarok|d-?max|navara|\bl200\b|pickup|pick.?up|frontier|tundra|tacoma)/', $m)) {
            return 'pickup';
        }
        if (preg_match('/(polo|clio|\b208\b|\b108\b|i10|i20|picanto|\brio\b|twingo|panda|\b500\b|\bup\b|aygo|fiesta|yaris|\bmii\b|kalos|aveo|spark|citigo|fabia|ibiza|swift|celerio|micra|sandero|logan|mii|\bka\b|lodgy|attrage|mirage|accent|\bi3\b)/', $m)) {
            return 'citadine';
        }

        return 'compacte';
    }
}
