@extends('admin.layouts.app')

@section('content')
<div class="container max-w-lg mx-auto p-6 bg-white rounded shadow-md">
    <h1 class="text-xl font-bold mb-4">Modifier les paramètres de financement</h1>

    @if(session('success'))
        <div class="bg-green-100 text-green-700 p-3 rounded mb-4">{{ session('success') }}</div>
    @endif

    <form method="POST" action="{{ route('admin.financement_settings.update') }}">
        @csrf
        @method('PUT')

        <div class="mb-4">
            <label for="frais_dossier" class="block mb-1 font-semibold">Frais de dossier (DH)</label>
            <input type="number" name="frais_dossier" id="frais_dossier" class="w-full border px-3 py-2 rounded" value="{{ old('frais_dossier', $fraisDossier) }}" required min="0" step="0.01">
            @error('frais_dossier')
                <span class="text-red-600 text-sm">{{ $message }}</span>
            @enderror
        </div>

        <div class="mb-4">
            <label for="assurance_annuelle" class="block mb-1 font-semibold">Assurance annuelle (DH)</label>
            <input type="number" name="assurance_annuelle" id="assurance_annuelle" class="w-full border px-3 py-2 rounded" value="{{ old('assurance_annuelle', $assuranceAnnuelle) }}" required min="0" step="0.01">
            @error('assurance_annuelle')
                <span class="text-red-600 text-sm">{{ $message }}</span>
            @enderror
        </div>

        <div class="mb-4">
            <label for="taux_interet_default" class="block mb-1 font-semibold">Taux d'intérêt par défaut (%)</label>
            <input type="number" name="taux_interet_default" id="taux_interet_default" class="w-full border px-3 py-2 rounded" value="{{ old('taux_interet_default', $tauxInteretDefault) }}" required min="0" max="100" step="0.01">
            @error('taux_interet_default')
                <span class="text-red-600 text-sm">{{ $message }}</span>
            @enderror
        </div>

        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Enregistrer</button>
    </form>
</div>
@endsection
