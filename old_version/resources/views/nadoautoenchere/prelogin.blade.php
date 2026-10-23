@if ($errors->any())
    <div class="fixed top-4 right-4 z-[100] max-w-sm bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
        role="alert">
        <strong class="font-bold">Erreur!</strong>
        <ul class="mt-1 list-disc list-inside">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
        <span class="absolute top-0 bottom-0 right-0 px-4 py-3" onclick="this.parentElement.style.display='none';">
            <svg class="fill-current h-6 w-6 text-red-500" role="button" xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20">
                <title>Fermer</title>
                <path
                    d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z" />
            </svg>
        </span>
    </div>
@endif

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auto Enchère</title>

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Tailwind Config for Custom Colors/Fonts -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        inter: ['Inter', 'sans-serif'],
                    },
                    colors: {
                        primary: '#1459DD',
                        accent: '#F37021',
                    }
                }
            }
        }
    </script>

    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        ::selection {
            background-color: #F37021;
            color: white;
        }

        /* Mobile Menu Transitions */
        .mobile-menu-enter {
            transform: translateX(100%);
        }

        .mobile-menu-enter-active {
            transform: translateX(0);
        }

        .mobile-menu-exit {
            transform: translateX(0);
        }

        .mobile-menu-exit-active {
            transform: translateX(100%);
        }
    </style>
</head>

<body class="min-h-screen bg-white text-slate-900">

    <!-- NAVBAR -->
    <header class="sticky top-0 z-50">
        <!-- Top Bar Info -->
        <div class="bg-[#F37021] text-slate-900 py-2.5 px-4 border-b border-black/5">
            <div class="max-w-7xl mx-auto flex justify-between items-center">
                <div class="flex items-center gap-[0.3rem]">
                    <div class="flex items-center gap-2 text-[11px] font-black uppercase tracking-widest opacity-[0.8]">
                        <i data-lucide="mail" class="w-3 h-3 text-[#1459DD]"></i>
                        <a href="mailto:contact@nado.ma"
                            class="hover:text-[#1459DD] transition-colors">contact@nado.ma</a>
                    </div>
                    <div class="flex items-center gap-2 text-[11px] font-black uppercase tracking-widest opacity-[0.8]">
                        <i data-lucide="phone-call" class="w-3 h-3 text-[#1459DD]"></i>
                        <a href="tel:+212520070611" class="hover:text-[#1459DD] transition-colors">+212 520 070 611</a>
                    </div>
                </div>

                <div class="flex items-center gap-5">
                    <a href="#" class="hover:text-[#1459DD] transition-colors opacity-60 hover:opacity-100">
                        <i data-lucide="facebook" class="w-5 h-5" stroke-width="1.5"></i>
                    </a>
                    <a href="#" class="hover:text-[#1459DD] transition-colors opacity-60 hover:opacity-100">
                        <i data-lucide="instagram" class="w-5 h-5" stroke-width="1.5"></i>
                    </a>
                    <a href="#" class="hover:text-[#1459DD] transition-colors opacity-60 hover:opacity-100">
                        <i data-lucide="linkedin" class="w-5 h-5" stroke-width="1.5"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Main Navigation -->
        <nav class="bg-white border-b border-slate-200 shadow-sm relative">
            <div class="max-w-7xl mx-auto px-[1rem] h-24 flex items-center justify-between gap-3 lg:gap-0">
                <div class="flex items-center gap-[4rem]">
                    <!-- Logo Section -->
                    <a href="{{ url('/') }}"
                        class="flex items-center cursor-pointer group hover:scale-105 transition-transform text-decoration-none">
                        <span class="text-3xl md:text-4xl font-black tracking-tight uppercase leading-none">
                            <span class="text-slate-900">AUTO </span>
                            <span class="text-[#F37021]">ENCHÈRE</span>
                        </span>
                    </a>

                    <!-- Desktop Navigation Links -->
                    <div class="hidden lg:flex items-center gap-3 relative">
                        <!-- Acheter -->
                        <button
                            class="text-[14.4px] font-[700] uppercase tracking-wide px-3 py-2 rounded-2xl transition-all text-slate-700 hover:text-[#1459DD] hover:bg-slate-100">
                            Acheter
                        </button>

                        <!-- Vendre Dropdown -->
                        <div class="relative" id="vendre-dropdown-container">
                            <button id="vendre-btn"
                                class="text-[14.4px] font-[700] uppercase tracking-wide flex items-center gap-2 px-4 py-2 rounded-2xl text-slate-700 hover:text-[#F37021] hover:bg-orange-50 transition-all">
                                Vendre
                                <i data-lucide="chevron-right" id="vendre-chevron"
                                    class="w-[14px] h-[14px] transition-transform"></i>
                            </button>

                            <!-- Dropdown Menu -->
                            <div id="vendre-dropdown"
                                class="hidden absolute top-full left-0 mt-2 bg-white rounded-2xl shadow-xl border border-slate-100 min-w-[200px] overflow-hidden z-50">
                                <a href="{{ route('client.register') }}"
                                    class="block w-full text-left px-5 py-4 text-sm font-bold uppercase tracking-wide text-slate-700 hover:bg-orange-50 hover:text-[#F37021] transition-all">
                                    Particulier
                                </a>
                                <a href="{{ route('client.login') }}"
                                    class="block w-full text-left px-5 py-4 text-sm font-bold uppercase tracking-wide text-slate-700 hover:bg-orange-50 hover:text-[#F37021] transition-all">
                                    Professionnel
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="flex items-center gap-3 ml-auto">
                    <a href="{{ route('client.register') }}"
                        class="group flex items-center gap-2 px-4 py-2.5 rounded-2xl bg-[#F37021]/20 border border-[#F37021]/50 hover:bg-[#F37021] text-slate-900 font-extrabold text-[15px] uppercase tracking-widest transition-all active:scale-95">
                        <span class="whitespace-nowrap">Créez un compte</span>
                    </a>

                    <button id="mobile-menu-btn"
                        class="lg:hidden p-3 text-slate-900 bg-slate-50 rounded-xl hover:bg-slate-100 transition-colors">
                        <i data-lucide="menu" class="w-6 h-6"></i>
                    </button>
                </div>
            </div>

            <!-- MOBILE DRAWER MENU -->
            <div id="mobile-menu-overlay"
                class="fixed inset-0 z-[100] transition-all duration-500 lg:hidden invisible opacity-0">
                <!-- Backdrop Overlay -->
                <div class="absolute inset-0 bg-slate-900/40 backdrop-blur-md"></div>

                <!-- Side Drawer Content -->
                <div id="mobile-drawer"
                    class="absolute top-0 right-0 h-full w-[85%] max-w-[420px] bg-white shadow-2xl transition-transform duration-500 translate-x-full flex flex-col">

                    <!-- Drawer Header -->
                    <div class="p-8 flex items-center justify-between">
                        <span class="text-2xl font-black tracking-tighter uppercase">
                            <span class="text-slate-900">AUTO </span>
                            <span class="text-[#F37021]">ENCHÈRE</span>
                        </span>
                        <button id="mobile-menu-close"
                            class="p-2 text-slate-400 hover:text-slate-900 transition-colors">
                            <i data-lucide="x" class="w-8 h-8" stroke-width="1.5"></i>
                        </button>
                    </div>

                    <!-- Navigation Links -->
                    <div class="flex-1 overflow-y-auto px-8 py-4 flex flex-col gap-6">
                        <button
                            class="w-full text-left text-lg font-black uppercase tracking-tighter transition-all text-slate-800 hover:text-[#1459DD]">
                            Acheter
                        </button>
                        <!-- Mobile Dropdown for Vendre mimicking desktop structure or simplified -->
                        <div class="flex flex-col gap-4">
                            <span class="text-lg font-black uppercase tracking-tighter text-slate-800">Vendre</span>
                            <div class="pl-4 flex flex-col gap-3 border-l-2 border-slate-100">
                                <a href="{{ route('client.register') }}"
                                    class="block w-full text-left text-sm font-bold uppercase tracking-wide text-slate-600 hover:text-[#F37021]">
                                    Particulier
                                </a>
                                <a href="{{ route('client.login') }}"
                                    class="block w-full text-left text-sm font-bold uppercase tracking-wide text-slate-600 hover:text-[#F37021]">
                                    Professionnel
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Drawer Footer -->
                    <div class="p-10 flex flex-col items-center">
                        <!-- Main CTA Button -->
                        <a href="{{ route('client.register') }}"
                            class="w-full py-6 bg-[#F37021] shadow-[0_20px_40px_-10px_rgba(243,112,33,0.4)] text-slate-900 rounded-[2rem] font-black text-sm uppercase tracking-[0.2em] flex items-center justify-center gap-3 mb-12 active:scale-95 transition-transform">
                            <i data-lucide="user" class="w-5 h-5" stroke-width="3"></i> Publier une annonce
                        </a>

                        <!-- Social Icons Centered -->
                        <div class="flex justify-center gap-10 mb-12">
                            <a href="#" class="text-slate-400 hover:text-slate-900 transition-colors">
                                <i data-lucide="facebook" class="w-5 h-5"></i>
                            </a>
                            <a href="#" class="text-slate-400 hover:text-slate-900 transition-colors">
                                <i data-lucide="instagram" class="w-5 h-5"></i>
                            </a>
                            <a href="#" class="text-slate-400 hover:text-slate-900 transition-colors">
                                <i data-lucide="linkedin" class="w-5 h-5"></i>
                            </a>
                        </div>

                        <!-- Divider -->
                        <div class="w-full h-px bg-slate-100 mb-10"></div>

                        <!-- Support Section -->
                        <div class="text-center space-y-3">
                            <p
                                class="text-sm font-extrabold uppercase tracking-wide transition-all flex items-center gap-2 px-6 py-3 rounded-2xl whitespace-nowrap">
                                Support NADO
                            </p>
                            <a href="tel:+212520070611"
                                class="text-xl font-black text-slate-900 block hover:text-[#1459DD] transition-colors">+212
                                520 070 611</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <!-- HERO SECTION -->
    <section class="relative min-h-[70vh] flex items-center justify-center bg-white">
        <div class="max-w-6xl mx-auto px-6 text-center">

            <h1 class="text-4xl md:text-4xl font-black text-slate-900 tracking-tighter uppercase mb-4">
                Ventes aux enchères de véhicules d'occasion
            </h1>

            <p class="text-sm md:text-base font-black uppercase tracking-[0.25em] text-[#F37021] mb-6">
                Transparence • Professionnalisme • Tranquillité
            </p>

            <!-- CTA SCROLL BUTTON -->
            <button onclick="document.getElementById('comment-ca-marche').scrollIntoView({ behavior: 'smooth' })"
                class="inline-flex items-center gap-3 px-8 py-4 mb-12 bg-[#F37021]/10 text-[#F37021] rounded-2xl font-black text-xs uppercase tracking-widest hover:bg-[#F37021] hover:text-white transition-all shadow-md active:scale-95 cursor-pointer border-none">
                Comment ça marche
                <i data-lucide="arrow-right" class="w-4 h-4"></i>
            </button>

            <p class="text-lg text-slate-600 font-medium max-w-2xl mx-auto mb-12">
                Accédez aux meilleures opportunités du marché automobile marocain,
                avec un processus sécurisé, clair et équitable.
            </p>

            <div class="flex flex-wrap justify-center gap-6">
                <!-- Participer Button -->
                <a href="{{ route('client.register') }}"
                    class="px-10 py-5 bg-[#F37021] text-white rounded-2xl font-black text-xs uppercase tracking-widest hover:scale-105 transition-all shadow-xl shadow-[#F37021]/20 active:scale-95 flex items-center gap-3 cursor-pointer border-none decoration-transparent">
                    Participer aux enchères <i data-lucide="arrow-up-right" class="w-[18px] h-[18px]"></i>
                </a>

                <!-- Voir Véhicules Button -->
                <button
                    class="px-10 py-5 bg-slate-100 text-slate-900 rounded-2xl font-black text-xs uppercase tracking-widest hover:bg-slate-200 transition-all flex items-center gap-3 cursor-pointer border-none">
                    <i data-lucide="eye" class="w-[18px] h-[18px] text-[#1459DD]"></i>
                    Voir les véhicules
                </button>
            </div>

        </div>
    </section>

    <!-- EXPERTISE SECTION -->
    <section class="py-32 bg-white relative overflow-hidden">
        <div class="absolute top-0 right-0 w-96 h-96 bg-[#1459DD]/5 blur-[120px] pointer-events-none"></div>

        <div class="max-w-7xl mx-auto px-6 relative z-10">
            <div class="grid grid-cols-1 lg:grid-cols-2 items-center gap-20">

                <div class="text-left">
                    <div
                        class="inline-flex items-center gap-2 px-4 py-2 bg-[#F37021]/10 border border-[#F37021]/20 rounded-full mb-8">
                        <i data-lucide="sparkles" class="w-4 h-4 text-[#F37021]"></i>
                        <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-600">NOTRE
                            EXPERTISE</span>
                    </div>

                    <h2
                        class="text-4xl md:text-6xl font-black text-slate-900 leading-[0.9] tracking-tighter uppercase mb-8">
                        Bénéficiez de <br />
                        <span class="text-[#1459DD]">notre expertise</span> <br />
                        pour vos <span class="text-[#F37021]">profits</span>
                    </h2>

                    <p class="text-xl text-slate-600 font-medium leading-relaxed mb-12">
                        Notre équipe d'experts automobile vous accompagne à chaque étape pour maximiser vos
                        investissements et sécuriser vos transactions.
                    </p>

                    <div class="space-y-6">
                        <div class="flex items-start gap-4">
                            <div
                                class="w-12 h-12 bg-[#1459DD]/10 rounded-2xl flex items-center justify-center shrink-0">
                                <i data-lucide="shield-check" class="w-6 h-6 text-[#1459DD]"></i>
                            </div>
                            <div>
                                <h3 class="text-lg font-black text-slate-900 uppercase mb-2">Véhicules certifiés</h3>
                                <p class="text-slate-600 font-medium text-sm leading-relaxed">Inspection complète de
                                    110 points pour chaque véhicule mis aux enchères</p>
                            </div>
                        </div>

                        <div class="flex items-start gap-4">
                            <div
                                class="w-12 h-12 bg-[#F37021]/10 rounded-2xl flex items-center justify-center shrink-0">
                                <i data-lucide="trending-up" class="w-6 h-6 text-[#F37021]"></i>
                            </div>
                            <div>
                                <h3 class="text-lg font-black text-slate-900 uppercase mb-2">Prix compétitifs</h3>
                                <p class="text-slate-600 font-medium text-sm leading-relaxed">Jusqu'à 30% moins cher
                                    que le marché traditionnel grâce au système d'enchères</p>
                            </div>
                        </div>

                        <div class="flex items-start gap-4">
                            <div
                                class="w-12 h-12 bg-[#F37021]/20 rounded-2xl flex items-center justify-center shrink-0">
                                <i data-lucide="award" class="w-6 h-6 text-[#F37021]"></i>
                            </div>
                            <div>
                                <h3 class="text-lg font-black text-slate-900 uppercase mb-2">Accompagnement premium
                                </h3>
                                <p class="text-slate-600 font-medium text-sm leading-relaxed">Support dédié et conseils
                                    personnalisés de nos experts automobile</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="relative">
                    <div
                        class="relative bg-white/10 backdrop-blur-xl p-4 rounded-[3.5rem] border border-slate-100 shadow-2xl">
                        <img src="https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&q=80&w=1200"
                            class="rounded-[2.5rem] w-full h-auto object-cover" alt="Expertise Auto Enchère" />
                    </div>
                    <div
                        class="absolute -bottom-8 -left-8 w-32 h-32 bg-[#1459DD] rounded-[2rem] flex items-center justify-center -rotate-12 shadow-2xl border-[6px] border-white">
                        <i data-lucide="gavel" class="w-12 h-12 text-white"></i>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- PARTNERS SECTION -->
    <section class="py-24 bg-slate-50 border-y border-slate-100">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <div
                    class="inline-flex items-center gap-2 px-4 py-2 bg-white border border-slate-200 rounded-full mb-6">
                    <i data-lucide="users" class="w-4 h-4 text-[#1459DD]"></i>
                    <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-600">NOS
                        PARTENAIRES</span>
                </div>
                <h2 class="text-3xl md:text-5xl font-black text-slate-900 uppercase tracking-tighter mb-4">
                    Marques <span class="text-[#1459DD]">Premium</span>
                </h2>
                <p class="text-slate-600 font-medium text-lg max-w-2xl mx-auto">
                    Nous travaillons avec les plus grandes marques automobiles du monde
                </p>
            </div>

            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-8 items-center">
                <!-- Partner Items -->
                <div
                    class="bg-white rounded-2xl p-8 flex items-center justify-center hover:shadow-xl transition-all group border border-slate-100 aspect-square">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/4/44/BMW.svg" alt="BMW"
                        class="h-12 w-auto opacity-60 group-hover:opacity-100 transition-opacity" />
                </div>
                <div
                    class="bg-white rounded-2xl p-8 flex items-center justify-center hover:shadow-xl transition-all group border border-slate-100 aspect-square">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/c/c5/Mercedes-Benz_Logo_2010.svg"
                        alt="Mercedes" class="h-12 w-auto opacity-60 group-hover:opacity-100 transition-opacity" />
                </div>
                <div
                    class="bg-white rounded-2xl p-8 flex items-center justify-center hover:shadow-xl transition-all group border border-slate-100 aspect-square">
                    <img src="https://upload.wikimedia.org/wikipedia/f/fa/Audi_logo_detail.svg" alt="Audi"
                        class="h-12 w-auto opacity-60 group-hover:opacity-100 transition-opacity" />
                </div>
                <div
                    class="bg-white rounded-2xl p-8 flex items-center justify-center hover:shadow-xl transition-all group border border-slate-100 aspect-square">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/4/44/Porsche_logo.svg" alt="Porsche"
                        class="h-12 w-auto opacity-60 group-hover:opacity-100 transition-opacity" />
                </div>
                <div
                    class="bg-white rounded-2xl p-8 flex items-center justify-center hover:shadow-xl transition-all group border border-slate-100 aspect-square">
                    <img src="https://upload.wikimedia.org/wikipedia/fr/c/c9/Land_Rover_Logo.svg" alt="Land Rover"
                        class="h-12 w-auto opacity-60 group-hover:opacity-100 transition-opacity" />
                </div>
                <div
                    class="bg-white rounded-2xl p-8 flex items-center justify-center hover:shadow-xl transition-all group border border-slate-100 aspect-square">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/b/bd/Tesla_Motors.svg" alt="Tesla"
                        class="h-12 w-auto opacity-60 group-hover:opacity-100 transition-opacity" />
                </div>
            </div>
        </div>
    </section>

    <!-- COMMENT ÇA MARCHE SECTION -->
    <section id="comment-ca-marche" class="py-32 bg-white relative overflow-hidden">
        <div class="absolute bottom-0 left-0 w-96 h-96 bg-[#F37021]/5 blur-[120px] pointer-events-none"></div>

        <div class="max-w-7xl mx-auto px-6 relative z-10">
            <div class="text-center mb-20">
                <div
                    class="inline-flex items-center gap-2 px-4 py-2 bg-[#1459DD]/10 border border-[#1459DD]/20 rounded-full mb-6">
                    <i data-lucide="check-circle-2" class="w-4 h-4 text-[#1459DD]"></i>
                    <span class="text-[10px] font-black uppercase tracking-[0.2em] text-slate-600">PROCESSUS
                        SIMPLE</span>
                </div>
                <h2
                    class="text-4xl md:text-7xl font-black text-slate-900 uppercase tracking-tighter leading-[0.85] mb-6">
                    Comment <span class="text-[#1459DD]">ça marche</span>
                </h2>
                <p class="text-xl text-slate-600 font-medium max-w-3xl mx-auto">
                    8 étapes simples pour participer à nos enchères et acquérir le véhicule de vos rêves
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                <!-- Step 1 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">1</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="user-plus" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Créez un
                        compte</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">Renseignez votre nom, numéro de
                        téléphone, et CIN</p>
                </div>

                <!-- Step 2 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">2</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="file-text" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Parcourez
                        la liste</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">Consultez tous les véhicules mis aux
                        enchères avec leur fiche technique et date d'enchère</p>
                </div>

                <!-- Step 3 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">3</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="heart" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Ajoutez à
                        vos favoris</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">Sélectionnez les véhicules qui vous
                        intéressent pour ne pas les rater</p>
                </div>

                <!-- Step 4 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">4</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="map-pin" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Visitez
                        notre parking</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">Californie, Casablanca pour inspecter
                        les véhicules en personne</p>
                </div>

                <!-- Step 5 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">5</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="banknote" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Déposez
                        la caution</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">Lisez les conditions et déposez
                        10,000 DH par chèque, espèce, virement ou TPE</p>
                </div>

                <!-- Step 6 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">6</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="gavel" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Placez
                        vos offres</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">En personne ou en ligne. La meilleure
                        offre l'emporte à la fin de la vente</p>
                </div>

                <!-- Step 7 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">7</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="file-check" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Signez
                        l'accord</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">Signez l'accord de vente pour chaque
                        achat et effectuez le paiement</p>
                </div>

                <!-- Step 8 -->
                <div
                    class="group relative bg-white border border-slate-100 rounded-[2.5rem] p-8 hover:shadow-2xl hover:border-[#1459DD]/30 transition-all text-left">
                    <div
                        class="absolute -top-4 -right-4 w-12 h-12 bg-[#1459DD] rounded-2xl flex items-center justify-center shadow-xl">
                        <span class="text-white font-black text-xl">8</span>
                    </div>
                    <div
                        class="w-16 h-16 bg-[#F37021]/10 text-[#F37021] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] group-hover:text-white transition-all">
                        <i data-lucide="car" class="w-7 h-7"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-900 uppercase tracking-tight mb-3 leading-tight">Récupérez
                        vos véhicules</h3>
                    <p class="text-slate-600 font-medium text-sm leading-relaxed">Récupérez ou faites-vous livrer les
                        voitures que vous avez achetées</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CONTACT SECTION -->
    <section class="py-24 bg-[#0F172A] relative overflow-hidden">
        <div
            class="absolute top-0 right-0 w-1/2 h-full bg-[#1459DD]/10 skew-x-[-15deg] translate-x-32 pointer-events-none">
        </div>

        <div class="max-w-7xl mx-auto px-6 relative z-10">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-6xl font-black text-white uppercase tracking-tighter mb-6">
                    Pour plus <span class="text-[#F37021]">d'infos</span>
                </h2>
                <p class="text-xl text-slate-400 font-medium max-w-2xl mx-auto">
                    Notre équipe est à votre disposition pour répondre à toutes vos questions
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-4xl mx-auto">
                <a href="tel:+212663339072"
                    class="group bg-white/5 backdrop-blur-md border border-white/10 rounded-[2.5rem] p-10 hover:bg-white/10 hover:border-white/20 transition-all text-left decoration-transparent">
                    <div
                        class="w-16 h-16 bg-[#1459DD]/20 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#1459DD] transition-all">
                        <i data-lucide="phone"
                            class="w-7 h-7 text-[#1459DD] group-hover:text-white transition-colors"></i>
                    </div>
                    <span class="block text-[10px] font-black text-white/60 uppercase tracking-widest mb-3">TÉLÉPHONE
                        1</span>
                    <span class="text-2xl font-black text-white group-hover:text-[#F37021] transition-colors">
                        +212 6 63 33 90 72
                    </span>
                </a>

                <a href="tel:+212669559315"
                    class="group bg-white/5 backdrop-blur-md border border-white/10 rounded-[2.5rem] p-10 hover:bg-white/10 hover:border-white/20 transition-all text-left decoration-transparent">
                    <div
                        class="w-16 h-16 bg-[#F37021]/20 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#F37021] transition-all">
                        <i data-lucide="phone"
                            class="w-7 h-7 text-[#F37021] group-hover:text-white transition-colors"></i>
                    </div>
                    <span class="block text-[10px] font-black text-white/60 uppercase tracking-widest mb-3">TÉLÉPHONE
                        2</span>
                    <span class="text-2xl font-black text-white group-hover:text-[#F37021] transition-colors">
                        +212 6 69 55 93 15
                    </span>
                </a>
            </div>

            <div class="mt-12 text-center">
                <div
                    class="inline-flex items-center gap-3 bg-white/5 backdrop-blur-md border border-white/10 rounded-2xl px-8 py-5">
                    <i data-lucide="map-pin" class="w-6 h-6 text-[#F37021]"></i>
                    <div class="text-left">
                        <span class="block text-[10px] font-black text-white/60 uppercase tracking-widest mb-1">NOTRE
                            PARKING</span>
                        <span class="text-lg font-black text-white">Californie, Casablanca</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Init Lucide Icons -->
    <script>
        lucide.createIcons();

        // Navbar Interaction Script
        document.addEventListener('DOMContentLoaded', () => {
            // Mobile Menu
            const mobileMenuBtn = document.getElementById('mobile-menu-btn');
            const mobileMenuOverlay = document.getElementById('mobile-menu-overlay');
            const mobileDrawer = document.getElementById('mobile-drawer');
            const mobileMenuClose = document.getElementById('mobile-menu-close');

            const toggleMobileMenu = (show) => {
                if (show) {
                    mobileMenuOverlay.classList.remove('invisible', 'opacity-0');
                    mobileDrawer.classList.remove('translate-x-full');
                    document.body.style.overflow = 'hidden';
                } else {
                    mobileMenuOverlay.classList.add('invisible', 'opacity-0');
                    mobileDrawer.classList.add('translate-x-full');
                    document.body.style.overflow = '';
                }
            };

            mobileMenuBtn.addEventListener('click', () => toggleMobileMenu(true));
            mobileMenuClose.addEventListener('click', () => toggleMobileMenu(false));
            mobileMenuOverlay.addEventListener('click', (e) => {
                if (e.target === mobileMenuOverlay) toggleMobileMenu(false);
            });

            // Vendre Dropdown (Desktop)
            const vendreBtn = document.getElementById('vendre-btn');
            const vendreDropdownContainer = document.getElementById('vendre-dropdown-container');
            const vendreDropdown = document.getElementById('vendre-dropdown');
            const vendreChevron = document.getElementById('vendre-chevron');

            let isDropdownOpen = false;

            // Toggle on hover
            vendreDropdownContainer.addEventListener('mouseenter', () => {
                isDropdownOpen = true;
                vendreDropdown.classList.remove('hidden');
                vendreChevron.classList.add('rotate-90');
            });

            vendreDropdownContainer.addEventListener('mouseleave', () => {
                isDropdownOpen = false;
                vendreDropdown.classList.add('hidden');
                vendreChevron.classList.remove('rotate-90');
            });

        });
    </script>
</body>

</html>
