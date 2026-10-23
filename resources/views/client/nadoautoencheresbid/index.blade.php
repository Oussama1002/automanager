@extends('layouts.client')

@section('title', 'Mes Offres')

@section('client_title', 'Offres reçues')
@section('client_subtitle', 'Consultez les offres sur vos véhicules.')
@section('client_content')
<div class="container my-5">
    <!-- @if(!$bids->isEmpty())
    <div class="mb-5">
        <h4 class="mb-3" style="color:#1f519b;">📊 Statistiques des Enchères</h4>
        <div class="row">
            @foreach($bids->groupBy('enchere_id') as $enchereId => $enchereBids)
                @php
                    $enchere = $enchereBids->first()->enchere;
                    $bidCount = $enchereBids->count();
                    $views = $enchere->views ?? 0;
                @endphp
                <div class="col-md-6 mb-3">
                    <div class="card shadow-sm border-0">
                        <div class="card-body" style="background-color: #f0f4ff; border-radius: 10px;">
                            <h5 class="card-title" style="color:#163a6d;">
                                {{ $enchere->brand->name ?? 'Marque supprimée' }} {{ $enchere->modeleRelation->name ?? 'Modèle supprimé' }} - {{ $enchere->matricule ?? 'Matricule supprimé' }}
                            </h5>
                            <p class="card-text mb-1">
                                <strong>Offres:</strong> {{ $bidCount }}
                            </p>
                            <p class="card-text mb-0">
                                <strong>Vues:</strong> {{ $views }}
                            </p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endif -->

    <h2 class="mb-4">Mes Offres</h2>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if($bids->isEmpty())
        <p>Aucune offre pour vos véhicules pour le moment.</p>
    @else
        <table class="table table-bordered">
          <thead>
    <tr>
        <th>Véhicule</th>
        <th>Matricule de Véhicule</th>
        <th>Ville</th>
        <th>Entreprise</th>
        <th>Nombre d'Offres</th>
        <th>Meilleure Offre (MAD)</th>
        <th>Vues</th>
    </tr>
</thead>
<tbody>
    @foreach($bidsGrouped as $data)
        <tr>
            <td>
                {{ $data['enchere']->brand->name ?? 'Marque supprimée' }}
                {{ $data['enchere']->modeleRelation->name ?? 'Modèle supprimé' }}
            </td>
            <td>{{ $data['enchere']->matricule ?? 'Matricule supprimé' }}</td>
            <td>{{ $data['ville'] }}</td>
            <td>{{ $data['entreprise'] }}</td>
            <td>{{ $data['nombre_offres'] }}</td>
            <td>{{ number_format($data['meilleure_offre'], 2, ',', ' ') }}</td>
            <td>{{ $data['vues'] }}</td>
        </tr>
    @endforeach
</tbody>

        </table>
        <a href="{{ route('client.nadoautoencheresbid.export') }}" class="btn btn-success mb-3">
    📥 Exporter en CSV
</a>


    @endif
</div>
@endsection
