@extends('admin.layouts.app')

@section('title', 'Créer un client')

@section('content')
<div class="container">
    <h2 class="mb-4">➕ Créer un nouveau client</h2>

    @if($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach($errors->all() as $e)
                    <li>{{ $e }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('admin.clients.store') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div class="form-group mb-3">
            <label>Nom complet</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="form-group mb-3">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="form-group mb-3">
            <label>Téléphone</label>
            <input type="text" name="phone" class="form-control" required>
        </div>

        <div class="form-group mb-3">
            <label>Type</label>
            <select name="type" class="form-control" required>
                <option value="particulier">Particulier</option>
                <option value="pro">Professionnel</option>
                <option value="flotte&enchere">Flotte & Enchère</option>
            </select>
        </div>

        <div class="form-group mb-3">
            <label>Nom de l’entreprise (optionnel)</label>
            <input type="text" name="company" class="form-control">
        </div>

        <div class="form-group mb-3">
            <label>Logo (optionnel)</label>
            <input type="file" name="logo" class="form-control">
        </div>

        <div class="form-group mb-3">
            <label>Mot de passe</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <div class="form-group mb-3">
            <label>Confirmer le mot de passe</label>
            <input type="password" name="password_confirmation" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary">Créer</button>
        <a href="{{ route('admin.clients.index') }}" class="btn btn-secondary">Annuler</a>
    </form>
</div>
@endsection
