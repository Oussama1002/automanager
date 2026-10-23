@extends('layouts.app')

@section('title', 'Liste des Accessoires')

@section('content')
<div class="container mx-auto p-4">
    <h2 class="text-xl font-bold mb-4">Liste des accessoires</h2>

    <a href="{{ route('admin.accessoires.create') }}" class="bg-green-600 text-white px-4 py-2 mb-4 inline-block rounded">Ajouter un accessoire</a>

    <table class="table-auto w-full border">
        <thead>
            <tr>
                <th class="border px-4 py-2">Titre</th>
                <th class="border px-4 py-2">Prix</th>
                <th class="border px-4 py-2">Statut</th>
                <th class="border px-4 py-2">Images</th>
            </tr>
        </thead>
        <tbody>
            @foreach($accessoires as $accessoire)
                <tr>
                    <td class="border px-4 py-2">{{ $accessoire->titre }}</td>
                    <td class="border px-4 py-2">{{ $accessoire->prix }} DH</td>
                    <td class="border px-4 py-2">{{ $accessoire->status ? 'Actif' : 'Inactif' }}</td>
                    <td class="border px-4 py-2">
                        @if($accessoire->images)
                            <div class="flex space-x-2">
                                @foreach($accessoire->images as $img)
                                    <img src="{{ asset('storage/' . $img) }}" alt="" class="w-16 h-16 object-cover rounded">
                                @endforeach
                            </div>
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
