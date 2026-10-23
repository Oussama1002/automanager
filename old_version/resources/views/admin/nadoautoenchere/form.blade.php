@extends('admin.layouts.app')

@section('title' , $encheres->exists ? 'Edit encheres' : 'New enchere')

@section('link')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/back/assets/css/uploader/image-uploader.min.css') }}">
@endsection
@section('content')
<div id="main-content">
      @if ($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($errors->all() as $e)
                <li>{{ $e }}</li>
            @endforeach
        </ul>
    </div>
@endif
<div class="page-heading">
    <h3>Auto Encheres</h3>
</div>
<div class="page-content">
    <section class="row">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"> Nouveau Auto Enchere</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
          <form 
    action="{{ $encheres->exists ? route('admin.nadoautoenchere.update', $encheres->id) : route('admin.nadoautoenchere.store') }}" 
    method="POST" 
    enctype="multipart/form-data">
    @csrf
    @method($encheres->exists ? 'PUT' : 'POST')

                            <div class="form-body">
                                <div class="row">
                                    @if($encheres->exists)
                                    <div class="col-12 my-2">
                                        <div class="form-check form-switch fs-6">
                                            <input class="form-check-input  me-0" type="checkbox" name="active" id="active" value="1" @if($encheres->active != 0) checked=""  @endif>
                                            <label class="form-check-label">Active</label>
                                        </div>
                                    </div>
                                    @endif
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Téléphone" , "type" => "text",  "value" => $encheres->phone, "name" => 'phone', ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Prix" , "type" => "text",  "value" => $encheres->prix, "name" => 'prix', ])
                                    </div>
                                    <div class="col-6 my-2">
    <div class="form-group">
        <label for="brand-select">Marque</label>
        <select id="brand-select"
                name="mark"
                class="form-control @error('mark') is-invalid @enderror">
            <option value="">Sélectionnez une marque</option>
            @foreach($brands as $brand)
                <option value="{{ $brand->id }}"
                    @if(old('mark', $encheres->mark ?? '') == $brand->id) selected @endif>
                    {{ $brand->name }}
                </option>
            @endforeach
        </select>
        @error('mark')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="col-6 my-2">
    <div class="form-group">
        <label for="model-select">Modèle</label>
        <select id="model-select"
                name="modele"
                class="form-control @error('modele') is-invalid @enderror">
            <option value="">Sélectionnez un modèle</option>
            {{-- Les modèles seront chargés dynamiquement par JS --}}
        </select>
        @error('modele')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>
 <div class="col-12 col-md-6 my-2">
    <div class="form-group col">
        <label for="starts_at">Date et heure de Demarrage</label>
        <input type="datetime-local" 
               id="starts_at" 
               name="starts_at" 
               class="form-control @error('starts_at') is-invalid @enderror"
               value="{{ old('starts_at', $encheres->starts_at ? \Carbon\Carbon::parse($encheres->starts_at)->format('Y-m-d\TH:i') : '') }}">
        @error('starts_at')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>
     
                                    <div class="col-12 col-md-6 my-2">
    <div class="form-group col">
        <label for="ends_at">Date et heure de fin</label>
        <input type="datetime-local" 
               id="ends_at" 
               name="ends_at" 
               class="form-control @error('ends_at') is-invalid @enderror"
               value="{{ old('ends_at', $encheres->ends_at ? \Carbon\Carbon::parse($encheres->ends_at)->format('Y-m-d\TH:i') : '') }}">
        @error('ends_at')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>
<div class="col-12 col-md-6 my-2">
    <div class="form-group col">
        <label for="matricule">Matricule</label>
        <input type="text" 
               id="matricule" 
               name="matricule" 
               class="form-control @error('matricule') is-invalid @enderror"
               placeholder="ex: 71134-H-6"
               value="{{ old('matricule', $encheres->matricule) }}">
        @error('matricule')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const matriculeInput = document.getElementById("matricule");

    matriculeInput.addEventListener("input", function (e) {
        let value = matriculeInput.value.toUpperCase().replace(/[^A-Z0-9]/g, ""); // uniquement lettres/chiffres

        // Format: 00000-X-00
        let formatted = "";

        if (value.length > 0) {
            formatted += value.substring(0, 5); // 5 chiffres
        }
        if (value.length > 5) {
            formatted += "-" + value.substring(5, 6); // 1 lettre
        }
        if (value.length > 6) {
            formatted += "-" + value.substring(6, 8); // 2 chiffres
        }

        matriculeInput.value = formatted;
    });
});
</script>

                                    <div class="col-6 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="city">Ville</label>
                                            <select class="form-control" name="city" id="city" required>
                                                <option value="">Sélectionner</option>
                                                @foreach($city as $c)
                                                    <option title="{{$c->name}}" value="{{$c->name}}" @selected($encheres->city == $c->name )>
                                                        {{$c->name}}
                                                    </option>
                                                @endforeach
                                            </select>

                                            @error('city')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                               
                                
                        
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="year">Année</label>
                                            <select class="form-control" name="year" id="year" required>
                                                <option value="">Sélectionner</option>
                                                @for ($i = date("Y"); $i >= 1992; $i--)
                                                    <option title="{{$i}}" value="{{$i}}" @selected($encheres->year == $i )>
                                                        {{$i}}
                                                    </option>
                                                @endfor
                                            </select>

                                            @error('year')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Km" , "type" => "text", "name" => 'km', "value" => $encheres->km, ])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="cv">Puissance fiscale</label>
                                            <select class="form-control" name="cv" id="cv" required>
                                                <option value="">Sélectionner</option>
                                                @for ($i = 2; $i <= 60; $i++)
                                                    <option title="{{$i}}" value="{{$i}}" @selected($encheres->cv == $i )>
                                                        {{$i}}
                                                    </option>
                                                @endfor
                                            </select>

                                            @error('cv')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Carburant" ,"name" => 'carburant', "value" => $encheres->carburant, "data" => ["" => "Sélectionner", "essence" => "Essence", "diesel" => "Diesel", "electrique" => "Electrique", "hybride" => "Hybride"]])
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Boite de vitesses" ,"name" => 'box', "value" => $encheres->box, "data" => ["" => "Sélectionner", "manuelle" => "Manuelle", "automatique" => "Automatique"]])
                                    </div>
                                   
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.select', ["class" => 'col', "label" => "Origine" ,"name" => 'origine', "value" => $encheres->origine, "data" => ["" => "Sélectionner", "dédouané" => "Dédouané", "WW au Maroc" => "WW au Maroc", "importé neuf" => "Importé neuf", "pas encore dédouané" => "Pas encore dédouané"]])
                                    </div>
                                 <div class="col-12 col-md-6 my-2">
    <div class="form-group col">
        <label for="nb_Door">Nombre de portes</label>
        <select class="form-control" name="nb_Door" id="nb_Door" required>
            <option value="">Sélectionner</option>
            @for ($i = 2; $i <= 6; $i++)
                <option title="{{ $i }}" value="{{ $i }}" @selected($encheres->nb_Door == $i)>
                    {{ $i }}
                </option>
            @endfor
        </select>

        @error('nb_Door')
            <div class="invalid-feedback">
                {{ $message }}
            </div>
        @enderror
    </div>
</div>

                                    <div class="col-12 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="bodywork">Carrosserie</label>
                                            <select class="form-control" id="bodywork" name="bodywork" >
                                                <option value="">Sélectionner</option>
                                                <option title="Cabriolet" value="coupé cabriolet" @selected($encheres->bodywork == "coupé cabriolet" )>COUPé CABRIOLET</option>
                                                <option title="Suv et 4x4" value="suv et 4x4" @selected($encheres->bodywork == "suv et 4x4" )>SUV ET 4X4</option>
                                                <option title="Citadine" value="citadine" @selected($encheres->bodywork == "citadine" )>CITADINE</option>
                                                <option title="Berline" value="berline" @selected($encheres->bodywork == "berline" )>BERLINE</option>
                                                <option title="Compact" value="compact" @selected($encheres->bodywork == "compact" )>COMPACT</option>
                                                <option title="Crossover" value="crossover" @selected($encheres->bodywork == "crossover" )>CROSSOVER</option>
                                                <option title="Pick up" value="pick up" @selected($encheres->bodywork == "pick up" )>PICK UP</option>
                                            </select>

                                            @error('bodywork')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
@include('admin.partials.select', [
    "class" => 'col',
    "label" => "Première main",
    "name" => 'premiere_main',
    "value" => $encheres->premiere_main,
    "data" => ["" => "Sélectionner", "0" => "Non", "1" => "Oui"]
])
                                    </div>
                                    <div class="col-6 col-md-6 my-2">
                                        <div class="form-group col">
                                            <label for="city">Couleur</label>
                              <select name="colors" id="color" class="form-control" required>
        <option value="">Sélectionnez une couleur</option>
        @foreach($colors as $color)
            <option value="{{ $color->name }}" 
                {{ old('colors', $encheres->colors) == $color->name ? 'selected' : '' }}>
                {{ $color->name }}
            </option>
        @endforeach
    </select>

                                            @error('city')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Titre" , "type" => "text",  "value" => $encheres->titre, "name" => 'titre', ])
                                    </div>

                                    <div class="col-12 col-md-6 my-2">
                                        @include('admin.partials.input', ["class" => 'col', "label" => "Reel" , "type" => "text",  "value" => $encheres->reel, "name" => 'reel', ])
                                    </div>
                               
                                   
{{-- SECTION OPTIONS --}}
<h4 class="mt-4">Options</h4>
<div class="row mb-3">
    <div class="col-12">
        <input type="checkbox" id="select-all-options" class="form-check-input">
        <label for="select-all-options">Tout sélectionner</label>
    </div>
</div>

<div class="row">
    @php
        $labels = [
            // Sécurité
            'airbags' => 'Airbags',
            'abs' => 'ABS',
            'esp' => 'ESP',
            'antipatinage' => 'Antipatinage',
            'aide_freinage_urgence' => "Aide au freinage d'urgence",
            'antidemarrage_electronique' => "Antidémarrage électronique",
            'aide_demarrage_cote' => "Aide au démarrage en côte",
            'selecteur_mode_conduite' => "Sélecteur de mode de conduite",
            'detection_fatigue' => "Détection de fatigue",
            'maintien_dans_la_voie' => "Maintien dans la voie",
            'detecteur_angle_mort' => "Détecteur d'angle mort",
            'detecteur_sous_gonflage' => "Détecteur de sous-gonflage",
            'fermeture_portes_auto' => "Fermeture de portes auto.",
            'preparation_isofix' => "Préparation ISOFIX",
            'phares_antibrouillard' => "Phares antibrouillard",
            'systeme_alarme' => "Système d’alarme",

            // Confort
            'climatisation' => 'Climatisation',
            'start_stop' => 'Start & Stop',
            'regulateur_vitesse' => 'Régulateur de vitesse',
            'detecteur_pluie' => 'Détecteur de pluie',
            'allumage_auto_feux' => 'Allumage auto. des feux',
            'frein_main_electrique' => 'Frein à main électrique',
            'aide_stationnement' => 'Aide au stationnement',
            'volant_reglable' => 'Volant réglable',
            'retros_electriques' => 'Rétros. électriques',
            'retros_rabat_electriques' => 'Rétros. rabattables électriques',
            'coffre_electrique' => 'Coffre électrique',
            'sieges_electriques' => 'Sièges électriques',
            'sieges_elec_memoire' => 'Sièges élec. avec mémoire',
            'banquette_rabattable' => 'Banquette arrière rabattable 1/3-2/3',

            // Multimédia
            'ecran_tactile' => 'Écran tactile',
            'camera_recul' => 'Caméra de recul',
            'cockpit_digital' => 'Cockpit digital',
            'commandes_volant' => 'Commandes au volant',
            'commandes_vocales' => 'Commandes vocales',
            'reconnaissance_panneaux' => 'Reconnaissance de panneaux',
            'affichage_tete_haute' => 'Affichage Tête-Haute',
            'systeme_audio' => 'Système audio',
            'ordinateur_bord' => 'Ordinateur de bord',
            'gps' => 'Navigation GPS',
            'wifi_bord' => 'WiFi à bord',
            'bluetooth' => 'Bluetooth',
            'compatibilite_smartphone' => 'Compatibilité smartphone',
            'apple_carplay_android_auto' => 'Apple CarPlay® & Android Auto®',
            'chargeur_sans_fil' => 'Chargeur/mobile sans fil',

            // Design & Extérieur
            'jantes_aluminium' => 'Jantes aluminium',
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
    @endphp

    @foreach ($labels as $field => $label)
        <div class="col-6 col-md-3 my-2">
            <div class="form-check form-switch">
                <input class="form-check-input option-checkbox"
                       type="checkbox"
                       id="{{ $field }}"
                       name="{{ $field }}"
                       value="1"
                       @if(!empty($encheres) && $encheres->$field == 1) checked @endif>
                <label class="form-check-label" for="{{ $field }}">{{ $label }}</label>
            </div>
        </div>
    @endforeach
</div>

<div class="col-12 col-md-12 my-2">
    <div class="form-group col">
        <label for="images">Photos</label>
        <div class="choose-file text-center py-2 rounded bg-white">
            <div class="input-images"></div>
        </div>
    </div>
</div>

{{-- Rapport PDF --}}
<div class="col-6 my-2">
    <div class="form-group">
        <label for="rapport">Rapport PDF</label>
        <input type="file" name="rapport" id="rapport" class="form-control @error('rapport') is-invalid @enderror" accept="application/pdf">
        @error('rapport')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
        @if($encheres->rapport)
            <embed src="{{ asset('storage/nadoautoenchere/pdf/'.$encheres->rapport) }}" type="application/pdf" width="40%" />
        @endif
    </div>
</div>

                                   
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">
                                            @if ($encheres->exists)
                                                Update
                                            @else
                                                Add new Annonce
                                            @endif
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
</div>
@endsection
@section('script')
<script src="{{ asset('assets/back/assets/js/uploader/image-uploader.min.js') }}"></script>

<script>
$(document).ready(function() {

    // === Select All Options ===
    $('#select-all-options').on('change', function() {
        $('.option-checkbox').prop('checked', $(this).is(':checked'));
    });

    // === Brand / Model dynamic loading ===
    const brandSelect = $('#brand-select');
    const modelSelect = $('#model-select');

    function loadModels(brandId, selectedModelId = null) {
        if(!brandId){
            modelSelect.html('<option value="">Sélectionnez un modèle</option>');
            return;
        }

        modelSelect.html('<option value="">Chargement...</option>');

        $.getJSON('/client/models-by-brand/' + brandId, function(data){
            let options = '<option value="">Sélectionnez un modèle</option>';
            $.each(data, function(i, model){
                let selected = (selectedModelId && selectedModelId == model.id) ? 'selected' : '';
                options += `<option value="${model.id}" ${selected}>${model.name}</option>`;
            });
            modelSelect.html(options);
        }).fail(function(){
            modelSelect.html('<option value="">Erreur de chargement</option>');
        });
    }

    // On brand change
    brandSelect.change(function(){
        loadModels($(this).val());
    });

    // Preload old value after validation fail or edit
    @if(old('mark'))
        loadModels("{{ old('mark') }}", "{{ old('modele') }}");
    @elseif($encheres->mark)
        loadModels("{{ $encheres->mark }}", "{{ $encheres->modele }}");
    @endif

    // === Image uploader ===
let preloaded = [
    @if($encheres->images)
        @foreach($encheres->images as $index => $img)
            {id: {{ $index }}, src: "{{ asset('storage/nadoautoenchere/'.$img) }}" },
        @endforeach
    @endif
];



    $('.input-images').imageUploader({
        preloaded: preloaded,
        imagesInputName: 'images',
        preloadedInputName: 'old_images'
    });

});
</script>

@endsection
