<?php

namespace App\Services\Valuation;

/**
 * Usual versions / finitions per brand on the Moroccan market, for the estimation form.
 * Not exhaustive: the form always offers "Autre (préciser)" for anything missing.
 * To add a brand or a finition, edit BY_BRAND (key = brand name in lowercase, no accents).
 */
class VehicleTrims
{
    public const GENERIC = ['Standard', 'Confort', 'Luxe', 'Premium', 'Sport'];

    public const BY_BRAND = [
        'dacia'         => ['Access', 'Essential', 'Ambiance', 'Lauréate', 'Confort', 'Expression', 'Prestige', 'Stepway', 'Journey', 'Extreme'],
        'renault'       => ['Life', 'Zen', 'Business', 'Limited', 'Intens', 'Evolution', 'Techno', 'Iconic', 'RS Line', 'Esprit Alpine', 'Initiale Paris'],
        'peugeot'       => ['Access', 'Like', 'Active', 'Active Pack', 'Style', 'Business', 'Allure', 'Allure Pack', 'GT Line', 'GT', 'GT Pack'],
        'citroen'       => ['Live', 'Feel', 'Feel Pack', 'C-Series', 'Shine', 'Shine Pack', 'Plus', 'Max'],
        'ds'            => ['Bastille', 'So Chic', 'Performance Line', 'Rivoli', 'Opera', 'La Première'],
        'volkswagen'    => ['Trendline', 'Comfortline', 'Life', 'Highline', 'Style', 'Carat', 'Elegance', 'R-Line', 'GTI', 'R'],
        'skoda'         => ['Active', 'Ambition', 'Style', 'Sportline', 'Monte Carlo', 'Laurin & Klement', 'RS'],
        'seat'          => ['Reference', 'Style', 'Xcellence', 'FR'],
        'cupra'         => ['V', 'VZ', 'VZ5'],
        'audi'          => ['Base', 'Design', 'Business Line', 'Advanced', 'Sport', 'Ambition Luxe', 'S line', 'Avus', 'RS'],
        'bmw'           => ['Base', 'Business Design', 'Lounge', 'Sport Line', 'Luxury Line', 'xLine', 'M Sport', 'M'],
        'mercedes'      => ['Classic', 'Business', 'Style', 'Progressive', 'Avantgarde', 'Elegance', 'Exclusive', 'AMG Line', 'AMG'],
        'mini'          => ['One', 'Cooper', 'Cooper S', 'Classic', 'Yours', 'John Cooper Works'],
        'porsche'       => ['Base', 'S', '4S', 'GTS', 'Turbo', 'Turbo S'],
        'land rover'    => ['S', 'SE', 'HSE', 'R-Dynamic S', 'R-Dynamic SE', 'R-Dynamic HSE', 'Dynamic SE', 'Dynamic HSE', 'Autobiography', 'First Edition'],
        'jaguar'        => ['S', 'SE', 'HSE', 'R-Dynamic', 'R-Dynamic SE', 'R-Dynamic HSE'],
        'volvo'         => ['Kinetic', 'Momentum', 'Core', 'Plus', 'Inscription', 'R-Design', 'Ultimate'],
        'toyota'        => ['Active', 'Dynamic', 'Business', 'Design', 'Premium', 'Lounge', 'Collection', 'GR Sport'],
        'lexus'         => ['Pack', 'Business', 'Executive', 'F Sport', 'Luxury'],
        'hyundai'       => ['Base', 'Pack Confort', 'Business', 'Premium', 'Executive', 'Luxury', 'N Line'],
        'kia'           => ['Active', 'Motion', 'Design', 'Premium', 'Launch Edition', 'GT Line'],
        'nissan'        => ['Visia', 'Acenta', 'N-Connecta', 'N-Design', 'Tekna', 'Tekna+'],
        'ford'          => ['Trend', 'Titanium', 'Active', 'ST-Line', 'Vignale', 'XLT', 'Wildtrak', 'Limited'],
        'opel'          => ['Edition', 'Business', 'Elegance', 'GS', 'GS Line', 'Ultimate'],
        'fiat'          => ['Pop', 'Easy', 'Lounge', 'Mirror', 'Cross', 'City Cross', 'Sport', 'Dolcevita'],
        'jeep'          => ['Sport', 'Longitude', 'Limited', 'Night Eagle', 'S', 'Trailhawk', 'Summit'],
        'suzuki'        => ['GA', 'GL', 'GLX', 'Pack'],
        'mitsubishi'    => ['Invite', 'Intense', 'Instyle', 'Instyle+'],
        'honda'         => ['Comfort', 'Elegance', 'Sport', 'Executive', 'Advance'],
        'mazda'         => ['Prime-Line', 'Centre-Line', 'Exclusive-Line', 'Homura', 'Takumi'],
        'alfa romeo'    => ['Super', 'Sprint', 'Ti', 'Veloce', 'Quadrifoglio'],
        'mg'            => ['Standard', 'Comfort', 'Luxury'],
        'chery'         => ['Standard', 'Comfort', 'Luxury', 'Premium'],
        'geely'         => ['Standard', 'Comfort', 'Luxury', 'Premium'],
        'byd'           => ['Active', 'Boost', 'Comfort', 'Design', 'Excellence'],
        'tesla'         => ['Propulsion', 'Grande Autonomie', 'Performance'],
    ];

    /** Common spellings of the same brand → catalogue key. */
    private const ALIASES = [
        'mercedes benz' => 'mercedes',
        'vw'            => 'volkswagen',
        'range rover'   => 'land rover',
        'landrover'     => 'land rover',
        'alfa'          => 'alfa romeo',
        'ds automobiles'=> 'ds',
    ];

    /** Finitions for a brand name as stored in the brands table (generic list if unknown). */
    public static function forBrand(string $brand): array
    {
        $key = self::normalize($brand);
        $key = self::ALIASES[$key] ?? $key;

        return !empty(self::BY_BRAND[$key]) ? self::BY_BRAND[$key] : self::GENERIC;
    }

    /** brand name => finitions, for every brand of the form. */
    public static function forBrands(iterable $brandNames): array
    {
        $map = [];
        foreach ($brandNames as $name) {
            $map[$name] = self::forBrand((string) $name);
        }
        return $map;
    }

    private static function normalize(string $brand): string
    {
        $brand = mb_strtolower(trim($brand));
        $brand = strtr($brand, ['é' => 'e', 'è' => 'e', 'ë' => 'e', 'ê' => 'e', 'ö' => 'o', 'š' => 's', '-' => ' ']);
        return preg_replace('/\s+/', ' ', $brand);
    }
}
