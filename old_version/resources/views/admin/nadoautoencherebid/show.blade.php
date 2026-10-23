@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1>Détail de l'offre #{{ $enchere->id }}</h1>

    <table class="table table-bordered">
        <tr>
            <th>Annonce</th>
            <td>{{ $enchere->annonce->titre ?? 'N/A' }}</td>
        </tr>
         <tr>
            <th> Prix originale</th>
            <td>{{ $enchere->annonce->prix ?? 'N/A' }}</td>
        </tr>
        <tr>
            <th>Client</th>
            <td>{{ $enchere->client->name ?? 'Client introuvable' }}</td>
        </tr>
         <tr>
            <th>Telephone de Client</th>
            <td>{{ $enchere->client->phone ?? 'Client introuvable' }}</td>
        </tr>
        <tr>
            <th>Proposition</th>
            <td>{{ number_format($enchere->proposition, 0, ',', ' ') }} MAD</td>
        </tr>
        <tr>
            <th>Date de proposition</th>
            <td>{{ $enchere->created_at->format('d/m/Y H:i') }}</td>
        </tr>
    </table>

    <a href="{{ route('admin.nadoautoencherebid.index') }}" class="btn btn-secondary">Retour à la liste</a>
</div>
@endsection
