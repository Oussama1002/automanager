@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">{{ $enchere->exists ? 'Modifier' : 'Ajouter' }} une Enchère</h1>

    <form method="POST" action="{{ $enchere->exists ? route('admin.autoenchere.update', $enchere->id) : route('admin.autoenchere.store') }}">
        @csrf
        @if ($enchere->exists)
            @method('PUT')
        @endif

        <div class="mb-3">
            <label for="annonce_id" class="form-label">Offres</label>
            <select name="annonce_id" class="form-control" required>
                <option value="">-- Choisir --</option>
                @foreach ($annonces as $annonce)
                    <option value="{{ $annonce->id }}" {{ $enchere->annonce_id == $annonce->id ? 'selected' : '' }}>
                        {{ $annonce->titre }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label for="client_id" class="form-label">Client</label>
            <select name="client_id" class="form-control" required>
                <option value="">-- Choisir --</option>
                @foreach ($clients as $client)
                    <option value="{{ $client->id }}" {{ $enchere->client_id == $client->id ? 'selected' : '' }}>
                        {{ $client->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label for="proposition" class="form-label">Montant proposé</label>
            <input type="number" name="proposition" value="{{ old('proposition', $enchere->proposition) }}" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success">Enregistrer</button>
        <a href="{{ route('admin.autoenchere.index') }}" class="btn btn-secondary">Annuler</a>
    </form>
</div>
@endsection
