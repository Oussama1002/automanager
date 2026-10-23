@extends('layouts.app')

@section('title', 'Mes Offres')
@section('content')
<div class="container">
    <h2 class="mb-4">📌 Mes Offres</h2>

    @if($bids->isEmpty())
        <div class="alert alert-info">
            Vous n'avez fait aucune offre pour le moment.
        </div>
    @else
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Véhicule</th>
                    <th>Proposition (DH)</th>
                    <th>Date</th>
                    <th>Statut</th>
                </tr>
            </thead>
            <tbody>
                @foreach($bids as $bid)
                    <tr>
                        <td>
                            {{ $bid->enchere->brand->name ?? 'Marque supprimée' }}
                            {{ $bid->enchere->modeleRelation->name ?? 'Modèle supprimé' }}
                        </td>
                        <td class="fw-bold text-primary">
                            {{ number_format($bid->proposition, 0, ',', ' ') }} DH
                        </td>
                        <td>{{ $bid->created_at->format('d/m/Y H:i') }}</td>
                        <td>
                            @if($bid->enchere->winner_id === $bid->client_id)
                                <span class="badge bg-success">Gagnée ✅</span>
                            @else
                                <span class="badge bg-warning">En cours ⏳</span>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
</div>
@endsection
