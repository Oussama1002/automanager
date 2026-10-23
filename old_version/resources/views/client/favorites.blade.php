@extends('layouts.app')

@section('title', 'Mes favoris')

@section('content')
<div class="container my-5">
    <h2 class="text-center mb-4"> annonces favoris</h2>

    @if($favorites->isEmpty())
        <p class="text-gray-600">Vous n’avez pas encore de favoris.</p>
    @else
        <div class="row">
            @foreach($favorites as $annonce)

          <div class="col-md-4 mb-4">
                <div class="card annonce-card shadow-sm">
                    <img src="{{ asset('storage/ads/' . $annonce->image) }}" 
                         class="card-img-top annonce-img" 
                         alt="{{ $annonce->title }}">
                    
                    <div class="card-body">
                        <h5 class="card-title">{{ $annonce->mark }} {{ $annonce->modele }}</h5>

                        <div class="annonce-info">
                           <p><strong>Titre:</strong> {{ $annonce->titre }}</p>

                            <p><strong>Telephone:</strong> {{ $annonce->phone }} </p>

                            <p><strong>Prix:</strong> {{ $annonce->prix }} DH</p>
                            <p><strong>Ville:</strong> {{ $annonce->city }}</p>
                            <p><strong>Status:</strong> 
                                <span class="badge bg-success">Disponible</span>
                            </p>
                        </div>

                            <a href="{{ route('achat.detail', ['marque' => str_replace(' ', '', $annonce->mark), 'modele' => str_replace(' ', '', $annonce->modele), 'id' => $annonce['id']]) }}" class="btn btn-primary w-100">
                            Voir Détails
                        </a>
                    </div>
                </div>
            </div>
        @endforeach
    @endif
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
</style>
@endsection
