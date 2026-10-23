@extends('layouts.app')


@section('title', 'Mes Vehicules')

@section('content')
<div class="container my-5">
        <h2 class="text-center mb-4">Mes {{ $vehicules->count() }} vehicules disponibles</h2>

            @foreach($vehicules as $vehicule)


    <div class="row g-4">
            <div class="col-md-4 mb-4">
                <div class="card annonce-card shadow-sm">
                    <img src="{{ asset('storage/nadoautoenchere/' . (is_array($vehicule->images) ? $vehicule->images[0] : $vehicule->images)) 
             }}" 
                         class="card-img-top annonce-img" 
                         alt="{{ $vehicule->title }}">
                    
                    <div class="card-body">
                        <h5 class="card-title"> {{ strtoupper($vehicule->brand?->name ?? '') }}
                                {{ strtoupper($vehicule->modeleRelation?->name ?? '') }}</h5>

                        <div class="annonce-info">
                            <p><strong>Titre:</strong> {{ $vehicule->titre }}</p>

                            <p><strong>Prix:</strong> {{ number_format($vehicule->prix ?? 0, 0, ',', ' ') }} MAD</p>
                            <p><strong>Views:</strong> {{ number_format($vehicule->views ?? 0, 0, ',', ' ') }} </p>

                            <p><strong>Ville:</strong> {{ $vehicule->city }}</p>
                            <p><strong>Status:</strong> 
                                <span class="badge bg-success">Disponible</span>
                            </p>
                        </div>

                            <a href="{{ route('nadoautoenchere.index', ['category' => $vehicule->phone]) }}" 
   class="btn btn-primary w-100">
    Voir Détails
</a>

                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>

<style>
    .annonce-card {
        border-radius: 12px;
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .annonce-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    .annonce-img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .annonce-info {
        margin-bottom: 15px;
    }

    .annonce-info p {
        margin: 5px 0;
        font-size: 14px;
        color: #444;
        list-style: none; /* ✅ no bullets */
    }

    .btn-primary {
        border-radius: 8px;
        font-weight: 600;
    }
     /* ✅ Extra padding for mobile */
    @media (max-width: 576px) {
        .annonce-card {
            margin-bottom: 15px;
        }
    }
</style>
@endsection