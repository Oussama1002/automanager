@extends('layouts.app')

@section('title', 'Auto Enchères - Catégories')

@section('content')
<div class="container-fluid py-4 bg-light">
    <div class="row">
        <!-- Left Column: Searching Cars -->
        <div class="col-lg-3 d-none d-lg-block">
    <div class="card shadow-sm border-0 p-3">
    <h5 class="fw-bold mb-3">Recherche</h5>
    <form class="searching-form" action="{{ route('nadoautoenchere.categories') }}" method="get">
        @csrf

        <!-- Company Name -->
        <div class="mb-3">
            <label class="form-label">Nom de l'entreprise</label>
<input type="text" class="form-control" id="company-search" name="company" placeholder="Recherche par entreprise" autocomplete="off">
<div id="company-suggestions" class="list-group position-absolute w-100"></div>
        </div>

        <!-- Marque -->
        <div class="mb-3">
            <label class="form-label">Marque</label>
<!-- Marque -->
<select class="form-control nado-marks" name="mark" id="mark">
    <option value="">Toutes les marques</option>
    @foreach($brands as $brand)
        <option value="{{ $brand->id }}">{{ $brand->name }}</option>
    @endforeach
</select>
        </div>

        <!-- Modèle -->
        <div class="mb-3">
            <label class="form-label">Modèle</label>
<!-- Modèle -->
<select class="form-control nado-models" name="modele" id="modele">
    <option value="">Tous les modèles</option>
</select>
        </div>

        <!-- Ville -->
        <div class="mb-3">
            <label class="form-label">Ville</label>
<select class="form-control" name="city" id="city">
                <option value="">Toutes les villes</option>
                @foreach($cities as $city)
                    <option value="{{ $city }}">{{ $city }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Recherche</button>
    </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('mark').addEventListener('change', function() {
        let brandId = this.options[this.selectedIndex].dataset.id;
        fetch(`/client/models-by-brand/${brandId}`)
            .then(res => res.json())
            .then(data => {
                let modeleSelect = document.getElementById('modele');
                modeleSelect.innerHTML = '<option value="">Tous les modèles</option>';
               data.forEach(m => {
    modeleSelect.innerHTML += `<option value="${m.id}">${m.name}</option>`;
});

            });
    });
});
</script>

        </div>

        <!-- Main Content: Categories -->
        <div class="col-lg-7">
            <h4 class="fw-bold mb-4">{{ $categories->count() }} Catégories disponibles</h4>

 @forelse ($categories as $category)
    @php
        $enchere = \App\Models\NadoAutoEnchere::where('phone', $category->phone)
                    ->where('active', 1)
                    ->orderBy('ends_at', 'asc')
                    ->first();
        $ended = $enchere && $enchere->ends_at ? \Carbon\Carbon::parse($enchere->ends_at)->isPast() : true;
        $remaining = $enchere?->ends_at ? \Carbon\Carbon::parse($enchere->ends_at)->timestamp : null;
        $endsAtFormatted = $enchere?->ends_at ? \Carbon\Carbon::parse($enchere->ends_at)->format('d/m/Y H:i') : '-';
    @endphp

    <div class="card category-card mb-5 shadow-sm border-0 rounded-3 overflow-hidden {{ $ended ? 'disabled-card' : '' }}" 
         style="cursor: {{ $ended ? 'not-allowed' : 'pointer' }}; transition: transform 0.3s, box-shadow 0.3s;"
         data-ends="{{ $remaining }}">
        <div class="row g-0 align-items-center p-3">
            <!-- Logo / Image gauche -->
            <div class="col-md-2 d-flex align-items-center justify-content-center">
                <div style="width:120px; height:50px; overflow:hidden; border-radius:10px;">
             <img src="{{ $category->logo && file_exists(public_path('storage/nadoautoenchere/logo/' . $category->logo)) 
              ? asset('storage/nadoautoenchere/logo/' . $category->logo) 
              : asset('assets/images/logoenchere.jpg') }}" 
     alt="Logo" class="img-fluid" 
     style="width:100%; height:100%; object-fit:cover;">


                </div>
            </div>

            <!-- Infos droite -->
            <div class="col-md-9">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <h5 class="fw-bold text-dark mb-0" style="font-size:20px;">
                        {{ $category->company ?? $category->client_name ?? 'NADO.ma' }}
                    </h5>
                    <div class="text-end">
                        <div class="text-muted" style="font-size:12px;">Termine le: {{ $endsAtFormatted }}</div>
                        <div class="text-danger fw-bold remaining-time" style="font-size:14px;">
                            @if(!$ended) <span>Loading...</span> @else Terminé @endif
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-end mt-3">
                    <span class="text-muted">
                        {{ $category->cars_count }} voiture{{ $category->cars_count > 1 ? 's' : '' }} à enchérir
                    </span>
                </div>

                <div class="mt-3 text-end">
                    @if(!$ended)
                    <a href="{{ route('nadoautoenchere.index', ['category' => $category->phone]) }}" 
                       class="btn btn-primary btn-sm">
                       Voir les véhicules
                    </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
@empty
    <p class="text-muted">Aucune catégorie trouvée.</p>
@endforelse

<style>
.category-card {
    margin-bottom: 30px; /* Increase space between cards */
    transition: transform 0.3s, box-shadow 0.3s;
}
.category-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
}
.disabled-card {
    pointer-events: none;
    opacity: 0.6;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    let input = document.getElementById('company-search');
    let suggestions = document.getElementById('company-suggestions');

    input.addEventListener('input', function() {
        let query = this.value;
        if(query.length < 2) {
            suggestions.innerHTML = '';
            return;
        }

        fetch(`/client/search-companies?q=${query}`)
            .then(res => res.json())
            .then(data => {
                suggestions.innerHTML = '';
                data.forEach(company => {
                    let option = document.createElement('a');
                    option.href = "#";
                    option.classList.add('list-group-item', 'list-group-item-action');
                    option.textContent = company.company;
                    option.onclick = function(e) {
                        e.preventDefault();
                        input.value = company.company;
                        suggestions.innerHTML = '';
                    };
                    suggestions.appendChild(option);
                });
            });
    });
});
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    function updateTimers() {
        document.querySelectorAll('.category-card').forEach(card => {
            let endTimestamp = card.dataset.ends;
            if (!endTimestamp) return;

            let now = Math.floor(Date.now() / 1000);
            let diff = endTimestamp - now;
            let timeEl = card.querySelector('.remaining-time');

            if(diff <= 0){
                timeEl.textContent = 'Terminé';
                card.classList.add('disabled-card');
                card.style.cursor = 'not-allowed';
            } else {
                let days = Math.floor(diff / 86400);       // 1 day = 86400 seconds
                let hours = Math.floor((diff % 86400) / 3600);
                let minutes = Math.floor((diff % 3600) / 60);
                let seconds = diff % 60;

                let text = '';
                if (days > 0) text += days + 'j ';
                text += hours + 'h ' + minutes + 'm ' + seconds + 's';

                timeEl.textContent = text;
            }
        });
    }

    updateTimers();
    setInterval(updateTimers, 1000);
});
</script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    let input = document.getElementById('company-search');

    input.addEventListener('input', function() {
        let query = this.value;

        fetch(`{{ route('nadoautoenchere.filterCategories') }}?company=${query}`)
            .then(res => res.text())
            .then(html => {
                document.querySelector('.col-lg-7').innerHTML = html;
            });
    });
});
</script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const resultsContainer = document.querySelector('.col-lg-7');

    function fetchFilteredCategories() {
        let company = document.getElementById('company-search').value;
        let mark    = document.getElementById('mark').value;
        let modele  = document.getElementById('modele').value;
        let city    = document.getElementById('city').value;

        let params = new URLSearchParams({ company, mark, modele, city });

        fetch(`{{ route('nadoautoenchere.filterCategories') }}?${params.toString()}`)
            .then(res => res.text())
            .then(html => {
                resultsContainer.innerHTML = html;
            });
    }

    // Company instant search
    document.getElementById('company-search').addEventListener('input', fetchFilteredCategories);

    // Marque, Modèle, Ville instant change
    document.getElementById('mark').addEventListener('change', fetchFilteredCategories);
    document.getElementById('modele').addEventListener('change', fetchFilteredCategories);
    document.getElementById('city').addEventListener('change', fetchFilteredCategories);
});
</script>

@endsection
