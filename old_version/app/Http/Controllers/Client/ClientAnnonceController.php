<?php

namespace App\Http\Controllers\Client;
use App\Models\Annonces;
use App\Models\Pack;

use Illuminate\Support\Facades\Auth;
use App\Notifications\AdminNotification;
use Illuminate\Support\Facades\Notification;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use App\Models\Color;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;
use App\Http\Requests\AdsRequest;
use Illuminate\Support\Facades\Cache;
use App\Models\Media;
use Illuminate\Support\Str;

use App\Models\Client;

use App\Models\Modele;
use App\Models\Ville;


class ClientAnnonceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
public function index()
{
    $clientPhone = Auth::guard('client')->user()->phone;

    $annonces = Annonces::where('phone', $clientPhone)
        ->where('status', 'disponible')
        ->get();

    return view('client.annonces.index', compact('annonces'));
}


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $brands = Brand::all();
        $models = modele::all();
        $packs = Pack::all();
        $colors = Color::all();

        $villes = Ville::all(); // ← ici on récupère les villes



        // récupère toutes les marques depuis la BDD
        return view('client.annonces.create', compact('brands','models', 'packs', 'villes','colors'));
    }
    public function proposerPrix(Request $request, $id)
{
    Notification::route('mail', 'oussamaelhadi11@gmail.com')
    ->notify(new AdminNotification(
        'Nouvelle autoenchère',
        'Une nouvelle autoenchère a été ajoutée.'
    ));
    $request->validate([
        'prix_propose' => 'required|numeric|min:0'
    ]);

    // Sauvegarder ou traiter le prix proposé (exemple basique)
    // Tu peux créer un modèle `PrixPropose` pour le stocker en base
    return back()->with('success', 'Votre prix a été soumis avec succès.');
}

    /**
     * Store a newly created resource in storage.
     */
public function store(AdsRequest $request)
{
    $ads = $request->validated();

    // Labels for equipment (keep as in your original)
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

$videoPath = null;

if ($request->hasFile('video')) {
    $videoPath = $request->file('video')->store('annonces/videos', 'public');
    $ads['video'] = $videoPath;  // ✅ SAVE IT HERE
}


    $equipements = collect($labels)
        ->filter(fn($label, $field) => !empty($ads->$field) && intval($ads->$field) === 1)
        ->values()
        ->all();

    // Base ad data
    $ads['phone'] = Auth::guard('client')->user()->phone;
    $ads['verified'] = false;
    $ads['is_homepage'] = 0;
    $ads['active'] = 0;
    $ads['views'] = 0;
    $ads['status'] = 'disponible';
    $ads['pack_id'] = $request->pack_id;
  // ✅ FIX: Normalize uploaded_images to array
// ✅ Handle uploaded images from Dropzone
    $uploaded = $request->input('uploaded_images', []); // array of filenames
    $images = [];

if (!empty($uploaded)) {
    foreach ($uploaded as $filename) {
        $tempPath = "temp/{$filename}";
        if (Storage::disk('public')->exists($tempPath)) {
            $finalPath = "ads/{$filename}";
            Storage::disk('public')->move($tempPath, $finalPath);
            $images[] = $filename;
        }
    }
}

    // Handle rapport file
    if ($request->hasFile('rapport')) {
        $rapportName = $ads['mark'].'-'.$ads['modele'].'-'.rand(100000,999999).'.'.$request->rapport->extension();
        $request->rapport->move(storage_path('app/public/pdf/'), $rapportName);
        $ads['rapport'] = $rapportName;
    }

$ads['images'] = $images;

$annonce = Annonces::create(array_merge($ads, [
    'images' => json_encode($images, JSON_UNESCAPED_SLASHES)
]));

    // Resize images like admin side
    if (!empty($images)) {
        foreach ($images as $filename) {
            $filePath = storage_path("app/public/ads/{$filename}");
            if (file_exists($filePath)) {
                $this->resizeImage(new \Illuminate\Http\File($filePath), $ads['mark'].'-'.$ads['modele'], $annonce->id);
            }
        }
    }
    // Save images JSON to DB
  // just ensure DB value is JSON encoded
    // $annonce->images = json_encode($images, JSON_UNESCAPED_SLASHES);
    // $annonce->save();

    // Notify admin
    // Notification::route('mail', 'contact@nado.ma')
    //     ->notify(new AdminNotification(
    //         'Nouvelle annonce en attente',
    //         "Bonjour,\n\nUne nouvelle offre a été placée sur la plateforme.\n\n".
    //         "Détails de l'offre :\n\n".
    //         "Véhicule : {$annonce->mark} {$annonce->modele} ({$annonce->matricule})\n".
    //         "Client : ".Auth::guard('client')->user()->name."\n".
    //         "Prix de l'offre : {$annonce->prix} MAD\n\n".
    //         "Pour consulter les détails de l'enchère et gérer les offres, veuillez vous connecter à votre tableau de bord administrateur.\n\n".
    //         "Cordialement,\nL'équipe AUTO ENCHÈRE"
    //     ));

    // Clear cache
    Cache::forget('similar_adsAll');
    Cache::forget('similar_adsp');
    Cache::forget('similar_ads');

    return redirect()->route('client.dashboard')
        ->with('success', "Votre annonce a été soumise. Elle sera visible après validation par l'administrateur.");
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

public function uploadTemp(Request $request)
{
    if ($request->hasFile('file')) {
        $file = $request->file('file');
        $filename = uniqid() . '.' . $file->getClientOriginalExtension();
        // Save to temp folder inside public disk
        $path = $file->storeAs('temp', $filename, 'public');
        return response()->json(['filename' => $filename, 'path' => $path]);
    }
    return response()->json(['error' => 'No file uploaded'], 400);
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
  public function edit($id)
{
    $annonce = Annonces::findOrFail($id);
    $brands = Brand::all();
    $models = Modele::all();
    $packs = Pack::all();
    $colors = Color::all();
    $villes = Ville::all();

    return view('client.annonces.edit', compact(
        'annonce',
        'brands',
        'models',
        'packs',
        'colors',
        'villes'
    ));
}


    /**
     * Update the specified resource in storage.
     */
public function update(Request $request, $id)
{
    $annonce = Annonces::findOrFail($id);

    $request->validate([
        'titre' => 'required|string|max:255',
        'prix' => 'required|numeric',
        'pack_id' => 'required|exists:packs,id',
        'mark' => 'required|exists:brands,id',
        'modele' => 'required',
    ]);

    $brand = Brand::find($request->mark);
    $modele = Modele::find($request->modele);

    $brandName = $brand?->name ?? $request->mark;
    $modeleName = $modele?->name ?? $request->modele;
  // Take only the fields you want to update
    $data = $request->only([
        'titre','prix','pack_id','year','km','carburant','box','etat','nb_Door','city','cv','origine','premiere_main','colors'
    ]);
    $data = $request->all();
    $data['active'] = 0;

    $data['mark'] = $brandName;
    $data['modele'] = $modeleName;
$annonce->pack_id = $request->pack_id;
$annonce->save();

    // Upload images only if new files are provided
    foreach (['image','imgrleft','imgrtop','imgrmed','imgrbottom','imgrright','imginterior'] as $imgField) {
        if ($request->hasFile($imgField)) {
            $file = $request->file($imgField);
            $filename = time().'_'.$file->getClientOriginalName();
            $file->storeAs('public/ads', $filename);
            $data[$imgField] = $filename;
        } else {
            // Keep the old image if no new file uploaded
            $data[$imgField] = $annonce->$imgField;
        }
    }

    $annonce->update($data);

    return redirect()->route('client.dashboard')->with('success', 'Annonce mise à jour avec succès.');
}

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
