{{-- AUTOMANAGER-DEMANDE-CREATE-V5 --}}
@extends('layouts.app')

@section('title', 'Publier ma demande')

@section('content')
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<style>
    .dmd-form-wrap { max-width:560px; margin:50px auto 70px; padding:0 20px; font-family:'Jost',sans-serif; color:#0f172a; }
    .dmd-form-wrap h1 { font-size:26px; font-weight:800; margin:0 0 6px; letter-spacing:-0.02em; }
    .dmd-form-wrap .intro { color:#64748b; font-size:14px; margin:0 0 24px; line-height:1.5; }

    .dmd-form {
        background:#fff; border:1px solid #e2e8f0; border-radius:16px; padding:28px;
        display:grid; gap:16px; box-shadow:0 4px 16px -4px rgba(15,23,42,.06);
    }
    .dmd-form label { display:block; font-size:13px; font-weight:600; color:#334155; margin-bottom:6px; }
    .dmd-form input,
    .dmd-form select {
        width:100%; padding:12px 14px; border:1px solid #e2e8f0; border-radius:10px;
        font-size:15px; outline:none; background:#fff; font-family:inherit; color:#0f172a;
    }
    .dmd-form input:focus,
    .dmd-form select:focus { border-color:#0E0F12; box-shadow:0 0 0 3px rgba(20,89,221,.1); }
    .dmd-form select {
        appearance:none; -webkit-appearance:none;
        background-image:url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2364748b' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'><polyline points='6 9 12 15 18 9'/></svg>");
        background-repeat:no-repeat; background-position:right 14px center; padding-right:36px;
    }

    .dmd-cars { display:grid; gap:14px; }
    .dmd-car-row {
        display:grid; grid-template-columns:1fr 1fr auto; gap:10px; align-items:end;
        padding:14px; background:#f8fafc; border:1px solid #e2e8f0; border-radius:12px;
    }
    @media (max-width:600px) { .dmd-car-row { grid-template-columns:1fr 1fr; } }
    .dmd-car-row label { margin-bottom:4px; font-size:11px; text-transform:uppercase; letter-spacing:.06em; color:#475569; }
    .dmd-car-remove {
        padding:10px 12px; background:#fff; color:#dc2626; border:1px solid #fecaca;
        border-radius:10px; cursor:pointer; font-weight:700; display:flex; align-items:center; justify-content:center;
    }
    .dmd-car-remove:hover { background:#fef2f2; }
    @media (max-width:600px) { .dmd-car-remove { grid-column:1 / -1; } }

    .dmd-add-car {
        padding:12px 14px; background:#FAF6EC; color:#0E0F12; border:1px dashed #E3C178;
        border-radius:10px; cursor:pointer; font-weight:700; font-family:inherit; font-size:14px;
        display:flex; align-items:center; justify-content:center; gap:6px;
    }
    .dmd-add-car:hover { background:#F2E9D2; }

    .dmd-btn {
        padding:14px 20px; background:#0E0F12; color:#fff; border:0; border-radius:12px;
        font-weight:700; cursor:pointer; font-family:inherit; font-size:15px;
        box-shadow:0 6px 18px rgba(20,89,221,.25);
        transition:transform .15s, box-shadow .15s;
    }
    .dmd-btn:hover { transform:translateY(-1px); box-shadow:0 10px 24px rgba(20,89,221,.35); }

    .dmd-errors {
        background:#fef2f2; color:#991b1b; padding:12px 14px; border-radius:10px;
        border:1px solid #fecaca; font-size:13px;
    }
    .dmd-errors ul { margin:0; padding-left:18px; }

    .dmd-note { font-size:12px; color:#64748b; text-align:center; }
</style>

<div class="dmd-form-wrap">
    <h1>Publier ma demande</h1>
    <p class="intro">
        Dites-nous quelles voitures vous recherchez — vous pouvez en ajouter plusieurs (ex. BMW Série 5, Audi A4, Mercedes Classe A).
        Un agent AUTOMANAGER vous contactera rapidement.
    </p>

    @if ($errors->any())
        <div class="dmd-errors">
            <ul>
                @foreach ($errors->all() as $e) <li>{{ $e }}</li> @endforeach
            </ul>
        </div>
    @endif

    <form id="dmdForm" method="POST" action="{{ route('demandes.store') }}" class="dmd-form">
        @csrf

        {{-- Hidden fields filled on submit by the JS below --}}
        <input type="hidden" name="source"    value="{{ $prefill['source']   ?? 'direct' }}">
        <input type="hidden" name="ville_id"  value="{{ $prefill['ville_id'] ?? '' }}">
        <input type="hidden" name="raw_query" value="{{ $prefill['q']        ?? '' }}">
        <input type="hidden" name="brand_id"  id="dmdBrandId"  value="">
        <input type="hidden" name="modele_id" id="dmdModeleId" value="">
        <input type="hidden" name="comment"   id="dmdComment"  value="">

        {{-- Honeypot --}}
        <input type="text" name="website" value="" style="display:none;" tabindex="-1" autocomplete="off">

        <div>
            <label for="dmdNom">Nom complet</label>
            <input id="dmdNom" type="text" name="nom" required
                   value="{{ old('nom', auth('client')->user()?->name) }}"
                   placeholder="Votre nom et prénom">
        </div>

        <div>
            <label for="dmdTel">Téléphone</label>
            <input id="dmdTel" type="tel" name="telephone" required
                   value="{{ old('telephone', auth('client')->user()?->phone) }}"
                   placeholder="06XXXXXXXX">
        </div>

        <div>
            <label>Voitures recherchées</label>
            <div class="dmd-cars" id="dmdCars">
                {{-- initial row rendered by JS so brand + model stay in sync --}}
            </div>
            <button type="button" class="dmd-add-car" id="dmdAddCar" style="margin-top:12px;">
                + Ajouter une autre voiture
            </button>
        </div>

        <button type="submit" class="dmd-btn">Envoyer ma demande</button>

        <p class="dmd-note">Un administrateur vous contactera rapidement.</p>
    </form>
</div>

<script>
    (function () {
        var brandsData = @json($brands->map(fn($b) => ['id' => $b->id, 'name' => $b->name])->values());
        var prefillBrandId  = @json((string)($prefill['brand_id']  ?? ''));
        var prefillModeleId = @json((string)($prefill['modele_id'] ?? ''));

        var container = document.getElementById('dmdCars');
        var addBtn    = document.getElementById('dmdAddCar');
        var form      = document.getElementById('dmdForm');
        var MODELS_URL = "{{ url('/achat/models-by-brand') }}"; // + /{brandId}

        var rowId = 0;

        function brandOptions(selectedId) {
            var html = '<option value="">— Choisir une marque —</option>';
            brandsData.forEach(function (b) {
                html += '<option value="' + b.id + '"' + (String(b.id) === String(selectedId) ? ' selected' : '') + '>' + b.name + '</option>';
            });
            return html;
        }

        function newRow(preBrandId, preModeleId) {
            rowId++;
            var id = 'r' + rowId;
            var row = document.createElement('div');
            row.className = 'dmd-car-row';
            row.dataset.rowId = id;
            row.innerHTML =
                '<div>'
                 + '<label>Marque</label>'
                 + '<select class="dmd-brand">' + brandOptions(preBrandId || '') + '</select>'
                + '</div>'
                + '<div>'
                 + '<label>Modèle</label>'
                 + '<select class="dmd-modele"><option value="">— Choisir un modèle —</option></select>'
                + '</div>'
                + '<button type="button" class="dmd-car-remove" title="Supprimer">×</button>';

            container.appendChild(row);

            var brandSel  = row.querySelector('.dmd-brand');
            var modeleSel = row.querySelector('.dmd-modele');
            var removeBtn = row.querySelector('.dmd-car-remove');

            brandSel.addEventListener('change', function () {
                loadModels(brandSel.value, modeleSel, null);
            });
            removeBtn.addEventListener('click', function () {
                if (container.children.length > 1) row.remove();
            });

            if (preBrandId) loadModels(preBrandId, modeleSel, preModeleId);
            return row;
        }

        function loadModels(brandId, modeleSel, preselectId) {
            modeleSel.innerHTML = '<option value="">— Choisir un modèle —</option>';
            if (!brandId) return;
            fetch(MODELS_URL + '/' + encodeURIComponent(brandId), { headers: { 'Accept': 'application/json' } })
                .then(function (r) { return r.ok ? r.json() : []; })
                .then(function (list) {
                    (list || []).forEach(function (m) {
                        var opt = document.createElement('option');
                        opt.value = m.id;
                        opt.textContent = m.name;
                        if (preselectId && String(m.id) === String(preselectId)) opt.selected = true;
                        modeleSel.appendChild(opt);
                    });
                })
                .catch(function () { /* non-fatal */ });
        }

        // Start with one row — pre-filled if the user came from the filter page
        newRow(prefillBrandId, prefillModeleId);

        addBtn.addEventListener('click', function () { newRow('', ''); });

        // On submit: first row → brand_id / modele_id. Extra rows → comment field.
        form.addEventListener('submit', function () {
            var rows = container.querySelectorAll('.dmd-car-row');
            var first = rows[0];
            if (first) {
                document.getElementById('dmdBrandId').value  = first.querySelector('.dmd-brand').value  || '';
                document.getElementById('dmdModeleId').value = first.querySelector('.dmd-modele').value || '';
            }
            var extras = [];
            for (var i = 1; i < rows.length; i++) {
                var r = rows[i];
                var bSel = r.querySelector('.dmd-brand');
                var mSel = r.querySelector('.dmd-modele');
                var bTxt = bSel.options[bSel.selectedIndex]?.text || '';
                var mTxt = mSel.options[mSel.selectedIndex]?.text || '';
                if (bSel.value) {
                    extras.push(bTxt + (mSel.value ? ' ' + mTxt : ''));
                }
            }
            if (extras.length) {
                document.getElementById('dmdComment').value = 'Autres voitures souhaitées : ' + extras.join(', ');
            }
        });
    })();
</script>
@endsection
