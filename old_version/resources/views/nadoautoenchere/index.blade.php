@extends('layouts.app')

@section('title', 'Auto Enchères')

@section('content')
<div class="container-fluid py-4 bg-light">
    <div class="row">
        <!-- Left Column: Searching Cars -->
        <div class="col-lg-3 d-none d-lg-block">
            <div class="card shadow-sm border-0 p-3">
    <h5 class="fw-bold mb-3">Recherche</h5>
        <form method="GET" action="{{ route('nadoautoenchere.index') }}" class="searching-form" >
    @csrf

    {{-- Keep the selected category --}}
    @if(request()->has('category'))
        <input type="hidden" name="category" value="{{ request('category') }}">
    @endif

    <!-- Marque -->
    <select class="form-control nado-marks" name="mark">
        <option value="">Marque</option>
        @foreach($brands as $brand)
            <option value="{{ $brand->id }}" {{ request('mark') == $brand->id ? 'selected' : '' }}>
                {{ $brand->name }}
            </option>
        @endforeach
    </select>

    <!-- Modèle -->
    <select class="form-control nado-models" name="modele" id="modele">
        <option value="">Modèle</option>
        @foreach($modeles as $model)
            <option value="{{ $model->id }}" {{ request('modele') == $model->id ? 'selected' : '' }}>
                {{ $model->name }}
            </option>
        @endforeach
    </select>

    <!-- Année -->
    <select class="form-control" name="year">
        <option value="">Année</option>
        @for ($i = date("Y"); $i >= 1992; $i--)
            <option value="{{ $i }}" {{ request('year') == $i ? 'selected' : '' }}>{{ $i }}</option>
        @endfor
    </select>

    <!-- Carburant -->
    <select class="form-control" name="carburant">
        <option value="">Carburant</option>
        <option value="Essence" {{ request('carburant') == 'Essence' ? 'selected' : '' }}>Essence</option>
        <option value="Diesel" {{ request('carburant') == 'Diesel' ? 'selected' : '' }}>Diesel</option>
        <option value="Hybride" {{ request('carburant') == 'Hybride' ? 'selected' : '' }}>Hybride</option>
        <option value="Electrique" {{ request('carburant') == 'Electrique' ? 'selected' : '' }}>Électrique</option>
    </select>

    <!-- Boîte -->
    <select class="form-control" name="box">
        <option value="">Boîte de vitesse</option>
        <option value="Manuelle" {{ request('box') == 'Manuelle' ? 'selected' : '' }}>Manuelle</option>
        <option value="Automatique" {{ request('box') == 'Automatique' ? 'selected' : '' }}>Automatique</option>
    </select>

    <!-- État -->
    <select class="form-control" name="etat">
        <option value="">État</option>
        <option value="Neuf" {{ request('etat') == 'Neuf' ? 'selected' : '' }}>Neuf</option>
        <option value="Occasion" {{ request('etat') == 'Occasion' ? 'selected' : '' }}>Occasion</option>
    </select>

    <!-- Ville -->
    <select class="form-control" name="city">
        <option value="">Ville</option>
        @foreach($cities as $city)
            <option value="{{ $city }}" {{ request('city') == $city ? 'selected' : '' }}>{{ $city }}</option>
        @endforeach
    </select>





    

        <button type="submit" class="btn btn-primary w-100">Recherche</button>
    </form>
</div>

        </div>

        <!-- Main Content -->
        <div class="col-lg-7">
            <h4 class="fw-bold mb-4">{{ $encheres->count() }} Véhicules disponibles</h4>

            @forelse ($encheres as $enchere)
                <div class="card mb-5 shadow-sm border-0 rounded-3 overflow-hidden">
                    <div class="row g-0 align-items-stretch">
                        <!-- Image -->
                        <div class="col-md-5 position-relative mb-5" style="min-height:200px; overflow:hidden;">
                            <img
                                src="{{ asset('storage/nadoautoenchere/' . ($enchere->images[0] ?? 'default.jpg')) }}"
                                alt="{{ $enchere->brand?->name }} {{ $enchere->modeleRelation?->name }}"
                                style="width:100%; height:100%; object-fit:cover; display:block;"
                                class="img-fluid">

                            <!-- Countdown -->
                          <span class="badge bg-danger position-absolute bottom-0 end-0 m-2 countdown"
                              data-end="{{ $enchere->ends_at }}">
                            @if($enchere->remaining)
                                Termine dans : {{ $enchere->remaining->days }}j {{ $enchere->remaining->h }}h {{ $enchere->remaining->i }}m
                            @else
                                No end date
                            @endif
                        </span>
                        </div>

                        <!-- Info -->
                        <div class="col-md-7 d-flex flex-column p-3">
                            <h5 class="fw-bold text-dark mb-2"style=" font-size: 30px !important;">
                                {{ strtoupper($enchere->brand?->name ?? '') }}
                                {{ strtoupper($enchere->modeleRelation?->name ?? '') }}
                            </h5>

                            <div class="mb-2 d-flex justify-content-between">
                                <small class="text-muted">Année</small>
                                <small class="text-dark">{{ $enchere->year ?? 'N/A' }}</small>
                            </div>

                            <!-- <div class="mb-2 d-flex justify-content-between">
                                <small class="text-muted">Carburant</small>
                                <small class="text-dark">{{ $enchere->carburant ?? 'N/A' }}</small>
                            </div> -->

                            <div class="mb-2 d-flex justify-content-between">
                                <small class="text-muted">Kilométrage</small>
                                <small class="text-dark">{{ number_format($enchere->km ?? 0, 0, ',', ' ') }} km</small>
                            </div>

                            <div class="mb-2 d-flex justify-content-between">
                                <small class="text-muted">Puissance</small>
                                <small class="text-dark">{{ $enchere->puissance ?? 'N/A' }} kW ({{ $enchere->cv ?? 'N/A' }} ch)</small>
                            </div>

                        
                            <div class="mb-3 d-flex justify-content-between align-items-center">
                                <small class="text-muted">Origine</small>
                                <small class="text-dark">
                                    {{ $enchere->origine ?? 'N/A' }}
                                    @if($enchere->origine_flag)
                                        <img src="{{ asset('flags/' . $enchere->origine_flag . '.png') }}" width="20" class="ms-2" alt="flag">
                                    @endif
                                </small>
                            </div>

                            <h2 class="h6 text-muted mb-1">Prix Estimé</h2>
                            <h3 class="text-primary fw-bold mb-3">{{ number_format($enchere->prix ?? 0, 0, ',', ' ') }} MAD</h3>

                            <div class="mt-auto">
                                <a href="{{ route('nadoautoenchere.show', $enchere->id) }}" class="btn btn-outline-primary">Voir Détails</a>
                            </div>
                        </div>
                    </div>
                </div>
            @empty
                <p class="text-muted">Aucune enchère trouvée.</p>
            @endforelse
        </div>

        <!-- Right Banner -->
        <div class="col-lg-2 d-none d-lg-block">
             @if($rightonindexenchereBanner)
            <div class="mb-4">
                        <img src="{{ asset('storage/' . $rightonindexenchereBanner->image) }}" class="pub-banner" alt="Pub Droite">

            </div>
                @endif
<style>
      .pub-banner {
        width: 205px;
        height: 805px;
        object-fit: cover;
    }

    @media(max-width: 991px) {
        .pub-banner {
            display: none;
        }
    }
</style>
        </div>
    </div>
</div>
<style>
    @media (min-width: 992px) {
    .col-md-7 {
        width: 34.333333% !important;
    }
}
@media (min-width: 992px) {
    .col-md-5 {
        width: 65.666667%;
    }
}
</style>
@endsection

@push('scripts')
<script>
document.addEventListener("DOMContentLoaded", function () {
    const countdowns = document.querySelectorAll(".countdown");
    countdowns.forEach(function (el) {
        function update() {
            const endAttr = el.dataset.end;
            if (!endAttr) { el.textContent = '—'; return; }
            const endTime = new Date(endAttr).getTime();
            if (isNaN(endTime)) { el.textContent = '—'; return; }
            const now = Date.now();
            const diff = endTime - now;
            if (diff <= 0) { el.textContent = "Expirée"; return; }
            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);
            el.textContent = `${days}j ${hours}h ${minutes}m ${seconds}s`;
        }
        update();
        setInterval(update, 1000);
    });
});
</script>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const brandSelects = document.querySelectorAll('select.nado-marks');
    const modelSelects = document.querySelectorAll('select.nado-models');

    function loadModels(brandId, modelSelect) {
        if (!brandId) {
            modelSelect.innerHTML = '<option value="">Modele</option>';
            return;
        }
        modelSelect.innerHTML = '<option value="">Chargement...</option>';
        fetch(`/client/models-by-brand/${brandId}`)
            .then(response => response.json())
            .then(data => {
                modelSelect.innerHTML = '<option value="">Modele</option>';
                data.forEach(model => {
                    const opt = document.createElement('option');
                    opt.value = model.name;
                    opt.textContent = model.name;
                    modelSelect.appendChild(opt);
                });
            })
            .catch(() => {
                modelSelect.innerHTML = '<option value="">Erreur de chargement</option>';
            });
    }

    brandSelects.forEach(brandSelect => {
        brandSelect.addEventListener('change', function () {
            const selectedBrandId = this.selectedOptions[0].dataset.id;
            const modelSelect = this.closest('form').querySelector('select.nado-models');
            loadModels(selectedBrandId, modelSelect);
        });
    });
});
</script>
@endpush
