<?php

namespace App\Http\Controllers;

use App\Models\Annonces;
use App\Models\Avistext;
use App\Models\Avisvideos;
use App\Models\Publication;
use App\Models\NadoAutoEnchere;
use Illuminate\Support\Str;
use App\Models\Modele;
use App\Models\CarTarifier;
use App\Models\Brand;
use App\Models\Imgslider;
use App\Models\Article;
use App\Models\Story;

use App\Models\Videosads;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class FrontController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $articles = Article::where('is_active', 1)
    ->orderBy('created_at', 'desc')
    ->limit(2)
    ->get();

        $leftBanner = Publication::where('placement', 'left-banner')->where('status', true)->first();
        $rightBanner = Publication::where('placement', 'right-banner')->where('status', true)->first();
        $videoAds = Videosads::latest()->take(6)->get(); // 👈 Add this line
        $stories = Story::latest()->take(6)->get();

        $centerBanner = Publication::where('placement', 'center-banner')->where('status', true)->first();
        $imgslider = Cache::remember('Imgslider', 86400, function () {
            return Imgslider::where('active', 1)->limit(6)->get();
        });
$autoEncheres = Cache::remember('autoEncheres', 86400, function () {
        return NadoAutoEnchere::where('active', 1)
            ->orderBy('created_at', 'desc')
            ->limit(6)
            ->get();
    });
        $vdAds = Cache::remember('vdAds', 86400, function () {
            return Videosads::orderBy('id', 'desc')->limit(6)->get();
        });

        $avistext = Cache::remember('avistext', 86400, function () {
            return Avistext::orderBy('id', 'desc')->limit(6)->get();
        });
        $avisvideos = Cache::remember('avisvideos', 86400, function () {
            return Avisvideos::orderBy('id', 'desc')->limit(6)->get();
        });
   $brands = Cache::remember('brands', 86400, function () {
    return Brand::all()->filter(function ($brand) {
        return \App\Models\Annonces::where('mark', $brand->name)->exists();
    });
});


    $similar_adsp = Cache::remember('similar_adsp', 86400, function () {
    return Annonces::where('active', 1)
        ->where('status', 'disponible')
        ->where('particulie', 1) // And particulier
        ->where('certifie', 0) // Only NOT certified
        ->orderBy('id', 'desc')
        ->limit(9)
        ->get();
});

$similar_ads = Cache::remember('similar_ads', 86400, function () {
    return Annonces::where('active', 1)
        ->where('status', 'disponible')
        ->where('certifie', 1) // Certified
        ->orderBy('id', 'desc')
        ->limit(9)
        ->get();
});


        return view('front', ['imgslider' => $imgslider,    'articles'      => $articles,
        'autoEncheres' => $autoEncheres,
 'vdAds' => $vdAds, 'avistext' => $avistext, 'avisvideos' => $avisvideos, 'brands' => $brands,
            'similar_ads' => $similar_ads, 'videoAds' =>$videoAds, 'stories' => $stories, 'leftBanner' => $leftBanner, 'rightBanner' => $rightBanner, 'centerBanner' => $centerBanner,'similar_adsp' => $similar_adsp, 'formatDate' => function ($date) {
                return $this->formatDateLabel($date);
            }]);
    }
    
public function articlesList()
{
    $articles = Article::where('is_active', 1)
        ->orderBy('created_at', 'desc')
        ->paginate(10); // or get() if you want all

    return view('articles.index', compact('articles'));
}

public function articleShow(string $slug)
{
    $article = Article::where('slug', $slug)
        ->where('is_active', 1)
        ->firstOrFail();

    return view('articles.article-show', compact('article'));
}

public function estimate(Request $r)
{
    // -------------------------------
    // 1️⃣ Validation
    // -------------------------------
    $r->validate([
        'brand'          => 'required|string',
        'model'          => 'required|string',
        'year'           => 'required|integer|min:1990|max:' . date('Y'),
        'fuel'           => 'required|string',
        'engine'         => 'required|string',
        'km'             => 'required|numeric|min:0',
        'purchase_price' => 'required|numeric|min:10000',
        'gearbox'        => 'nullable|string',
        'accident'       => 'nullable|boolean',
    ]);

    // -------------------------------
    // 2️⃣ Normalize inputs
    // -------------------------------
    $brand         = trim($r->brand);
    $model         = trim($r->model);
    $fuel          = strtolower(trim($r->fuel)); // diesel / essence
    $year          = (int)$r->year;
    $km            = (int)$r->km;
    $engine        = trim($r->engine);
    $gearbox       = $r->gearbox ?? null;
    $accident      = (bool)($r->accident ?? false);
    $purchasePrice = (float)$r->purchase_price;

    // -------------------------------
    // 3️⃣ Theoretical new price
    // -------------------------------
    $prixNeuf = $this->estimateTheoreticalNewPrice($brand, $model);

    $age = max(date('Y') - $year, 1);

    // -------------------------------
    // 4️⃣ Year-based depreciation (%)
    // -------------------------------
    $depreciationRate = 0.0;

    if ($age == 1) {
        $depreciationRate = $fuel === 'diesel' ? 0.20 : 0.25;
    } elseif ($age == 2) {
        $depreciationRate = $fuel === 'diesel' ? 0.15 : 0.18;
    } elseif ($age == 3) {
        $depreciationRate = $fuel === 'diesel' ? 0.10 : 0.12;
    } elseif ($age == 4) {
        $depreciationRate = 0.10; // same for both
    } else { // 5+ years
        $extraYears = $age - 4;
        $annual     = $fuel === 'diesel' ? 0.05 : 0.07;
        $depreciationRate = 0.10 + ($extraYears * $annual);
    }

    $baseValue = $prixNeuf * (1 - $depreciationRate);

    // -------------------------------
    // 5️⃣ Technical value (km adjustment)
    // -------------------------------
    $category = $this->getVehicleCategory($model);

    $kmRate = $this->getKmRate($category, $fuel);

    $averageKm = $age * 15000; // standard km per year
    $kmDiff = $km - $averageKm;

    $technicalValue = -($kmDiff * $kmRate);

    // -------------------------------
    // 6️⃣ Apply technical value
    // -------------------------------
    $marketValue = $baseValue + $technicalValue;

    // -------------------------------
    // 7️⃣ Engine multiplier
    // -------------------------------
    $engineMultiplier = match ($engine) {
        '0.9', '1.0' => 0.92,
        '1.2', '1.4' => 1.00,
        '1.5', '1.6' => 1.03,
        '1.8', '2.0' => 1.06,
        default      => 1.08,
    };

    $marketValue *= $engineMultiplier;

    // -------------------------------
    // 8️⃣ Fuel adjustment
    // -------------------------------
    switch ($fuel) {
        case 'diesel':       $marketValue *= 1.02; break;
        case 'hybride':      $marketValue *= 1.06; break;
        case 'electrique':   $marketValue *= 1.10; break;
        case 'gpl':          $marketValue *= 0.95; break;
        default: break; // essence
    }

    // -------------------------------
    // 9️⃣ Gearbox bonus
    // -------------------------------
    if ($gearbox === 'Automatique') {
        $marketValue *= 1.03;
    }

    // -------------------------------
    // 🔟 Accident penalty
    // -------------------------------
    if ($accident) {
        $marketValue *= 0.60;
    }

    // -------------------------------
    // 1️⃣1️⃣ Purchase price CAP
    // -------------------------------
    $finalValue = min($marketValue, $purchasePrice * 1.05);

    // -------------------------------
    // 1️⃣2️⃣ Absolute floor (15% of new price)
    // -------------------------------
    $finalValue = max($finalValue, $prixNeuf * 0.15);

    // -------------------------------
    // 1️⃣3️⃣ Round and return
    // -------------------------------
    $finalValue = round($finalValue, -2);

    return response()->json([
        'source' => 'table_based_model',
        'estimate' => [
            'value' => (int)$finalValue,
            'currency' => 'MAD',
        ],
    ]);
}

// -------------------------------
// Map model to category
// -------------------------------
private function getVehicleCategory($model)
{
    $model = strtolower($model);

    $citadines = ['polo', 'clio', '208'];
    $compactes = ['a3', 'golf', 'serie 3', 'a4', 'a6'];
    $suv      = ['tiguan', 'q5', 'glc'];
    $luxe     = ['serie 7', 'q8', 'range rover'];

    if (in_array($model, $citadines)) return 'citadine';
    if (in_array($model, $compactes)) return 'compacte';
    if (in_array($model, $suv)) return 'suv';
    if (in_array($model, $luxe)) return 'luxe';
    return 'compacte'; // default
}

// -------------------------------
// Km rate per category & fuel
// -------------------------------
private function getKmRate($category, $fuel)
{
    $rates = [
        'citadine' => ['essence' => 0.40, 'diesel' => 0.55],
        'compacte' => ['essence' => 0.80, 'diesel' => 1.10],
        'suv'      => ['essence' => 1.50, 'diesel' => 2.00],
        'luxe'     => ['essence' => 3.00, 'diesel' => 4.50],
    ];

    return $rates[$category][$fuel] ?? 1.0;
}


private function estimateTheoreticalNewPrice($brand, $model)
{
    $map = [
        'audi_a4' => 420000,
        'audi_a3' => 350000,
        'bmw_serie_3' => 450000,
        'mercedes_c' => 460000,
    ];

    $key = strtolower($brand . '_' . str_replace(' ', '_', $model));

    return $map[$key] ?? 380000; // default premium sedan
}

private function getDepreciationRate($age, $fuel)
{
    $fuel = strtolower($fuel);

    if ($age <= 1) {
        return $fuel === 'diesel' ? 0.20 : 0.25;
    } elseif ($age == 2) {
        return $fuel === 'diesel' ? 0.35 : 0.43;
    } elseif ($age == 3) {
        return $fuel === 'diesel' ? 0.45 : 0.55;
    } elseif ($age == 4) {
        return $fuel === 'diesel' ? 0.55 : 0.65;
    } else {
        // After 5 years: linear depreciation
        $base = $fuel === 'diesel' ? 0.55 : 0.65;
        $extraYears = $age - 4;
        $annual = $fuel === 'diesel' ? 0.05 : 0.07;

        return min($base + ($extraYears * $annual), 0.85);
    }
}
private function calculateTechnicalValue($km, $age, $category, $fuel)
{
    $averageKm = $age * 15000;
    $diff = $km - $averageKm;

    $rate = $this->getKmRate($category, $fuel);

    return -($diff * $rate);
}

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public static function formatDateLabel($date)
    {

        $datediff = time() - strtotime($date);
        $tm = 60;
        $res = round($datediff / $tm);
        $tt = 'minutes';

        if ($res == 0) {
            $res = 1;
        }

        if ($res > 50) {
            $res = round($datediff / ($tm * 60));
            $tt = 'heures';
            if ($res > 23) {
                $res = round($datediff / ($tm * 60 * 24));
                $tt = 'jours';
                if ($res > 30) {
                    $res = round($datediff / ($tm * 60 * 24 * 30));
                    $tt = 'mois';
                    if ($res >= 12) {
                        $res = round($datediff / ($tm * 60 * 24 * 30 * 12));
                        $tt = 'ans';
                    }
                }
            }
        }

        return 'Il y a '.$res.' '.$tt;

    }
}
