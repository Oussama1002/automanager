@extends('layouts.app')

@section('title', 'Ajouter Accessoire')

@section('content')
<div class="container mx-auto p-4">
    <h2 class="text-xl font-bold mb-4">Ajouter un accessoire</h2>

    @if ($errors->any())
        <div class="bg-red-100 text-red-700 p-3 mb-4 rounded">
            <ul class="list-disc pl-5">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form method="POST" action="{{ route('admin.accessoires.store') }}" enctype="multipart/form-data">
        @csrf
        <div class="mb-4">
            <label class="block mb-1 font-semibold">Titre</label>
            <input type="text" name="titre" class="w-full p-2 border rounded" required>
        </div>

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Prix</label>
            <input type="number" name="prix" step="0.01" class="w-full p-2 border rounded">
        </div>

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Description</label>
            <textarea name="description" class="w-full p-2 border rounded"></textarea>
        </div>

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Statut</label>
            <select name="status" class="w-full p-2 border rounded">
                <option value="1">Actif</option>
                <option value="0">Inactif</option>
            </select>
        </div>

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Images</label>
            <input type="file" name="images[]" multiple class="w-full">
        </div>

        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">Ajouter</button>
    </form>
</div>
@endsection
