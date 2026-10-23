@extends('admin.layouts.app')

@section('content')
<div class="container mx-auto max-w-4xl p-6 bg-white rounded-lg shadow-lg">
    <h1 class="text-3xl font-extrabold mb-8 text-gray-800">Modifier l'Entretien</h1>

    @if(session('success'))
        <div class="bg-green-100 text-green-900 p-4 mb-8 rounded border border-green-300 shadow-sm">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('admin.entretiens.update', $entretien->id) }}" method="POST" class="space-y-8" novalidate>
        @csrf
        @method('PUT')

        <div>
            <label for="annonceFilter" class="block mb-2 font-semibold text-gray-700">Filtrer les Annonces</label>
            <input type="text" id="annonceFilter" placeholder="Rechercher par titre ou ID..."
                   class="w-full border border-gray-300 rounded-md px-4 py-3 shadow-sm
                          placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500
                          focus:border-transparent transition duration-150">
        </div>

        <div>
            <label for="annonce_id" class="block mb-2 font-semibold text-gray-700">Annonce</label>
            <select name="annonce_id" id="annonce_id" required
                    class="w-full border border-gray-300 rounded-md px-4 py-3 shadow-sm
                           focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent
                           transition duration-150">
                <option value="">-- Choisir une annonce --</option>
                @foreach($annonces as $annonce)
                    <option value="{{ $annonce->id }}" @if($entretien->annonce_id == $annonce->id) selected @endif>
                        [#{{ $annonce->id }}] {{ $annonce->titre ?? 'Sans titre' }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            @php
                $fields = [
                    ['name' => 'date', 'label' => 'Date', 'type' => 'date'],
                    ['name' => 'revision', 'label' => 'Révision', 'type' => 'text'],
                    ['name' => 'entretien', 'label' => 'Entretien', 'type' => 'text'],
                    ['name' => 'reparation', 'label' => 'Réparation', 'type' => 'text'],
                    ['name' => 'carrosserie', 'label' => 'Carrosserie', 'type' => 'text'],
                    ['name' => 'professionnels', 'label' => 'Professionnels', 'type' => 'text'],
                ];
            @endphp

            @foreach ($fields as $field)
                <div>
                    <label for="{{ $field['name'] }}" class="block mb-2 font-semibold text-gray-700">
                        {{ $field['label'] }}
                    </label>
                    <input 
                        type="{{ $field['type'] }}" 
                        name="{{ $field['name'] }}" 
                        id="{{ $field['name'] }}" 
                        value="{{ old($field['name'], $entretien->{$field['name']}) }}"
                        class="w-full border border-gray-300 rounded-md px-4 py-3 shadow-sm
                               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent
                               transition duration-150" 
                    />
                </div>
            @endforeach
        </div>

        <div class="text-right">
            <button type="submit"
                class="inline-block bg-yellow-600 hover:bg-yellow-700 focus:ring-4 focus:ring-yellow-400
                       text-white font-semibold py-3 px-8 rounded-md shadow-md transition duration-200">
                Mettre à jour
            </button>
        </div>
    </form>
</div>

<script>
    document.getElementById('annonceFilter').addEventListener('input', function () {
        const filter = this.value.toLowerCase();
        const select = document.getElementById('annonce_id');
        const options = select.querySelectorAll('option');

        options.forEach(option => {
            const text = option.textContent.toLowerCase();
            const id = option.value;
            option.hidden = !(filter === '' || text.includes(filter) || id.includes(filter));
        });
    });
</script>
@endsection
