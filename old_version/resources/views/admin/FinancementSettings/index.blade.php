@extends('admin.layouts.app')

@section('content')
<div class="container max-w-4xl mx-auto p-6 rounded shadow-md">
    <h1 class="text-2xl font-bold mb-6">Paramètres de financement</h1>

    @if(session('success'))
        <div class="bg-green-100 text-green-700 p-3 rounded mb-4">{{ session('success') }}</div>
    @endif

    <form method="POST" action="{{ route('admin.FinancementSettings.update') }}">
    <h2 class="text-lg font-semibold mb-2">Paramètres globaux</h2>
<div class="mb-4">
    <label>Frais de dossier (DH)</label>
    <input type="number" step="0.01" name="frais_dossier" value="{{ $settings['frais_dossier'] ?? '' }}" class="border rounded w-full px-3 py-2" required>
</div>
<div class="mb-4">
    <label>Assurance annuelle (DH)</label>
    <input type="number" step="0.01" name="assurance_annuelle" value="{{ $settings['assurance_annuelle'] ?? '' }}" class="border rounded w-full px-3 py-2" required>
</div>
<div class="mb-4">
    <label>Taux d'intérêt par défaut (%)</label>
    <input type="number" step="0.01" name="taux_interet_default" value="{{ $settings['taux_interet_default'] ?? '' }}" class="border rounded w-full px-3 py-2" required>
</div>

    @csrf
    @method('PUT')

    <!-- Global settings inputs -->

    <h2 class="text-lg font-semibold mt-6 mb-2">Types de clients & Taux</h2>
    <table class="w-full border-collapse border border-gray-300 mb-4">
        <thead>
            <tr class="bg-gray-100">
                <th class="border px-3 py-2">Nom</th>
                <th class="border px-3 py-2">Taux (%)</th>
                <th class="border px-3 py-2">Supprimer</th>
            </tr>
        </thead>
        <tbody>
            @foreach($clientTypes as $type)
            <tr>
                <td class="border px-3 py-2">
                    <input type="text" name="client_types[{{ $type->id }}][name]" value="{{ $type->name }}" class="border rounded w-full px-2 py-1">
                </td>
                <td class="border px-3 py-2">
                    <input type="number" step="0.01" name="client_types[{{ $type->id }}][taux_interet]" value="{{ $type->taux_interet }}" class="border rounded w-full px-2 py-1">
                </td>
                <td class="border px-3 py-2 text-center">
                    <input type="checkbox" name="client_types[{{ $type->id }}][delete]" value="1">
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
     <!-- Add new client type inputs -->
     <h3 class="font-semibold mb-2">Ajouter un nouveau type</h3>
    <div class="flex gap-2 mb-6">
        <input type="text" name="new_client_type_name" placeholder="Nom" class="border rounded px-3 py-2 w-1/2">
        <input type="number" step="0.01" name="new_client_type_taux" placeholder="Taux (%)" class="border rounded px-3 py-2 w-1/2">
    </div>
<br><br>
    <div class="flex justify-end gap-2 mb-6">
        <button type="submit" class="bg-blue-600 px-6 py-2 rounded hover:bg-blue-700 ">
            Modifier
        </button>
    </div>

   
</form>

</div>
@endsection
