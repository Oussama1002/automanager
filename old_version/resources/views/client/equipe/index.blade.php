@extends('layouts.app')

@section('title', 'Mon Équipe')

@section('content')
<div class="container my-5">
    <h2 class="mb-4">Mon Équipe</h2>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <a href="{{ route('client.equipe.create') }}" class="btn btn-primary mb-3">➕ Ajouter un membre</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                                <th>Nom</th>

                <th>Email</th>
                 <th>Entreprise</th>
                 <th>Logo</th>
                <th>Type</th>

                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($equipe as $member)
                <tr>
                                        <td>{{ $member->name }}</td>

                    <td>{{ $member->email }}</td>
                    <td>{{ $member->company }}</td>
                    <td>{{ $member->logo }}</td>
                    <td>{{ $member->type }}</td>
                    <td>
                        <form action="{{ route('client.equipe.destroy', $member->id) }}" method="POST">
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-danger btn-sm">❌ Supprimer</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr><td colspan="3" class="text-center">Aucun membre ajouté</td></tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
