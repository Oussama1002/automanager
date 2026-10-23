<?php

namespace App\Http\Controllers\Admin;
use App\Notifications\AdminNotification;
use Illuminate\Support\Facades\Notification;
use App\Http\Controllers\Controller;
use App\Http\Requests\AdsRequest;
use App\Models\Annonces;
use App\Models\Brand;
use App\Models\Color;
use App\Models\Media;
use App\Models\Ville;
use Illuminate\Http\Request;
use App\Models\Accessoire;
use App\Models\Client;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
// use Intervention\Image\Drivers\Imagick\Driver;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;
use App\Models\Autoenchere;
use Illuminate\Support\Facades\Auth;
class AnnoncesController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin', ['only' => ['index', 'show', 'create', 'store', 'update', 'edit', 'destroy']]);
    }

    /**
     * Display a listing of the resource.
     */
    public function approval()
    {
        $pendingAnnonces = Annonces::where('active', false)->get();
    
        return view('admin.ads.approval', compact('pendingAnnonces'));
    }   
public function proposerPrix(Request $request, $id)
{
     if (!Auth::guard('client')->check()) {
        return redirect()->route('client.login')->with('error', 'Veuillez vous connecter pour proposer un prix.');
    }
    Notification::route('mail', 'oussamaelhadi11@gmail.com')
    ->notify(new AdminNotification(
        'Nouvelle Offre',
        'Une nouvelle Proposition a été ajoutée.'
    ));
    $request->validate([
        'proposition' => 'required|integer|min:1000',
    ]);

    Autoenchere::create([
        'annonce_id' => $id,
        'client_id' => Auth::guard('client')->id(),
        'proposition' => $request->input('proposition'),
    ]);

    return back()->with('success', 'Votre proposition a été envoyée avec succès ✅');
}
public function toggleHomepage(Request $request)
{
    $ad = Annonces::findOrFail($request->id);

    // Update the is_homepage flag
    $ad->is_homepage = $request->is_homepage ? 1 : 0;
    $ad->save();

    // Optionally: clear cache if homepage ads are cached
    Cache::forget('homepage_ads');

    return response()->json(['success' => true]);
}

    public function index()
    {
        return view('admin.ads.index', ['ads' => Annonces::all(), 'brands' => Brand::all(), 'city' => ville::all(), 'colors' => color::all()]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.ads.form', ['ads' => new Annonces, 'brands' => Brand::all(), 'city' => ville::all(), 'colors' => color::all()]);
    }

    
    public function approve($id)
    {
        $ad = Annonces::findOrFail($id);
        $ad->active = true;
        $ad->save();

        return back()->with('success', 'Annonce approuvée avec succès.');
    }
    /**
     * Store a newly created resource in storage.
     */
 public function store(AdsRequest $request)
{
    $request->validate([
        'matricule' => 'nullable|unique:annonces,matricule',
    ]);
    $ads = $request->validated();

    $ads['is_homepage'] = $request->has('is_homepage') ? 1 : 0;
    $ads['active'] = 1;
    $ads['views'] = 0;

 $images = [];
       if ($request->hasFile('uploaded_images')) {  // Changed from 'images' to 'uploaded_images'
           foreach ($request->file('uploaded_images') as $file) {  // Changed here too
               $filename = Str::slug($ads['mark'].'-'.$ads['modele'], '-') 
                          .'-'.rand(100000,999999).'.'.$file->getClientOriginalExtension();
               $file->storeAs('public/ads', $filename);
               $images[] = $filename;
           }
       }

$ads['images'] = $images; // let Laravel handle JSON casting

    if ($request->hasFile('rapport')) {
        $rapportName = $ads['mark'].'-'.$ads['modele'].'-'.rand(100000,999999).'.'.$request->rapport->extension(); // ✅ ici $ads
        $request->rapport->move(storage_path('app/public/pdf/'), $rapportName);

        $ads['rapport'] = $rapportName; // ✅ ici $ads
    }

    Cache::forget('similar_adsAll');
    Cache::forget('similar_adsp');
    Cache::forget('similar_ads');

    $ad = Annonces::create($ads);
 // ✅ Save images also to Media table
    if ($request->hasFile('uploaded_images')) {  // Changed here too
           foreach ($request->file('uploaded_images') as $file) {
               $this->resizeImage($file, $ads['mark'].'-'.$ads['modele'], $ad->id);
           }
       }
    return to_route('annonces.index')->with('success', 'Success store brand');
}


    /**
     * Display the specified resource.
     */
    public function show($id)
{
    $annonce = Annonces::with(['media', 'entretiens'])->findOrFail($id);
 // Map database boolean/integer flags to human-readable labels
$labels = [
    // Sécurité
    'airbags' => 'Airbags',
    'abs' => 'ABS',
    'esp' => 'ESP',
    'antipatinage' => 'Antipatinage',
    'aide_freinage_urgence' => "Aide au freinage d'urgence",
    'antidemarrage' => 'Antidémarrage électronique',
    'aide_demarrage_cote' => "Aide au démarrage en côte",
    'selecteur_mode_conduite' => 'Sélecteur de mode de conduite',
    'detection_fatigue' => 'Détection de fatigue',
    'maintien_voie' => 'Maintien dans la voie',
    'detecteur_angle_mort' => "Détecteur d'angle mort",
    'detecteur_sous_gonflage' => "Détecteur de sous-gonflage",
    'fermeture_auto' => 'Fermeture de portes auto.',
    'isofix' => 'Préparation ISOFIX',
    'phares_antibrouillard' => 'Phares antibrouillard',
    'alarme' => 'Système d’alarme',

    // Confort
    'climatisation' => 'Climatisation',
    'start_stop' => 'Start & Stop',
    'regulateur_vitesse' => 'Régulateur de vitesse',
    'detecteur_pluie' => 'Détecteur de pluie',
    'allumage_auto' => 'Allumage auto. des feux',
    'frein_main_electriques' => 'Frein à main électrique',
    'aide_stationnement' => 'Aide au stationnement',
    'volant_reglable' => 'Volant réglable',
    'vitres_electriques' => 'Vitres électriques',
    'retros_electriques' => 'Rétros. électriques',
    'retros_rabat_electriques' => 'Rétros. rabattables électriques',
    'coffre_electriques' => 'Coffre électrique',
    'sieges_electriques' => 'Sièges électriques',
    'sieges_mem' => 'Sièges élec. avec mémoire',
    'banquette_rab' => 'Banquette arrière rabattable 1/3-2/3',

    // Multimédia
    'ecran_tactile' => 'Écran tactile',
    'camera_recul' => 'Caméra de recul',
    'cockpit_digital' => 'Cockpit digital',
    'commandes_volant' => 'Commandes au volant',
    'commandes_vocales' => 'Commandes vocales',
    'reconnaissance_panneaux' => 'Reconnaissance de panneaux',
    'affichage_tete_haute' => 'Affichage Tête-Haute',
    'systeme_audio' => 'Système audio',
    'gps' => 'Navigation GPS',
    'wifi_bord' => 'WiFi à bord',
    'bluetooth' => 'Bluetooth',
    'compatibilite_smartphone' => 'Compatibilité smartphone',
    'apple_carplay_android_auto' => 'Apple CarPlay® & Android Auto®',
    'chargeur_sans_fil' => 'Chargeur/mobile sans fil',

    // Design & Extérieur
    'jantesA' => 'Jantes aluminium',
    'sellerie_similicuir_tissu' => 'Sellerie Similicuir / Tissu',
    'volant_cuir' => 'Volant cuir',
    'follow_me_home' => 'Follow-me home',
    'lumiere_ambiance' => "Lumière d'ambiance",
    'feux_jour_led' => 'Feux de jour LED',
    'phares_full_led' => 'Phares Full LED',
    'toit_panoramique' => 'Toit Panoramique ouvrant',
    'barres_de_toit' => 'Barres de toit',
    'vitres_surteintees' => 'Vitres sur-teintées',
];


    $equipements = collect($labels)
        ->filter(function ($label, $field) use ($annonce) {
            // Accept truthy values (1, true, non-empty)
            return !empty($annonce->$field) && intval($annonce->$field) === 1;
        })
        ->values()
        ->all();
            $accessoires = Accessoire::where('status', true)->latest()->get();


    return view('annonces.detail', compact('annonce', 'equipements', 'accessoires'));
}

public function showAnnonce($id)
{
    $annonces = Annonces::find($id);

        return view('admin.ads.showAnnonce', [
            'ads' => $annonces,
            'brands' => Brand::all(),
            'city' => ville::all(),
            'colors' => color::all(),
        ]);
}
    // public function show(string $id)
    // {
    //     //
    // }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $annonces = Annonces::find($id);

        return view('admin.ads.form', [
            'ads' => $annonces,
            'brands' => Brand::all(),
            'city' => ville::all(),
            'colors' => color::all(),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
   public function update(AdsRequest $request, $id)
{
       $ad = Annonces::findOrFail($id);

    $adsData = $request->safe()->except(['phone']); // exclude phone from bulk update
$adsData['is_homepage'] = $request->has('is_homepage') ? 1 : 0;

$checkboxes = [
    'active', 'garantie','certifie','showroom','finance','particulie',
    // Sécurité
    'airbags','abs','esp','antipatinage','aide_freinage_urgence',
    'antidemarrage_electronique','aide_demarrage_cote','selecteur_mode_conduite',
    'detection_fatigue','maintien_dans_la_voie','detecteur_angle_mort',
    'detecteur_sous_gonflage','fermeture_portes_auto','preparation_isofix',
    'phares_antibrouillard','systeme_alarme',

    // Confort
    'climatisation','start_stop','regulateur_vitesse','detecteur_pluie',
    'allumage_auto_feux','frein_main_electrique','aide_stationnement',
    'volant_reglable','retros_electriques','retros_rabat_electriques',
    'coffre_electrique','sieges_electriques','sieges_elec_memoire','banquette_rabattable',

    // Multimédia
    'ecran_tactile','camera_recul','cockpit_digital',
    'commandes_volant','commandes_vocales','reconnaissance_panneaux',
    'affichage_tete_haute','systeme_audio','gps',
    'wifi_bord','bluetooth','compatibilite_smartphone',
    'apple_carplay_android_auto','chargeur_sans_fil',

    // Design & Extérieur
    'jantesA','sellerie_similicuir_tissu','volant_cuir','follow_me_home',
    'lumiere_ambiance','feux_jour_led','phares_full_led','toit_panoramique',
    'barres_de_toit','vitres_surteintees'
];


foreach ($checkboxes as $checkbox) {
    $ad->$checkbox = $request->has($checkbox) ? 1 : 0;
}


   // Update ad without touching phone/client relationship

$adsData = $request->safe()->except(['phone']);

// Prevent overwriting with null
$adsData['mark']   = $request->input('mark')   ?? $ad->mark;
$adsData['modele'] = $request->input('modele') ?? $ad->modele;

$images = is_array($ad->images) ? $ad->images : json_decode($ad->images, true) ?? [];

if ($request->hasFile('images')) {
    foreach ($request->file('images') as $file) {
        $filename = Str::slug($ad->mark.'-'.$ad->modele,'-').'-'.rand(100000,999999).'.'.$file->getClientOriginalExtension();
        $file->storeAs('public/ads', $filename);
        $images[] = $filename;
    }
}

// Merge with old_images input
if ($request->old_images) {
    $images = array_merge($images, $request->old_images);
}

// ✅ No json_encode
$ad->images = $images;

// Handle rapport
if ($request->hasFile('rapport')) {
    $rapportName = $adsData['mark'].'-'.$adsData['modele'].'-'.rand(100000,999999).'.'.$request->rapport->extension();
    $request->rapport->move(storage_path('app/public/pdf/'), $rapportName);
    $adsData['rapport'] = $rapportName;
}

// Update other fields
$ad->update($adsData);
// ✅ Store new images in Media table too
if ($request->hasFile('images')) {
    foreach ($request->file('images') as $file) {
        $this->resizeImage($file, $ad->mark.'-'.$ad->modele, $ad->id);
    }
}


return to_route('annonces.index')->with('success', 'Success update brand');

}


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        Annonces::where('id', $id)->delete();

        return to_route('annonces.index')->with('success', 'Annonce deleted successfully');
    }

    /**
     * Remove the specified resource from storage image.
     */
    public function deleteImage($id)
    {
        $media = Media::find($id);
        $media->delete();

        return '1';
    }

    public function resizeImage($imagefile, $title, $idAds)
    {

        $media = new Media;
        $image = $imagefile;
        $name = Str::slug($title, '-').'-'.rand(100000, 999999).'.'.$image->getClientOriginalExtension();
        $manager = new ImageManager(new Driver);
        $img = $manager->read($image);
        $img->save(storage_path('app/public/ads/'.$name));
        $media->name = $name;
        $media->annonces_id = $idAds;
        $media->save();
    }

    public function ImageCar($photo, $title)
    {
        $image = $photo;
        $imageName = Str::slug($title, '-').'-'.rand(100000, 999999).'.'.$image->getClientOriginalExtension();
        $manager = new ImageManager(new Driver);
        $img = $manager->read($image);
        $img->save(storage_path('app/public/ads/'.$imageName));

        return $imageName;
    }
}
