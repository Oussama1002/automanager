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
         data-ends="{{ $remaining }}">
        <div class="row g-0 align-items-center p-3">
            <div class="col-md-2 d-flex align-items-center justify-content-center">
                <div style="width:120px; height:110px; overflow:hidden; border-radius:10px;">
                    <img src="{{ $category->logo && file_exists(public_path('storage/nadoautoenchere/logo/' . $category->logo)) 
                        ? asset('storage/nadoautoenchere/logo/' . $category->logo) 
                        : asset('assets/images/logo.png') }}" 
                        alt="Logo" class="img-fluid" style="width:100%; height:100%; object-fit:cover;">
                </div>
            </div>
            <div class="col-md-10">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <h5 class="fw-bold text-dark mb-0">{{ $category->company ?? $category->client_name ?? 'NADO.ma' }}</h5>
                    <div class="text-end">
                        <div class="text-muted" style="font-size:12px;">Termine le: {{ $endsAtFormatted }}</div>
                        <div class="text-danger fw-bold remaining-time">
                            @if(!$ended) <span>Loading...</span> @else Terminé @endif
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-end mt-3">
                    <span class="text-muted">{{ $category->cars_count }} voiture{{ $category->cars_count > 1 ? 's' : '' }}</span>
                </div>
                <div class="mt-3 text-end">
                    @if(!$ended)
                    <a href="{{ route('nadoautoenchere.index', ['category' => $category->phone]) }}" class="btn btn-primary btn-sm">
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
