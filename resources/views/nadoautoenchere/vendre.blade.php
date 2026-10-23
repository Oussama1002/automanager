<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendeurs | Auto Enchère</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <script>
        tailwind.config = {
            theme: { extend: {
                fontFamily: { inter: ['Inter', 'sans-serif'] },
                colors: { primary: '#1459DD', accent: '#F37021' },
            } }
        }
    </script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        ::selection { background-color: #F37021; color: #fff; }
        .modal-overlay { transition: opacity 0.2s ease; }
        .modal-box { transition: transform 0.25s ease, opacity 0.25s ease; }
        .profile-btn .icon-wrap { background-color: #e2e8f0; transition: background-color .2s; }
        .profile-btn .btn-label  { color: #334155; transition: color .2s; }
        .profile-btn svg         { color: #64748b; transition: color .2s; }
        .profile-btn.is-selected              { border-color: #1459DD !important; background-color: rgb(20 89 221 / .05) !important; }
        .profile-btn.is-selected .icon-wrap   { background-color: rgb(20 89 221 / .1); }
        .profile-btn.is-selected .btn-label   { color: #1459DD; }
        .profile-btn.is-selected svg          { color: #1459DD; }
    </style>
</head>
<body class="min-h-screen bg-slate-50 font-inter">

    @php
        $authClient  = Auth::guard('client')->user();
        $isVendeur   = $authClient && ($authClient->type ?? '') === 'flotte&enchere';
        $clientName  = $authClient ? e($authClient->name)  : '';
        $clientPhone = $authClient ? e($authClient->phone) : '';
    @endphp

    @section('na_nav_links')
        @php
            $navClient  = $authClient;
            $acheterUrl = ($navClient && ($navClient->type ?? '') === 'flotte&enchere')
                ? route('nadoautoenchere.categories')
                : route('nadoautoenchere.register');
        @endphp
        <a href="{{ $acheterUrl }}"
           class="text-[13px] font-bold uppercase tracking-wide px-3 py-2 rounded-2xl transition-all text-slate-700 hover:text-[#1459DD] hover:bg-slate-100">
            Acheter
        </a>
        <a href="{{ route('nadoautoenchere.vendre') }}"
           class="text-[13px] font-bold uppercase tracking-wide px-3 py-2 rounded-2xl transition-all text-[#F37021] bg-orange-50">
            Vendre
        </a>
    @endsection
    @include('nadoautoenchere.partials.navbar')

    <main class="max-w-7xl mx-auto px-6 py-12">
        <section class="bg-white border border-slate-100 rounded-3xl shadow-sm p-8 md:p-12">
            <div class="inline-flex items-center gap-2 px-4 py-2 bg-[#F37021]/10 border border-[#F37021]/20 rounded-full mb-6">
                <i data-lucide="badge-check" class="w-4 h-4 text-[#F37021]"></i>
                <span class="text-[10px] font-black uppercase tracking-[0.2em] text-[#F37021]">Vendeurs</span>
            </div>

            <h1 class="text-4xl md:text-5xl font-black tracking-tighter text-slate-900 uppercase">
                Vendez vos véhicules <span class="text-[#1459DD]">au meilleur prix</span>.
            </h1>

            <p class="mt-5 text-slate-600 text-lg font-medium max-w-3xl leading-relaxed">
                NADO réunit jusqu'à <strong>200 acheteurs qualifiés</strong> par session — en présentiel et en ligne.
                Résultat : une vraie mise en concurrence, un prix juste, et un paiement sous <strong>7 jours</strong>.
            </p>

            <div class="mt-8">
                <button id="btnOpenModal"
                    class="inline-flex items-center justify-center gap-2 px-8 py-4 rounded-2xl bg-[#1459DD] text-white font-black text-xs uppercase tracking-widest hover:bg-[#0f47b5] transition active:scale-95 shadow-lg shadow-[#1459DD]/20">
                    <i data-lucide="send" class="w-4 h-4"></i>
                    Vendre mes véhicules
                </button>
            </div>
        </section>

        <section class="mt-10 bg-white border border-slate-100 rounded-3xl shadow-sm p-8 md:p-12">
            <h2 class="text-2xl md:text-3xl font-black tracking-tighter uppercase text-slate-900">
                Ils nous font <span class="text-[#1459DD]">confiance</span>
            </h2>

            <div class="mt-6 flex flex-wrap gap-3">
                @foreach(['Avis','MarocAuto Hall','Falam','Partenaire','Vivalis','Dislog Group','Wafabail','Wafasalaf'] as $p)
                    <span class="px-4 py-2 rounded-2xl bg-slate-50 border border-slate-200 text-slate-700 font-black text-xs uppercase tracking-widest">
                        {{ $p }}
                    </span>
                @endforeach
            </div>
        </section>

        <section class="mt-10 bg-white border border-slate-100 rounded-3xl shadow-sm p-8 md:p-12">
            <div class="flex items-end justify-between gap-6 flex-wrap">
                <div>
                    <div class="text-[10px] font-black uppercase tracking-[0.2em] text-[#F37021] mb-2">Comment ça marche</div>
                    <h2 class="text-3xl md:text-4xl font-black tracking-tighter uppercase text-slate-900">Comment ça marche</h2>
                </div>
            </div>

            <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="p-6 rounded-3xl bg-slate-50 border border-slate-100">
                    <div class="w-12 h-12 rounded-2xl bg-[#1459DD]/10 flex items-center justify-center mb-4">
                        <i data-lucide="wrench" class="w-6 h-6 text-[#1459DD]"></i>
                    </div>
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-2">Expertise &amp; Préparation</h3>
                    <p class="text-slate-600 font-medium leading-relaxed">
                        Vos véhicules sont réceptionnés et expertisés par un expert indépendant. Chaque véhicule reçoit un rapport détaillé : état mécanique, carrosserie, kilométrage, documentation.
                    </p>
                </div>
                <div class="p-6 rounded-3xl bg-slate-50 border border-slate-100">
                    <div class="w-12 h-12 rounded-2xl bg-[#F37021]/10 flex items-center justify-center mb-4">
                        <i data-lucide="gavel" class="w-6 h-6 text-[#F37021]"></i>
                    </div>
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-2">Mise en Vente aux Enchères</h3>
                    <p class="text-slate-600 font-medium leading-relaxed">
                        Vos véhicules sont présentés à notre réseau d'acheteurs qualifiés lors d'une session d'enchères — en salle et via notre application. Vous fixez un prix de réserve : en dessous, le véhicule n'est pas vendu.
                    </p>
                </div>
                <div class="p-6 rounded-3xl bg-slate-50 border border-slate-100">
                    <div class="w-12 h-12 rounded-2xl bg-emerald-500/10 flex items-center justify-center mb-4">
                        <i data-lucide="banknote" class="w-6 h-6 text-emerald-600"></i>
                    </div>
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-2">Paiement Rapide</h3>
                    <p class="text-slate-600 font-medium leading-relaxed">
                        L'acheteur paie sous 48h après adjudication. Vous recevez votre règlement sous 7 jours. NADO gère toute la documentation et les formalités de sortie.
                    </p>
                </div>
            </div>
        </section>

        <section class="mt-10 bg-white border border-slate-100 rounded-3xl shadow-sm p-8 md:p-12">
            <h2 class="text-3xl md:text-4xl font-black tracking-tighter uppercase text-slate-900">
                Pourquoi vendre aux enchères
            </h2>
            <p class="mt-2 text-slate-600 font-medium text-lg">Arrêtez de négocier. Laissez le marché décider.</p>

            <div class="mt-8 grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div class="p-6 rounded-3xl border border-slate-200 bg-slate-50">
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-4">Vente directe à un revendeur</h3>
                    <ul class="space-y-3 text-slate-700 font-semibold">
                        <li class="flex gap-2"><span class="text-red-500 font-black">✕</span> Responsabilité intégrale de la cession sur le client</li>
                        <li class="flex gap-2"><span class="text-red-500 font-black">✕</span> Identification des acheteurs et négociation à votre charge</li>
                        <li class="flex gap-2"><span class="text-red-500 font-black">✕</span> Aucune visibilité sur la valeur réelle du marché</li>
                        <li class="flex gap-2"><span class="text-red-500 font-black">✕</span> Documentation et formalités à gérer en interne</li>
                        <li class="flex gap-2"><span class="text-red-500 font-black">✕</span> Délais de paiement variables et peu prévisibles</li>
                    </ul>
                </div>

                <div class="p-6 rounded-3xl border border-[#1459DD]/25 bg-[#1459DD]/5">
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-4">Vente aux enchères NADO</h3>
                    <ul class="space-y-3 text-slate-700 font-semibold">
                        <li class="flex gap-2"><span class="text-emerald-600 font-black">✓</span> Transfert de mandat — NADO organise le processus de vente</li>
                        <li class="flex gap-2"><span class="text-emerald-600 font-black">✓</span> Mise en concurrence structurée, prix fixé par le marché</li>
                        <li class="flex gap-2"><span class="text-emerald-600 font-black">✓</span> Paiement sécurisé sous 7 jours</li>
                        <li class="flex gap-2"><span class="text-emerald-600 font-black">✓</span> Documentation, formalités et traçabilité prises en charge</li>
                        <li class="flex gap-2"><span class="text-emerald-600 font-black">✓</span> Expertise indépendante incluse pour chaque véhicule</li>
                    </ul>

                    <div class="mt-5 p-5 rounded-3xl bg-white border border-slate-100 text-slate-700 font-semibold leading-relaxed">
                        Sur des lots récents, nos partenaires ont constaté un prix de cession supérieur de <strong>5 à 15%</strong> par rapport à une vente bilatérale non organisée.
                    </div>
                </div>
            </div>
        </section>

        <section class="mt-10 bg-white border border-slate-100 rounded-3xl shadow-sm p-8 md:p-12">
            <div class="text-center">
                <div class="inline-flex items-center gap-2 px-4 py-2 bg-[#1459DD]/10 border border-[#1459DD]/20 rounded-full mb-5">
                    <i data-lucide="shield-check" class="w-4 h-4 text-[#1459DD]"></i>
                    <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-700">Nos garanties</span>
                </div>
                <h2 class="text-3xl md:text-4xl font-black tracking-tighter uppercase text-slate-900">Votre sécurité, notre engagement.</h2>
            </div>

            <div class="mt-10 grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="p-6 rounded-3xl bg-slate-50 border border-slate-100">
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-2">Prix de réserve garanti</h3>
                    <p class="text-slate-600 font-medium leading-relaxed">En dessous de votre seuil, le véhicule n'est pas vendu. Aucun risque.</p>
                </div>
                <div class="p-6 rounded-3xl bg-slate-50 border border-slate-100">
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-2">Expertise indépendante</h3>
                    <p class="text-slate-600 font-medium leading-relaxed">Expert indépendant agréé. Rapport détaillé inclus dans nos prestations.</p>
                </div>
                <div class="p-6 rounded-3xl bg-slate-50 border border-slate-100">
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-2">Paiement sécurisé sous 7 jours</h3>
                    <p class="text-slate-600 font-medium leading-relaxed">Acheteurs paient sous 48h. Fonds reversés sous 7 jours après encaissement.</p>
                </div>
                <div class="p-6 rounded-3xl bg-slate-50 border border-slate-100">
                    <h3 class="text-lg font-black uppercase tracking-tight text-slate-900 mb-2">Confidentialité totale</h3>
                    <p class="text-slate-600 font-medium leading-relaxed">Secret professionnel. Votre identité n'est jamais communiquée aux acheteurs.</p>
                </div>
            </div>
        </section>
    </main>


    {{-- ═══════════════════════════════════════════════════
         MODAL — Inscription requise (non flotte&enchere)
    ═══════════════════════════════════════════════════ --}}
    <div id="modalRegister" class="modal-overlay fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm hidden opacity-0">
        <div class="modal-box bg-white rounded-3xl shadow-2xl w-full max-w-md p-8 scale-95 opacity-0">

            <div class="flex items-center justify-between mb-6">
                <div class="inline-flex items-center gap-2 px-3 py-1.5 bg-[#F37021]/10 rounded-full">
                    <i data-lucide="user-plus" class="w-4 h-4 text-[#F37021]"></i>
                    <span class="text-[10px] font-black uppercase tracking-widest text-[#F37021]">Créer un compte vendeur</span>
                </div>
                <button class="modal-close p-2 rounded-xl hover:bg-slate-100 transition text-slate-400 hover:text-slate-700">
                    <i data-lucide="x" class="w-5 h-5"></i>
                </button>
            </div>

            <h2 class="text-2xl font-black tracking-tighter text-slate-900 uppercase mb-2">
                Rejoignez NADO
            </h2>
            <p class="text-slate-500 font-medium text-sm mb-7">
                Pour soumettre vos véhicules, créez un compte vendeur. Choisissez votre profil :
            </p>

            <div class="grid grid-cols-2 gap-3 mb-6" id="profileChoice">
                <button data-profile="particulier"
                    class="profile-btn flex flex-col items-center gap-3 p-5 rounded-2xl border-2 border-slate-200 bg-slate-50 transition cursor-pointer">
                    <div class="icon-wrap w-12 h-12 rounded-2xl flex items-center justify-center">
                        <i data-lucide="user" class="w-6 h-6"></i>
                    </div>
                    <span class="btn-label text-sm font-black uppercase tracking-wider">Particulier</span>
                </button>
                <button data-profile="entreprise"
                    class="profile-btn flex flex-col items-center gap-3 p-5 rounded-2xl border-2 border-slate-200 bg-slate-50 transition cursor-pointer">
                    <div class="icon-wrap w-12 h-12 rounded-2xl flex items-center justify-center">
                        <i data-lucide="building-2" class="w-6 h-6"></i>
                    </div>
                    <span class="btn-label text-sm font-black uppercase tracking-wider">Entreprise</span>
                </button>
            </div>

            <a id="btnGoRegister" href="{{ route('nadoautoenchere.register') }}"
                class="w-full inline-flex items-center justify-center gap-2 px-6 py-4 rounded-2xl bg-[#1459DD] text-white font-black text-xs uppercase tracking-widest hover:bg-[#0f47b5] transition active:scale-95 opacity-40 pointer-events-none">
                <i data-lucide="arrow-right" class="w-4 h-4"></i>
                Créer mon compte
            </a>

            <div class="mt-4 text-center">
                <span class="text-sm text-slate-500 font-medium">Déjà un compte ?</span>
                <a href="{{ route('client.login') }}" class="ml-1 text-sm font-black text-[#1459DD] hover:underline">Se connecter</a>
            </div>
        </div>
    </div>


    {{-- ═══════════════════════════════════════════════════
         MODAL — Formulaire contact / véhicules (vendeur connecté)
    ═══════════════════════════════════════════════════ --}}
    <div id="modalContact" class="modal-overlay fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm hidden opacity-0">
        <div class="modal-box bg-white rounded-3xl shadow-2xl w-full max-w-xl max-h-[90vh] overflow-y-auto p-8 scale-95 opacity-0">

            <div class="flex items-center justify-between mb-6">
                <div class="inline-flex items-center gap-2 px-3 py-1.5 bg-[#25D366]/10 rounded-full">
                    <i data-lucide="message-circle" class="w-4 h-4 text-[#25D366]"></i>
                    <span class="text-[10px] font-black uppercase tracking-widest text-[#25D366]">WhatsApp</span>
                </div>
                <button class="modal-close p-2 rounded-xl hover:bg-slate-100 transition text-slate-400 hover:text-slate-700">
                    <i data-lucide="x" class="w-5 h-5"></i>
                </button>
            </div>

            <h2 class="text-2xl font-black tracking-tighter text-slate-900 uppercase mb-1">
                Soumettre mes véhicules
            </h2>
            <p class="text-slate-500 font-medium text-sm mb-6">Vos informations sont pré-remplies. Ajoutez vos véhicules.</p>

            <form id="whatsappForm" class="space-y-5">

                {{-- Infos client (readonly) --}}
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">Nom complet</label>
                        <input type="text" id="waNom" value="{{ $clientName }}" readonly
                            class="w-full px-4 py-3 rounded-2xl border border-slate-200 bg-slate-50 text-slate-700 font-semibold text-sm cursor-not-allowed">
                    </div>
                    <div>
                        <label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">Téléphone</label>
                        <input type="tel" id="waTel" value="{{ $clientPhone }}" readonly
                            class="w-full px-4 py-3 rounded-2xl border border-slate-200 bg-slate-50 text-slate-700 font-semibold text-sm cursor-not-allowed">
                    </div>
                </div>

                {{-- Liste véhicules --}}
                <div>
                    <div class="flex items-center justify-between mb-3">
                        <label class="text-xs font-black uppercase tracking-widest text-slate-600">Véhicules</label>
                        <span id="vehiculeCount" class="text-xs font-black text-[#1459DD] bg-[#1459DD]/10 px-2 py-1 rounded-full">0 véhicule</span>
                    </div>
                    <div id="vehiculesList" class="space-y-4"></div>
                </div>

                {{-- Bouton ajouter véhicule --}}
                <button type="button" id="btnAddVehicule"
                    class="w-full inline-flex items-center justify-center gap-2 px-5 py-3.5 rounded-2xl border-2 border-dashed border-[#1459DD]/30 bg-[#1459DD]/5 text-[#1459DD] font-black text-xs uppercase tracking-widest hover:border-[#1459DD]/60 hover:bg-[#1459DD]/10 transition active:scale-95">
                    <i data-lucide="plus-circle" class="w-4 h-4"></i>
                    Ajouter un véhicule
                </button>

                {{-- Message optionnel --}}
                <div>
                    <label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">Message (optionnel)</label>
                    <textarea id="waMessage" rows="2" placeholder="Informations complémentaires…"
                        class="w-full px-4 py-3 rounded-2xl border border-slate-200 bg-white text-slate-900 font-semibold text-sm focus:outline-none focus:ring-2 focus:ring-[#25D366]/30 focus:border-[#25D366] transition resize-none"></textarea>
                </div>

                {{-- Envoyer --}}
                <button type="submit"
                    class="w-full inline-flex items-center justify-center gap-2 px-6 py-4 rounded-2xl bg-[#25D366] text-white font-black text-xs uppercase tracking-widest hover:bg-[#1ebe5d] transition active:scale-95 shadow-lg shadow-[#25D366]/20">
                    <i data-lucide="send" class="w-4 h-4"></i>
                    Envoyer sur WhatsApp
                </button>
            </form>
        </div>
    </div>


    <script>
    var BRANDS = {!! $brandsJson !!};

    document.addEventListener('DOMContentLoaded', function () {
        if (typeof lucide !== 'undefined') lucide.createIcons();

        var isVendeur  = {{ $isVendeur ? 'true' : 'false' }};
        var vehicleCount = 0;

        /* ── helpers modal ── */
        function openModal(id) {
            var overlay = document.getElementById(id);
            var box     = overlay.querySelector('.modal-box');
            overlay.classList.remove('hidden');
            requestAnimationFrame(function () {
                overlay.classList.remove('opacity-0');
                box.classList.remove('scale-95', 'opacity-0');
                box.classList.add('scale-100', 'opacity-100');
            });
        }

        function closeModal(id) {
            var overlay = document.getElementById(id);
            var box     = overlay.querySelector('.modal-box');
            overlay.classList.add('opacity-0');
            box.classList.remove('scale-100', 'opacity-100');
            box.classList.add('scale-95', 'opacity-0');
            setTimeout(function () { overlay.classList.add('hidden'); }, 250);
        }

        /* ── bouton principal ── */
        document.getElementById('btnOpenModal').addEventListener('click', function () {
            openModal(isVendeur ? 'modalContact' : 'modalRegister');
        });

        /* ── fermer les modals ── */
        document.querySelectorAll('.modal-close').forEach(function (btn) {
            btn.addEventListener('click', function () {
                closeModal('modalRegister');
                closeModal('modalContact');
            });
        });
        ['modalRegister', 'modalContact'].forEach(function (id) {
            document.getElementById(id).addEventListener('click', function (e) {
                if (e.target === this) closeModal(id);
            });
        });

        /* ── choix profil (modal register) ── */
        var selectedProfile = null;
        var btnGo = document.getElementById('btnGoRegister');
        var baseRegisterUrl = '{{ route('nadoautoenchere.register') }}';

        document.querySelectorAll('.profile-btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                selectedProfile = this.dataset.profile;
                document.querySelectorAll('.profile-btn').forEach(function (b) {
                    b.classList.remove('is-selected');
                });
                this.classList.add('is-selected');
                btnGo.classList.remove('opacity-40', 'pointer-events-none');
                btnGo.href = baseRegisterUrl + '?profile=' + selectedProfile;
            });
        });

        /* ── ajouter véhicule ── */
        document.getElementById('btnAddVehicule').addEventListener('click', addVehicule);

        var selectCls = 'w-full px-4 py-3 rounded-2xl border border-slate-200 bg-white text-slate-900 font-semibold text-sm focus:outline-none focus:ring-2 focus:ring-[#1459DD]/30 focus:border-[#1459DD] transition';
        var inputCls  = selectCls;

        function buildMarqueOptions() {
            var opts = '<option value="">-- Marque --</option>';
            BRANDS.forEach(function (b) {
                opts += '<option value="' + b.name + '" data-id="' + b.id + '">' + b.name + '</option>';
            });
            return opts;
        }

        function buildModeleOptions(brandId) {
            var opts = '<option value="">-- Modèle --</option>';
            if (!brandId) return opts;
            var brand = BRANDS.find(function (b) { return b.id == brandId; });
            if (!brand) return opts;
            brand.modeles.forEach(function (m) {
                opts += '<option value="' + m.name + '">' + m.name + '</option>';
            });
            return opts;
        }

        function addVehicule() {
            vehicleCount++;
            updateCount();

            var list = document.getElementById('vehiculesList');
            var idx  = vehicleCount;

            var card = document.createElement('div');
            card.className = 'vehicule-card bg-slate-50 border border-slate-200 rounded-2xl p-4 space-y-3';
            card.dataset.idx = idx;

            card.innerHTML =
                '<div class="flex items-center justify-between">' +
                    '<span class="text-xs font-black uppercase tracking-widest text-[#1459DD]">Véhicule ' + idx + '</span>' +
                    '<button type="button" class="btn-remove-vehicule p-1.5 rounded-xl hover:bg-red-50 text-slate-400 hover:text-red-500 transition">' +
                        '<i data-lucide="trash-2" class="w-4 h-4"></i>' +
                    '</button>' +
                '</div>' +
                '<div class="grid grid-cols-2 gap-3">' +
                    '<div>' +
                        '<label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">Marque *</label>' +
                        '<select class="vehicule-marque ' + selectCls + '" data-v="' + idx + '">' + buildMarqueOptions() + '</select>' +
                    '</div>' +
                    '<div>' +
                        '<label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">Modèle *</label>' +
                        '<select class="vehicule-modele ' + selectCls + '" data-v="' + idx + '" disabled>' + buildModeleOptions(null) + '</select>' +
                    '</div>' +
                    '<div>' +
                        '<label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">Kilométrage *</label>' +
                        '<input type="number" class="vehicule-kilometrage ' + inputCls + '" placeholder="Ex : 85000" data-v="' + idx + '">' +
                    '</div>' +
                    '<div>' +
                        '<label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">Année *</label>' +
                        '<input type="number" class="vehicule-annee ' + inputCls + '" placeholder="Ex : 2019" data-v="' + idx + '">' +
                    '</div>' +
                '</div>' +
                '<div>' +
                    '<label class="block text-xs font-black uppercase tracking-widest text-slate-500 mb-1">État</label>' +
                    '<select class="vehicule-etat ' + selectCls + '" data-v="' + idx + '">' +
                        '<option value="">-- Sélectionner --</option>' +
                        '<option value="Excellent">Excellent</option>' +
                        '<option value="Bon">Bon</option>' +
                        '<option value="Correct">Correct</option>' +
                        '<option value="À réviser">À réviser</option>' +
                    '</select>' +
                '</div>';

            list.appendChild(card);
            if (typeof lucide !== 'undefined') lucide.createIcons();

            var marqueSelect = card.querySelector('.vehicule-marque');
            var modeleSelect = card.querySelector('.vehicule-modele');

            marqueSelect.addEventListener('change', function () {
                var selectedOption = this.options[this.selectedIndex];
                var brandId = selectedOption.dataset.id || null;
                modeleSelect.innerHTML = buildModeleOptions(brandId);
                modeleSelect.disabled = !brandId;
            });

            card.querySelector('.btn-remove-vehicule').addEventListener('click', function () {
                card.remove();
                vehicleCount--;
                updateCount();
                renumberCards();
            });
        }

        function updateCount() {
            var el = document.getElementById('vehiculeCount');
            el.textContent = vehicleCount + (vehicleCount > 1 ? ' véhicules' : ' véhicule');
        }

        function renumberCards() {
            document.querySelectorAll('.vehicule-card').forEach(function (card, i) {
                card.querySelector('span').textContent = 'Véhicule ' + (i + 1);
            });
        }

        /* ── envoi WhatsApp ── */
        document.getElementById('whatsappForm').addEventListener('submit', function (e) {
            e.preventDefault();

            var nom = document.getElementById('waNom').value.trim();
            var tel = document.getElementById('waTel').value.trim();
            var msg = document.getElementById('waMessage').value.trim();

            var text = '🚗 *Demande vendeur NADO*\n\n'
                     + '👤 Nom : ' + nom + '\n'
                     + '📞 Téléphone : ' + tel + '\n';

            var cards = document.querySelectorAll('.vehicule-card');
            if (cards.length === 0) {
                alert('Veuillez ajouter au moins un véhicule.');
                return;
            }

            text += '\n🚘 *Véhicules (' + cards.length + ')* :\n';
            cards.forEach(function (card, i) {
                var marque = card.querySelector('.vehicule-marque') ? card.querySelector('.vehicule-marque').value.trim() : '';
                var modele = card.querySelector('.vehicule-modele') ? card.querySelector('.vehicule-modele').value.trim() : '';
                var km     = card.querySelector('.vehicule-kilometrage') ? card.querySelector('.vehicule-kilometrage').value.trim() : '';
                var annee  = card.querySelector('.vehicule-annee') ? card.querySelector('.vehicule-annee').value.trim() : '';
                var etat   = card.querySelector('.vehicule-etat') ? card.querySelector('.vehicule-etat').value : '';

                text += '\n  ' + (i + 1) + '. ' + [marque, modele, annee].filter(Boolean).join(' ');
                if (km)   text += ' — ' + parseInt(km).toLocaleString('fr-FR') + ' km';
                if (etat) text += ' — État : ' + etat;
                text += '\n';
            });

            if (msg) text += '\n💬 ' + msg + '\n';

            window.open('https://wa.me/212637916134?text=' + encodeURIComponent(text), '_blank');
        });
    });
    </script>
</body>
</html>
