<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catégories d'enchères | AUTOMANAGER Auto Enchère</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: { inter: ['Jost', 'sans-serif'] },
                    colors:    { primary: '#0E0F12', accent: '#C8A24B' },
                }
            }
        }
    </script>
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        body { font-family: 'Jost', sans-serif; }
        ::selection { background-color: #C8A24B; color: white; }
        .card-shadow       { box-shadow: 0 2px 10px rgb(0 0 0 / 0.02); }
        .card-shadow-hover { box-shadow: 0 20px 40px rgb(20 89 221 / 0.08); }
        .sidebar-shadow    { box-shadow: 0 8px 30px rgb(0 0 0 / 0.04); }
        .select-reset      { -webkit-appearance: none; -moz-appearance: none; appearance: none; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2364748b' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E"); background-repeat: no-repeat; background-position: right 1rem center; padding-right: 2.5rem; }
    </style>
</head>
<body class="min-h-screen bg-slate-50 pb-12 font-inter selection:bg-[#C8A24B] selection:text-white">

    {{-- ── NAVBAR (shared) ── --}}
    @section('na_nav_links')
        <a href="{{ route('nadoautoenchere.vendre') }}"
           class="text-[13px] font-bold uppercase tracking-wide px-3 py-2 rounded-2xl transition-all text-slate-700 hover:text-[#C8A24B] hover:bg-orange-50">
            Vendre
        </a>
        <a href="{{ route('nadoautoenchere.index') }}"
           class="text-[13px] font-bold uppercase tracking-wide px-3 py-2 rounded-2xl transition-all text-slate-700 hover:text-[#0E0F12] hover:bg-slate-100">
            Tous les véhicules
        </a>
    @endsection
    @include('nadoautoenchere.partials.navbar')

    <div class="max-w-7xl mx-auto px-6 pt-10">

        {{-- ── Hero / Header ── --}}
        <header class="flex flex-col md:flex-row md:items-end md:justify-between gap-6 mb-12">
            <div>
                <div class="inline-flex items-center gap-2 px-3 py-1.5 bg-[#0E0F12]/10 rounded-full mb-4">
                    <i data-lucide="building-2" class="w-[14px] h-[14px] text-[#0E0F12]"></i>
                    <span class="text-[10px] font-black uppercase tracking-[0.2em] text-[#0E0F12]">Entreprises partenaires</span>
                </div>
                <h1 class="text-4xl md:text-5xl font-black text-slate-900 uppercase tracking-tighter">
                    Catégories <span class="text-[#C8A24B]">d'enchères</span>
                </h1>
                <p class="mt-4 text-slate-600 font-medium max-w-xl text-lg">
                    Parcourez nos entreprises partenaires et découvrez les flottes de véhicules disponibles aux enchères.
                </p>
            </div>
            <a href="{{ url()->previous() }}"
               class="inline-flex items-center gap-2 px-6 py-3 bg-white text-slate-900 border border-slate-200 rounded-xl font-bold text-sm uppercase tracking-widest hover:bg-slate-50 transition-all self-start md:self-end">
                <i data-lucide="arrow-left" class="w-4 h-4"></i> Retour
            </a>
        </header>

        {{-- ── Content ── --}}
        <div class="flex flex-col lg:flex-row gap-8">

            {{-- ── Sidebar / Filters ── --}}
            <aside class="lg:w-80 lg:shrink-0">
                <div class="bg-white rounded-3xl p-6 border border-slate-100 sidebar-shadow lg:sticky lg:top-8">
                    <div class="flex items-center gap-3 mb-8 border-b border-slate-100 pb-4">
                        <div class="w-9 h-9 rounded-xl bg-[#C8A24B]/10 flex items-center justify-center">
                            <i data-lucide="filter" class="w-4 h-4 text-[#C8A24B]"></i>
                        </div>
                        <h2 class="text-lg font-black uppercase tracking-tight text-slate-900">Filtres</h2>
                    </div>

                    <form id="filtersForm" class="space-y-6" onsubmit="event.preventDefault(); fetchFiltered();">
                        {{-- Search --}}
                        <div>
                            <label for="company-search" class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Recherche</label>
                            <div class="relative">
                                <i data-lucide="search" class="w-4 h-4 text-slate-400 absolute left-4 top-1/2 -translate-y-1/2 pointer-events-none"></i>
                                <input id="company-search" name="company" type="text" placeholder="Entreprise, ville…"
                                    class="w-full pl-12 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm text-slate-700 placeholder:text-slate-400 focus:ring-2 focus:ring-[#0E0F12]/20 focus:border-[#0E0F12] transition-all outline-none">
                            </div>
                        </div>

                        {{-- Marque --}}
                        <div>
                            <label for="mark" class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Marque</label>
                            <select id="mark" name="mark"
                                class="select-reset w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm text-slate-700 cursor-pointer focus:ring-2 focus:ring-[#0E0F12]/20 focus:border-[#0E0F12] transition-all outline-none">
                                <option value="">Toutes les marques</option>
                                @foreach($brands as $brand)
                                    <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        {{-- Modèle --}}
                        <div>
                            <label for="modele" class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Modèle</label>
                            <select id="modele" name="modele"
                                class="select-reset w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm text-slate-700 cursor-pointer focus:ring-2 focus:ring-[#0E0F12]/20 focus:border-[#0E0F12] transition-all outline-none">
                                <option value="">Tous les modèles</option>
                            </select>
                        </div>

                        {{-- Ville --}}
                        <div>
                            <label for="city" class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Ville</label>
                            <select id="city" name="city"
                                class="select-reset w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm text-slate-700 cursor-pointer focus:ring-2 focus:ring-[#0E0F12]/20 focus:border-[#0E0F12] transition-all outline-none">
                                <option value="">Toutes les villes</option>
                                @foreach($cities as $city)
                                    <option value="{{ $city }}">{{ $city }}</option>
                                @endforeach
                            </select>
                        </div>

                        {{-- Reset --}}
                        <button type="button" id="resetBtn"
                            class="w-full py-3 mt-4 text-xs font-bold text-slate-500 hover:text-slate-900 border border-transparent hover:border-slate-200 rounded-xl uppercase tracking-widest transition-all">
                            Réinitialiser
                        </button>
                    </form>
                </div>
            </aside>

            {{-- ── Main ── --}}
            <main class="flex-1 min-w-0">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-sm font-bold uppercase tracking-widest text-slate-500">
                        <span id="resultsCount" class="text-slate-900 font-black">{{ $categories->count() }}</span>
                        catégorie{{ $categories->count() > 1 ? 's' : '' }} disponible{{ $categories->count() > 1 ? 's' : '' }}
                    </h3>
                </div>

                <div id="resultsGrid" class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    @include('nadoautoenchere.partials.categories-list')
                </div>
            </main>
        </div>
    </div>

    {{-- ── Scripts ── --}}
    <script>
        lucide.createIcons();

        const mark     = document.getElementById('mark');
        const modele   = document.getElementById('modele');
        const city     = document.getElementById('city');
        const search   = document.getElementById('company-search');
        const resetBtn = document.getElementById('resetBtn');
        const grid     = document.getElementById('resultsGrid');
        const countEl  = document.getElementById('resultsCount');

        // Debounce helper
        let debounceId = null;
        function debounce(fn, ms = 300) {
            return function (...args) {
                clearTimeout(debounceId);
                debounceId = setTimeout(() => fn.apply(this, args), ms);
            };
        }

        // Load models for selected brand
        mark.addEventListener('change', function () {
            const brandId = mark.value;
            modele.innerHTML = '<option value="">Tous les modèles</option>';
            if (!brandId) { fetchFiltered(); return; }
            fetch(`/client/models-by-brand/${brandId}`)
                .then(r => r.json())
                .then(data => {
                    data.forEach(m => {
                        modele.insertAdjacentHTML('beforeend',
                            `<option value="${m.id}">${m.name}</option>`);
                    });
                    fetchFiltered();
                });
        });

        function fetchFiltered() {
            const params = new URLSearchParams({
                company: search.value,
                mark:    mark.value,
                modele:  modele.value,
                city:    city.value,
            });
            fetch(`{{ route('nadoautoenchere.filterCategories') }}?${params.toString()}`)
                .then(r => r.text())
                .then(html => {
                    grid.innerHTML = html;
                    lucide.createIcons();
                    startTimers();
                    // Update count from data attribute on grid's first child, or count children
                    const cards = grid.querySelectorAll('[data-ends]');
                    countEl.textContent = cards.length;
                });
        }

        search.addEventListener('input',  debounce(fetchFiltered, 300));
        modele.addEventListener('change', fetchFiltered);
        city.addEventListener('change',   fetchFiltered);

        resetBtn.addEventListener('click', function () {
            search.value = '';
            mark.value = '';
            city.value = '';
            modele.innerHTML = '<option value="">Tous les modèles</option>';
            fetchFiltered();
        });

        // ── Countdown timers ──
        let timerInterval = null;
        function updateTimers() {
            document.querySelectorAll('#resultsGrid [data-ends]').forEach(card => {
                const endTs = parseInt(card.dataset.ends, 10);
                const timeEl = card.querySelector('.remaining-time');
                if (!endTs || !timeEl) return;

                const now  = Math.floor(Date.now() / 1000);
                const diff = endTs - now;

                if (diff <= 0) {
                    timeEl.textContent = 'Terminé';
                    return;
                }
                const days    = Math.floor(diff / 86400);
                const hours   = Math.floor((diff % 86400) / 3600);
                const minutes = Math.floor((diff % 3600) / 60);
                const seconds = diff % 60;
                let txt = '';
                if (days > 0) txt += days + 'j ';
                txt += String(hours).padStart(2,'0') + 'h '
                     + String(minutes).padStart(2,'0') + 'm '
                     + String(seconds).padStart(2,'0') + 's';
                timeEl.textContent = txt;
            });
        }
        function startTimers() {
            updateTimers();
            clearInterval(timerInterval);
            timerInterval = setInterval(updateTimers, 1000);
        }
        startTimers();
    </script>
</body>
</html>
