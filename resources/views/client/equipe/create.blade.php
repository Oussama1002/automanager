@extends('layouts.client')

@section('title', 'Ajouter un membre')

@section('client_title', 'Ajouter un membre')
@section('client_subtitle', 'Créez un compte membre pour votre équipe.')
@section('client_content')
<div class="container my-5">
    <h2>Ajouter un membre à mon équipe</h2>

    <form action="{{ route('client.equipe.store') }}" method="POST">
        @csrf

        <div class="mb-3">
            <label for="name" class="form-label">Nom du membre</label>
            <input type="text" name="name" class="form-control" required>
            @error('name') <small class="text-danger">{{ $message }}</small> @enderror
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Adresse email</label>
            <input type="email" name="email" class="form-control" required>
            @error('email') <small class="text-danger">{{ $message }}</small> @enderror
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mot de passe</label>
            <input type="password" name="password" class="form-control" required>
            @error('password') <small class="text-danger">{{ $message }}</small> @enderror
        </div>

        <button type="submit" class="btn btn-success">✅ Ajouter</button>
    </form>
</div>
@endsection
