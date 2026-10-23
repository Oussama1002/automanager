@extends('admin.layouts.app')

@section('content')
<div class="container mx-auto max-w-4xl p-6  rounded-lg shadow-lg">
    <h1 class="text-3xl font-extrabold mb-8 text-gray-800">Ajouter un Entretien</h1>

    @if(session('success'))
        <div class="bg-green-100 text-green-900 p-4 mb-8 rounded border border-green-300 shadow-sm">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('admin.entretiens.store') }}" method="POST" class="space-y-8" novalidate>
        @csrf
        {{-- Upload Excel --}}
<div>
    <label for="excel_file" class="block mb-2 font-semibold text-gray-700">
        Importer un fichier Excel
    </label>
    <input type="file" id="excel_file" accept=".xlsx, .xls"
           class="w-full border border-gray-300 rounded-md px-4 py-2 shadow-sm
                  focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent
                  transition duration-150">
    <p class="text-sm text-gray-500 mt-1">Le fichier doit contenir les colonnes : date, revision, entretien, reparation, carrosserie, professionnels</p>
</div>

        {{-- Filtre Annonces --}}
        <div>
            <label for="annonceFilter" class="block mb-2 font-semibold text-gray-700">Filtrer les Annonces</label>
            <input type="text" id="annonceFilter" placeholder="Rechercher par titre ou ID..."
                   class="w-full border border-gray-300 rounded-md px-4 shadow-sm
                          placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500
                          focus:border-transparent transition duration-150">
        </div>

        {{-- Select Annonce --}}
        <div>
            <label for="annonce_id" class="block mb-2 font-semibold text-gray-700">Annonce</label>
            <select name="annonce_id" id="annonce_id" required
                    class="w-full border border-gray-300 rounded-md px-4 shadow-sm
                           focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent
                           transition duration-150">
                <option value="">-- Choisir une annonce --</option>
                @foreach($annonces as $annonce)
                    <option value="{{ $annonce->id }}">
                        [#{{ $annonce->id }}] {{ $annonce->titre ?? 'Sans titre' }}
                    </option>
                @endforeach
            </select>
            {{-- Example error message placeholder --}}
            {{-- <p class="text-red-600 text-sm mt-1">Veuillez sélectionner une annonce.</p> --}}
        </div>

        {{-- Form Fields Grid --}}
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
                    <input type="{{ $field['type'] }}" name="{{ $field['name'] }}" id="{{ $field['name'] }}"
                        class="w-full border border-gray-300 rounded-md px-4 shadow-sm
                               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent
                               transition duration-150" />
                    {{-- Error example --}}
                    {{-- <p class="text-red-600 text-sm mt-1">Ce champ est obligatoire.</p> --}}
                </div>
            @endforeach
        </div>

        <div class="text-right">
            <button type="submit"
                class="inline-block bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-400
                        font-semibold  px-8 rounded-md shadow-md transition duration-200">
                Ajouter
            </button>
        </div>
    </form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<script>document.getElementById('excel_file').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = function(e) {
        const data = new Uint8Array(e.target.result);
        const workbook = XLSX.read(data, { type: 'array', cellDates: true });

        const firstSheet = workbook.Sheets[workbook.SheetNames[0]];
        const jsonData = XLSX.utils.sheet_to_json(firstSheet, { header: 1 });

        if (jsonData.length > 1) {
            const headers = jsonData[0].map(h => h.toLowerCase().trim());
            const values = jsonData[jsonData.length - 1];

            const mapping = {
                'annonce_id': 'annonce_id',
                'date': 'date',
                'revision': 'revision',
                'entretien': 'entretien',
                'reparation': 'reparation',
                'carrosserie': 'carrosserie',
                'professionnels': 'professionnels'
            };

            headers.forEach((header, index) => {
                if (mapping[header]) {
                    const fieldId = mapping[header];
                    const input = document.getElementById(fieldId);
                    if (!input) return;

                    if (fieldId === 'annonce_id') {
    const rawValue = values[index];
    if (rawValue != null) {
        const annonceValue = String(rawValue).trim().toLowerCase().replace(/^#/, '');
        const option = Array.from(input.options).find(opt => {
            const optionId = String(opt.value).toLowerCase();
            const optionText = opt.textContent.toLowerCase();
            return optionId === annonceValue || 
                   optionText.includes(annonceValue) || 
                   optionText.includes(`#${annonceValue}`);
        });
        if (option) {
            input.value = option.value;
        }
    }
}
 else if (fieldId === 'date') {
                        let excelDate = values[index];
                        if (typeof excelDate === 'number') {
                            // Convert Excel serial date to JS date
                            const jsDate = new Date((excelDate - 25569) * 86400 * 1000);
                            excelDate = jsDate.toISOString().split('T')[0];
                        } else if (excelDate instanceof Date) {
                            excelDate = excelDate.toISOString().split('T')[0];
                        }
                        input.value = excelDate || '';

                    } else {
                        input.value = values[index] || '';
                    }
                }
            });
        } else {
            alert('Le fichier Excel ne contient pas de données valides.');
        }
    };
    reader.readAsArrayBuffer(file);
});
</script>
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
