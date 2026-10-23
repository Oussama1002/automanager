@extends('layouts.client')

@section('client_title', 'Modifier une annonce')
@section('client_subtitle', 'Mettez à jour les informations de votre annonce.')
@section('client_content')
<div class="container">
@if ($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($errors->all() as $e)
                <li>{{ $e }}</li>
            @endforeach
        </ul>
    </div>
@endif

    <h1 class="mb-4">Modifier une Annonce</h1>

    <form action="{{ route('client.annonces.update', $annonce->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        {{-- SECTION 1 : Informations générales --}}
        <h4 class="mt-4">Informations Générales</h4>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Titre</label>
                <input type="text" name="titre" class="form-control"
                       value="{{ old('titre', $annonce->titre) }}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label>Prix (DH)</label>
                <input type="number" name="prix" class="form-control"
                       value="{{ old('prix', $annonce->prix) }}" required>
            </div>
        </div>

        {{-- SECTION 2 : Véhicule --}}
        <h4 class="mt-4">Détails du Véhicule</h4>
        <div class="row">
            <div class="col-md-4 mb-3">
                <label>Marque</label>
                <select name="mark" id="brand-select" class="form-control" required>
                    <option value="">Choisissez une marque</option>
                    @foreach($brands as $brand)
                        <option value="{{ $brand->id }}"
                            {{ old('mark', $annonce->mark) == $brand->id ? 'selected' : '' }}>
                            {{ $brand->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-4 mb-3">
                <label>Modèle</label>
                <select name="modele" id="model-select" class="form-control" required>
                    <option value="">Sélectionnez un modèle</option>
                </select>
            </div>
            <div class="col-md-4 mb-3">
    <label for="matricule" class="form-label">Matricule</label>
    <input type="text" name="matricule" id="matricule" class="form-control" 
           value="{{ old('matricule') }}" placeholder="Entrez le matricule">
    @error('matricule')
        <span class="text-danger">{{ $message }}</span>
    @enderror
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
          <div class="col-md-4 mb-3">
    <label for="color">Couleur</label>
    <select name="colors" id="color" class="form-control" required>
        <option value="">Sélectionnez une couleur</option>
        @foreach($colors as $color)
            <option value="{{ $color->name }}" 
                {{ old('colors', $annonce->colors) == $color->name ? 'selected' : '' }}>
                {{ $color->name }}
            </option>
        @endforeach
    </select>
</div>

            <div class="col-md-4 mb-3">
                <label>Kilométrage</label>
                <input type="number" name="km" class="form-control"
                       value="{{ old('km', $annonce->km) }}" required>
            </div>

            <div class="col-md-4 mb-3">
                <label>CV</label>
                <input type="number" name="cv" class="form-control"
                       value="{{ old('cv', $annonce->cv) }}" required>
            </div>

            <div class="col-md-4 mb-3">
                <label>Nombre de Portes</label>
                <select name="nb_Door" class="form-control" required>
                    <option value="">Sélectionnez</option>
                    <option value="3" {{ old('nb_Door', $annonce->nb_Door) == 3 ? 'selected' : '' }}>3 portes</option>
                    <option value="5" {{ old('nb_Door', $annonce->nb_Door) == 5 ? 'selected' : '' }}>5 portes</option>
                </select>
            </div>

            <div class="col-md-4 mb-3">
                <label>Année</label>
                <select name="year" class="form-control" required>
                    <option value="">Sélectionnez l'année</option>
                    @for ($y = date('Y'); $y >= 1990; $y--)
                        <option value="{{ $y }}"
                            {{ old('year', $annonce->year) == $y ? 'selected' : '' }}>
                            {{ $y }}
                        </option>
                    @endfor
                </select>
            </div>

            <div class="col-md-4 mb-3">
                <label>Origine</label>
                <select name="origine" class="form-control" required>
                    <option value="">Sélectionnez</option>
                    <option value="WW au Maroc" {{ old('origine', $annonce->origine) == "WW au Maroc" ? 'selected' : '' }}>WW au Maroc</option>
                    <option value="dédouané" {{ old('origine', $annonce->origine) == "dédouané" ? 'selected' : '' }}>Dédouané</option>
                </select>
            </div>

            <div class="col-md-4 mb-3">
                <label>Première Main</label>
                <select name="premiere_main" class="form-control" required>
                    <option value="">Sélectionnez</option>
                    <option value="Oui" {{ old('premiere_main', $annonce->premiere_main) == "Oui" ? 'selected' : '' }}>Oui</option>
                    <option value="Non" {{ old('premiere_main', $annonce->premiere_main) == "Non" ? 'selected' : '' }}>Non</option>
                </select>
            </div>

            <div class="col-md-4 mb-3">
                <label>État</label>
                <select name="etat" class="form-control" required>
                    <option value="">Sélectionnez</option>
                    <option value="Neuf" {{ old('etat', $annonce->etat) == "Neuf" ? 'selected' : '' }}>Neuf</option>
                    <option value="Très bon état" {{ old('etat', $annonce->etat) == "Très bon état" ? 'selected' : '' }}>Très bon état</option>
                    <option value="Bon état" {{ old('etat', $annonce->etat) == "Bon état" ? 'selected' : '' }}>Bon état</option>
                    <option value="Accidenté" {{ old('etat', $annonce->etat) == "Accidenté" ? 'selected' : '' }}>Accidenté</option>
                </select>
            </div>

            <div class="col-md-4 mb-3">
                <label>Carburant</label>
                <select name="carburant" class="form-control" required>
                    <option value="">Sélectionnez</option>
                    <option value="diesel" {{ old('carburant', $annonce->carburant) == "diesel" ? 'selected' : '' }}>Diesel</option>
                    <option value="essence" {{ old('carburant', $annonce->carburant) == "essence" ? 'selected' : '' }}>Essence</option>
                    <option value="hybride" {{ old('carburant', $annonce->carburant) == "hybride" ? 'selected' : '' }}>Hybride</option>
                    <option value="electrique" {{ old('carburant', $annonce->carburant) == "electrique" ? 'selected' : '' }}>Électrique</option>
                </select>
            </div>

            <div class="col-md-4 mb-3">
                <label>Boîte</label>
                <select name="box" class="form-control" required>
                    <option value="">Sélectionnez</option>
                    <option value="automatique" {{ old('box', $annonce->box) == "automatique" ? 'selected' : '' }}>Automatique</option>
                    <option value="manuelle" {{ old('box', $annonce->box) == "manuelle" ? 'selected' : '' }}>Manuelle</option>
                </select>
            </div>
            <div class="col-md-4 mb-3">
            

            <div class="col-md-4 mb-3">
                <label>Ville</label>
                <select name="city" class="form-control" required>
                    <option value="">Sélectionnez une ville</option>
                    @foreach ($villes as $ville)
                        <option value="{{ $ville->name }}"
                            {{ old('city', $annonce->city) == $ville->name ? 'selected' : '' }}>
                            {{ $ville->name }}
                        </option>
                    @endforeach
                </select>
            </div>
        </div>
{{-- SECTION 3 : Options --}}
<h4 class="mt-4">Options</h4>

<div class="mb-2">
    <input type="checkbox" id="checkAllOptions" class="form-check-input">
    <label for="checkAllOptions" class="form-check-label fw-bold text-primary">Tout sélectionner</label>
</div>

<div class="row">
    @php
           $options = [
            // Sécurité
    'airbags' => 'Airbags',
    'abs' => 'ABS',
    'esp' => 'ESP',
    'antipatinage' => 'Antipatinage',
    'aide_freinage_urgence' => "Aide au freinage d'urgence",
    'antidemarrage' => "Antidémarrage électronique",
    'aide_demarrage_cote' => "Aide au démarrage en côte",
    'selecteur_mode_conduite' => "Sélecteur de mode de conduite",
    'detection_fatigue' => "Détection de fatigue",
    'maintien_voie' => "Maintien dans la voie",
    'detecteur_angle_mort' => "Détecteur d'angle mort",
    'detecteur_sous_gonflage' => "Détecteur de sous-gonflage",
    'fermeture_auto' => "Fermeture de portes auto.",
    'isofix' => "Préparation ISOFIX",
    'phares_antibrouillard' => "Phares antibrouillard",
    'alarme' => "Système d’alarme",

    // Confort
    'climatisation' => 'Climatisation',
    'start_stop' => 'Start & Stop',
    'regulateur_vitesse' => 'Régulateur de vitesse',
    'detecteur_pluie' => 'Détecteur de pluie',
    'allumage_auto' => 'Allumage auto. des feux',
    'frein_main_elec' => 'Frein à main électrique',
    'aide_stationnement' => 'Aide au stationnement',
    'volant_reglable' => 'Volant réglable',
    'vitres_elec' => 'Vitres électriques',
    'retros_elec' => 'Rétros. électriques',
    'retros_rab_elec' => 'Rétros. rabattables électriques',
    'coffre_elec' => 'Coffre électrique',
    'sieges_elec' => 'Sièges électriques',
    'sieges_mem' => 'Sièges élec. avec mémoire',
    'banquette_rab' => 'Banquette arrière rabattable 1/3-2/3',

    // Multimédia
    'ecran_tactile' => 'Écran tactile',
    'camera_recul' => 'Caméra de recul',
    'park_assist' => 'Park Assist Auto.',
    'cockpit_digital' => 'Cockpit digital',
    'cmd_volant' => 'Commandes au volant',
    'cmd_vocale' => 'Commandes vocales',
    'reco_panneaux' => 'Reconnaissance de panneaux',
    'affichage_tete_haute' => 'Affichage Tête-Haute',
    'systeme_audio' => 'Système audio',
    'ordinateur_bord' => 'Ordinateur de bord',
    'gps' => 'Navigation GPS',
    'wifi' => 'WiFi à bord',
    'bluetooth' => 'Bluetooth',
    'smartphone' => 'Compatibilité smartphone',
    'carplay_android' => 'Apple CarPlay® & Android Auto®',
    'chargeur_sans_fil' => 'Chargeur/mobile sans fil',

    // Design
    'jantes_aluminium' => 'Jantes aluminium',
    'sellerie' => 'Sellerie Similicuir / Tissu',
    'volant_cuir' => 'Volant cuir',
    'follow_me_home' => 'Follow-me home',
    'lumiere_ambiance' => "Lumière d'ambiance",
    'feux_jour_led' => 'Feux de jour LED',
    'phares_led' => 'Phares Full LED',
    'toit_panoramique' => 'Toit Panoramique ouvrant',
    'barres_toit' => 'Barres de toit',
    'vitres_teintees' => 'Vitres sur-teintées',
        ];
    @endphp

    @foreach ($options as $field => $label)
        <div class="col-md-3 mb-2 form-check">
            <input type="checkbox"
                   class="form-check-input option-checkbox"
                   id="{{ $field }}"
                   name="{{ $field }}"
                   value="1"
                   {{ old($field, $annonce->$field) ? 'checked' : '' }}>
            <label class="form-check-label" for="{{ $field }}">{{ $label }}</label>
        </div>
    @endforeach
</div>

       <div class="form-group mt-4">
    <label for="images">Images</label>
    <div id="image-uploader" class="dropzone"></div>

   <div class="mt-3 d-flex flex-wrap gap-2">
    @foreach (['image','imgrleft','imgrtop','imgrmed','imgrbottom','imgrright','imginterior','imgrapport'] as $col)
        @if(!empty($annonce->$col))
            <div class="position-relative">
                <img src="{{ asset('storage/annonces/'.$annonce->$col) }}" width="120" class="rounded border">
                <button type="button" class="btn btn-sm btn-danger position-absolute top-0 end-0 delete-image"
                        data-field="{{ $col }}">X</button>
            </div>
        @endif
    @endforeach
</div>

</div>


{{-- Modal packs --}}
<div class="modal fade" id="packModal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Choisir un Pack</h5></div>
      <div class="modal-body row">
        @foreach($packs as $pack)
          <div class="col-md-4">
            <div class="card p-3 {{ $annonce->pack_id == $pack->id ? 'border-success' : '' }}">
              <h5>{{ $pack->name }}</h5>
              <p>{{ $pack->description }}</p>
              <button type="button" class="btn btn-outline-primary select-pack"
                      data-id="{{ $pack->id }}">Choisir</button>
            </div>
          </div>
        @endforeach
      </div>
    </div>
  </div>
</div>

        <div class="mt-4">
            <button type="submit" class="btn btn-success">Mettre à jour</button>
            <a href="{{ route('client.annonces.index') }}" class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const brandSelect = document.getElementById('brand-select');
    const modelSelect = document.getElementById('model-select');
    const checkAll = document.getElementById('checkAllOptions');
    const optionCheckboxes = Array.from(document.querySelectorAll('input.option-checkbox'));

    function loadModels(brandId, selectedModelId = null) {
        if (!brandId) {
            modelSelect.innerHTML = '<option value="">Sélectionnez un modèle</option>';
            return;
        }

        modelSelect.innerHTML = '<option value="">Chargement...</option>';

        fetch(`/client/models-by-brand/${brandId}`)
            .then(response => {
                if (!response.ok) throw new Error('Network error');
                return response.json();
            })
            .then(data => {
                modelSelect.innerHTML = '<option value="">Sélectionnez un modèle</option>';
                data.forEach(model => {
                    const isSelected = selectedModelId && selectedModelId.toString() === model.id.toString();
                    const opt = document.createElement('option');
                    opt.value = model.id;
                    opt.textContent = model.name;
                    if (isSelected) opt.selected = true;
                    modelSelect.appendChild(opt);
                });
            })
            .catch(() => {
                modelSelect.innerHTML = '<option value="">Erreur de chargement</option>';
            });
    }

    // Quand la marque change
    if (brandSelect) {
        brandSelect.addEventListener('change', function () {
            loadModels(this.value);
        });
    }

    // Si on a une ancienne sélection après validation échouée, pré-remplir
    @if(old('mark'))
        loadModels("{{ old('mark') }}", "{{ old('modele') }}");
    @endif

    // Tout sélectionner / désélectionner
    function updateMasterCheckbox() {
        if (!checkAll) return;
        const allChecked = optionCheckboxes.every(cb => cb.checked);
        checkAll.checked = allChecked;
    }

    if (checkAll) {
        checkAll.addEventListener('change', function () {
            optionCheckboxes.forEach(cb => cb.checked = this.checked);
        });
    }

    optionCheckboxes.forEach(cb => {
        cb.addEventListener('change', updateMasterCheckbox);
    });

    // initialisation de l'état du master
    updateMasterCheckbox();
});
</script>
{{-- garde tes scripts JS identiques à create --}}
@endsection
