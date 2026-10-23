@if($errors->any())
    <div class="p-4 bg-red-100 border border-red-400 text-red-700 mb-4">
        <h4 class="font-bold">Errors:</h4>
        <ul>
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détail Enchère | Nado.ma</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

   <style>
    /* Prevent horizontal scroll on mobile */
    body {
        overflow-x: hidden;
          padding-top: 50px; /* adjust based on navbar height */

    }

    /* Ensure containers don’t exceed screen width */
    .container, .max-w-7xl {
        max-width: 100% !important;
    }

    /* Fix banner left pushing layout */
    .col-lg-2.d-none.d-lg-flex {
        max-width: 100%;
        overflow: hidden;
    }
    @media (max-width: 800px) {
   .col-lg-2 .d-none .d-lg-block  {
        display: none;
    }
}

    /* Responsive images */
    img {
        max-width: 100%;
        height: auto;
    }
</style>
    <style>
        .navbar-nav li {
            list-style: none !important;
        }
        .sub-menu {
            background: white;
            border: 1px solid #ddd;
            position: absolute;
            min-width: 180px;
            display: none;
            z-index: 1000;
        }
        .dropdown:hover .sub-menu {
            display: block !important;
        }
        .sub-menu li a {
            display: block;
            padding: 10px 15px;
            color: #1f519b !important;
            text-decoration: none;
        }
    </style>

    <!-- Dropdown toggle script -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const dropdownToggle = document.querySelector('.nav-item.dropdown .dropdown-toggle');
            const submenu = document.querySelector('.nav-item.dropdown .sub-menu');

            dropdownToggle?.addEventListener('click', function (e) {
                e.preventDefault();
                submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
            });

            document.addEventListener('click', function (e) {
                if (!dropdownToggle.contains(e.target) && !submenu.contains(e.target)) {
                    submenu.style.display = 'none';
                }
            });
        });
    </script>

    <!-- Navbar Styles -->
    <style>
        .navbar-nav > li.dropdown:hover > .sub-menu { display: block !important; }
        .navbar-nav .dropdown-toggle { display: inline-block !important; }
        .navbar-nav .nav-item { list-style: none !important; }
        .navbar-nav, .navbar-nav ul, .navbar-nav li, .navbar-nav .sub-menu {
            list-style-type: none !important;
            padding-left: 0 !important;
            margin-left: 0 !important;
        }
        .navbar-nav li::marker, .navbar-nav li::before {
            content: none !important;
            display: none !important;
        }
        .navbar-nav > li {
            display: inline-block !important;
            margin-right: 20px !important;
        }
        .sub-menu {
            background: white;
            border: 1px solid #ddd;
            position: absolute;
            min-width: 180px;
            display: none;
            z-index: 1000;
        }
        .dropdown:hover .sub-menu { display: block !important; }
        .sub-menu li a {
            display: block;
            padding: 10px 15px;
            color: #1f519b !important;
            text-decoration: none;
        }
        .sub-menu form button {
            width: 100%;
            background: none;
            border: none;
            padding: 10px 15px;
            text-align: left;
            color: #1f519b !important;
            font-size: 14px;
            cursor: pointer;
        }
        .dropdown-toggle i.fa { margin-left: 5px; }
    </style>
</head>

<body class="bg-white text-gray-800">

<!-- HEADER -->
<header class="bg-white shadow-md fixed top-0 left-0 w-full z-50">
  <div class="container mx-auto flex items-center justify-between px-4 py-3">
    <a href="{{ route('index') }}" class="flex items-center space-x-2">
      <img src="{{ asset('assets/images/logoenchere.jpg') }}" alt="Logo" class="h-20">
    </a>
    <button id="navToggle" class="md:hidden text-blue-800 text-2xl">
      <i class="fas fa-bars"></i>
    </button>
    <nav id="navMenu" class="hidden md:flex space-x-6 font-semibold">
      <a href="{{ route('achat.index') }}" class="hover:text-yellow-500 text-blue-800">Achat</a>
      <a href="{{ route('vente.index') }}" class="hover:text-yellow-500 text-blue-800">Vente</a>
      <a href="{{ route('reprise.index') }}" class="hover:text-yellow-500 text-blue-800">Reprise</a>
      <a href="{{ route('nadoautoenchere.categories') }}" class="bg-yellow-400 px-4 py-2 rounded-full font-bold flex items-center">Auto Enchere</a>

      <a href="{{ route('financement.index') }}" class="hover:text-yellow-500 text-blue-800">Auto finance</a>
      <a href="{{ route('services.index') }}" class="hover:text-yellow-500 text-blue-800">À propos</a>
      <a href="{{ route('contactez-nous.index') }}" class="hover:text-yellow-500 text-blue-800">Contact</a>
       @if(Auth::guard('client')->check())
        <div class="relative group">
          <button class="bg-yellow-400 px-4 py-2 rounded-full font-bold flex items-center">
            <i class="fa fa-user mr-2"></i> {{ Auth::guard('client')->user()->name }}
            <i class="fa fa-chevron-down ml-2"></i>
          </button>
          <ul class="absolute hidden group-hover:block bg-white shadow rounded mt-2 w-48">
            <li><a href="{{ route('client.dashboard') }}" class="block px-4 py-2 hover:bg-gray-100">Mon espace</a></li>
            <li>
              <form method="POST" action="{{ route('logout') }}">@csrf
                <button type="submit" class="w-full text-left px-4 py-2 hover:bg-gray-100 text-red-600">Déconnexion</button>
              </form>
            </li>
          </ul>
        </div>
      @else
        <a href="{{ route('client.login') }}" class="bg-yellow-400 px-4 py-2 rounded-full font-bold">Espace Client</a>
      @endif
    </nav>
  </div>
  
    <style>
        .navbar-nav li {
            list-style: none !important;
        }
        .sub-menu {
            background: white;
            border: 1px solid #ddd;
            position: absolute;
            min-width: 180px;
            display: none;
            z-index: 1000;
        }
        .dropdown:hover .sub-menu {
            display: block !important;
        }
        .sub-menu li a {
            display: block;
            padding: 10px 15px;
            color: #1f519b !important;
            text-decoration: none;
        }
        .h-20 {
    height: 3rem !important;
}
    </style>

    <!-- Dropdown toggle script -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const dropdownToggle = document.querySelector('.nav-item.dropdown .dropdown-toggle');
            const submenu = document.querySelector('.nav-item.dropdown .sub-menu');

            dropdownToggle?.addEventListener('click', function (e) {
                e.preventDefault();
                submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
            });

            document.addEventListener('click', function (e) {
                if (!dropdownToggle.contains(e.target) && !submenu.contains(e.target)) {
                    submenu.style.display = 'none';
                }
            });
        });
    </script>

    <!-- Navbar Styles -->
    <style>
        .navbar-nav > li.dropdown:hover > .sub-menu { display: block !important; }
        .navbar-nav .dropdown-toggle { display: inline-block !important; }
        .navbar-nav .nav-item { list-style: none !important; }
        .navbar-nav, .navbar-nav ul, .navbar-nav li, .navbar-nav .sub-menu {
            list-style-type: none !important;
            padding-left: 0 !important;
            margin-left: 0 !important;
        }
        .navbar-nav li::marker, .navbar-nav li::before {
            content: none !important;
            display: none !important;
        }
        .navbar-nav > li {
            display: inline-block !important;
            margin-right: 20px !important;
        }
        .sub-menu {
            background: white;
            border: 1px solid #ddd;
            position: absolute;
            min-width: 180px;
            display: none;
            z-index: 1000;
        }
        .dropdown:hover .sub-menu { display: block !important; }
        .sub-menu li a {
            display: block;
            padding: 10px 15px;
            color: #1f519b !important;
            text-decoration: none;
        }
        .sub-menu form button {
            width: 100%;
            background: none;
            border: none;
            padding: 10px 15px;
            text-align: left;
            color: #1f519b !important;
            font-size: 14px;
            cursor: pointer;
        }
        .dropdown-toggle i.fa { margin-left: 5px; }
    </style>
</header>

<!-- END HEADER -->

<!-- END HEADER -->
<script>
  document.getElementById('navToggle').addEventListener('click', function() {
    document.getElementById('navMenu').classList.toggle('hidden');
    document.getElementById('navMenu').classList.toggle('flex');
    document.getElementById('navMenu').classList.toggle('flex-col');
    document.getElementById('navMenu').classList.toggle('absolute');
    document.getElementById('navMenu').classList.toggle('top-16');
    document.getElementById('navMenu').classList.toggle('left-0');
    document.getElementById('navMenu').classList.toggle('bg-white');
    document.getElementById('navMenu').classList.toggle('w-full');
    document.getElementById('navMenu').classList.toggle('p-4');
  });
</script>
<style>
    /* Prevent horizontal scroll on mobile */
    body {
        overflow-x: hidden;
          padding-top: 50px; /* adjust based on navbar height */

    }

    /* Ensure containers don’t exceed screen width */
    .container, .max-w-7xl {
        max-width: 100% !important;
    }

    /* Fix banner left pushing layout */
    .col-lg-2.d-none.d-lg-flex {
        max-width: 100%;
        overflow: hidden;
    }
    @media (max-width: 800px) {
   .col-lg-2 .d-none .d-lg-block  {
        display: none;
    }
}

    /* Responsive images */
    img {
        max-width: 100%;
        height: auto;
    }
</style>

    <style>
        .navbar-nav li {
            list-style: none !important;
        }
        .sub-menu {
            background: white;
            border: 1px solid #ddd;
            position: absolute;
            min-width: 180px;
            display: none;
            z-index: 1000;
        }
        .dropdown:hover .sub-menu {
            display: block !important;
        }
        .sub-menu li a {
            display: block;
            padding: 10px 15px;
            color: #1f519b !important;
            text-decoration: none;
        }
    </style>

    <!-- Dropdown toggle script -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const dropdownToggle = document.querySelector('.nav-item.dropdown .dropdown-toggle');
            const submenu = document.querySelector('.nav-item.dropdown .sub-menu');

            dropdownToggle?.addEventListener('click', function (e) {
                e.preventDefault();
                submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
            });

            document.addEventListener('click', function (e) {
                if (!dropdownToggle.contains(e.target) && !submenu.contains(e.target)) {
                    submenu.style.display = 'none';
                }
            });
        });
    </script>

    <!-- Navbar Styles -->
    <style>
        .navbar-nav > li.dropdown:hover > .sub-menu { display: block !important; }
        .navbar-nav .dropdown-toggle { display: inline-block !important; }
        .navbar-nav .nav-item { list-style: none !important; }
        .navbar-nav, .navbar-nav ul, .navbar-nav li, .navbar-nav .sub-menu {
            list-style-type: none !important;
            padding-left: 0 !important;
            margin-left: 0 !important;
        }
        .navbar-nav li::marker, .navbar-nav li::before {
            content: none !important;
            display: none !important;
        }
        .navbar-nav > li {
            display: inline-block !important;
            margin-right: 20px !important;
        }
        .sub-menu {
            background: white;
            border: 1px solid #ddd;
            position: absolute;
            min-width: 180px;
            display: none;
            z-index: 1000;
        }
        .dropdown:hover .sub-menu { display: block !important; }
        .sub-menu li a {
            display: block;
            padding: 10px 15px;
            color: #1f519b !important;
            text-decoration: none;
        }
        .sub-menu form button {
            width: 100%;
            background: none;
            border: none;
            padding: 10px 15px;
            text-align: left;
            color: #1f519b !important;
            font-size: 14px;
            cursor: pointer;
        }
        .dropdown-toggle i.fa { margin-left: 5px; }
    </style>
<div class="py-8">
    <div class="max-w-7xl mx-auto px-4">
        <!-- Car Title -->
        <div class="flex flex-col md:flex-row md:justify-between md:items-start border-b pb-4 mb-6 space-y-4 md:space-y-0">
            <div>
                <h1 class="text-3xl font-bold text-blue-900">{{ $enchere->brand?->name ?? 'N/A' }} {{ $enchere->modeleRelation?->name ?? 'N/A' }}</h1>
                <p class="text-sm text-gray-500">Réf : NA{{ $enchere->id }}</p>
            </div>

            @if($enchere->phone)
            <div class="flex items-center space-x-3 bg-blue-50 border border-blue-200 rounded-xl px-4 py-3 shadow-sm mt-4 w-fit">
                <div class="flex items-center justify-center bg-blue-600 text-white w-10 h-10 rounded-full shadow">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <div>
                    <p class="text-sm text-gray-500 font-medium">Compte à rebours</p>
                  <span class="badge bg-danger position-absolute bottom-0 end-0 m-2 countdown"
      data-end="{{ $enchere->ends_at }}">
    <!-- JS will update this -->
</span>
                </div>
            </div>
            @endif

            <div class="flex space-x-4 text-yellow-500 text-xl">
                <form action="{{ route('favorite.toggle', ['id' => $enchere->id]) }}" method="POST">
                    @csrf
                    <button type="submit">
                        @if(Auth::guard('client')->check() && Auth::guard('client')->user()->favorites->contains($enchere->id))
                            <i class="fas fa-heart text-yellow-500"></i>
                        @else
                            <i class="far fa-heart text-yellow-500"></i>
                        @endif
                    </button>
                </form>

                <button onclick="openSharePopup('{{ urlencode(request()->fullUrl()) }}')">
                    <i class="fas fa-share-alt cursor-pointer"></i>
                </button>

                <button onclick="window.print()">
                    <i class="fas fa-print cursor-pointer"></i>
                </button>
            </div>
        </div>

    <!-- Proposer votre enchère -->
<div class="bg-yellow-50  rounded shadow mb-6 ">
    
   <!-- Prix Target -->
<div class="rounded-xl text-center max-w-md w-full mx-auto">
    <h2 class="text-xl font-semibold text-blue-800 mb-2">Meilleure Offre</h2>
    <p class="text-3xl font-bold text-yellow-600">
        {{ number_format($prixTarget, 0, ',', ' ') }} DH
    </p>
</div>

    <!-- Enchère automatique -->
    <div class="bg-blue-50 p-4 rounded-xl shadow text-center max-w-md w-full mx-auto ">
        <h2 class="text-xl font-semibold text-blue-800 mb-3">Faites votre offre</h2>

        <form action="{{ route('nadoautoenchere.proposerPrix', $enchere->id) }}" method="POST">
            @csrf
            <div class="flex flex-col md:flex-row gap-2 justify-center">
                <!-- Max bid -->
              <input type="number" name="p" 
       class="border px-4 py-2 rounded w-full md:w-60"
       placeholder="Votre enchère max (DH)" 
       required
       step="1000" 
      >

                <button type="submit" 
                        class="bg-blue-700 text-white px-4 py-2 rounded hover:bg-blue-800">
                    Valider
                </button>
            </div>
            <p class="text-sm text-gray-600 mt-2">
    ⚡ L'enchère montera automatiquement par incréments de <span class="font-semibold text-blue-700">1000 DH</span> jusqu’à votre maximum.
            </p>
        </form>
    </div>
<!-- Prix Estimé -->
<div class="rounded-xl text-center max-w-md w-full mx-auto opacity-60 relative">
    <h2 class="text-xl font-semibold text-blue-800 mb-2 line-through">Prix Estimé</h2>
    <p class="text-3xl font-bold text-yellow-600 line-through">
        {{ number_format($enchere->prix, 0, ',', ' ') }} DH
    </p>

    
</div>

</div>

        <!-- Layout: pub + slider + content -->
        <div class="flex flex-col md:flex-row gap-8">
            <!-- Pub Banner LEFT -->
            <div class="col-lg-2 d-none d-lg-flex left-banner">
                @if($leftondetailBanner)
                    <img src="{{ asset('storage/' . $leftondetailBanner->image) }}" alt="Pub Gauche" style="width: 200px; height: 500px; object-fit: cover;">
                @endif
            </div>

            <style>
                @media (max-width: 991px) {
                    .left-banner { display: none !important; }
                }
            </style>

            <!-- Image Slider -->
            <div class="md:w-7/12 relative">
                <div class="relative zoom-container">
                    <div id="mainDisplay" class="w-full h-auto max-h-[600px] rounded shadow overflow-hidden">
                        <img id="mainImage" src="{{ asset('storage/enchere/' . $enchere->image) }}" data-full="{{ asset('storage/enchere/' . $enchere->image) }}" alt="Enchère Image" class="w-full h-auto object-contain image-hover-zoom">
                    </div>
                    <button id="prevBtn" class="absolute left-2 top-1/2 transform -translate-y-1/2 bg-white px-2 py-1 rounded-full shadow hover:bg-yellow-400"><i class="fas fa-chevron-left"></i></button>
                    <button id="nextBtn" class="absolute right-2 top-1/2 transform -translate-y-1/2 bg-white px-2 py-1 rounded-full shadow hover:bg-yellow-400"><i class="fas fa-chevron-right"></i></button>
                </div>

                <!-- Thumbnails -->
               <!-- Thumbnails -->
<div class="flex flex-wrap gap-2 mt-4" id="thumbnailContainer">
    @if(!empty($enchere->images))
        @foreach($enchere->images as $index => $image)
            <img src="{{ asset('storage/nadoautoenchere/' . $image) }}"
                 data-index="{{ $index }}"
                 data-type="image"
                 class="thumb w-20 h-16 object-cover border rounded cursor-pointer">
        @endforeach
    @endif

    @if($enchere->reel)
        <img src="{{ asset('assets/images/play-thumbnail.png') }}"
             data-index="{{ count($enchere->images ?? []) }}"
             data-type="video"
             class="thumb w-20 h-16 object-cover border rounded cursor-pointer">
    @endif
</div>

            </div>

            <!-- Tabs Section -->
            <div class="md:w-5/12 text-sm">
                <ul class="flex space-x-4 text-blue-800 font-medium border-b pb-2 mb-4 overflow-x-auto whitespace-nowrap">
                    <li class="tab-link text-yellow-500 border-b-2 border-yellow-500 cursor-pointer" data-tab="details">Détails</li>
                    <li class="tab-link cursor-pointer" data-tab="equipements">Équipements</li>
                    <li class="tab-link cursor-pointer" data-tab="rapport">Rapport</li>

                </ul>

                <div class="tab-content active" id="details">
                    <h2 class="text-lg font-semibold text-blue-800 pb-1 mb-2">Détails</h2>
                    <div class="grid grid-cols-2 gap-y-2">
                        <!-- <div><strong>Prix:</strong></div><div>{{ number_format($enchere->prix, 0, ',', ' ') }} DH</div> -->
                        <div><strong>Marque & Modèle:</strong></div><div>{{ $enchere->brand?->name ?? 'N/A' }} {{ $enchere->modeleRelation?->name ?? 'N/A' }}</div>
                        <div><strong>Kilometrage:</strong></div><div>{{ $enchere->km }}</div>
                        <div><strong>Carburant:</strong></div><div>{{ $enchere->carburant }}</div>
                        <div><strong>Date 1ère mise en circulation:</strong></div><div>{{ $enchere->year }}</div>
                        <div><strong>Type d'origine:</strong></div><div>{{ $enchere->origine }}</div>
                        <div><strong>Couleur:</strong></div><div>{{ $enchere->colors }}</div>
                        <div><strong>Portes:</strong></div><div>{{ $enchere->nb_Door }}</div>
                        <div><strong>CV:</strong></div><div>{{ $enchere->cv }}</div>
                        <!-- <div><strong>Émission de CO2:</strong></div><div>{{ $enchere->co2 }} g/km</div>
                        <div><strong>Consommation:</strong></div><div>{!! nl2br(e($enchere->consommation)) !!}</div> -->
                    </div>
                </div>

                <div class="tab-content" id="equipements">
                    <h3 class="text-lg font-semibold text-blue-800 mb-4">Équipements</h3>
                    @if(count($equipements))
                        <div class="grid grid-cols-2 md:grid-cols-2 gap-4">
                            @foreach($equipements as $label)
                                <div class="flex items-center space-x-2">
                                    <i class="fas fa-check text-green-600"></i>
                                    <span>{{ $label }}</span>
                                </div>
                            @endforeach
                        </div>
                    @else
                        <p>Aucun équipement listé.</p>
                    @endif
                </div><div class="tab-content" id="rapport">
    <h3 class="text-lg font-semibold text-blue-800 mb-4">Rapport d’expertise</h3>

    @if ($pdfExists)
        <!-- Embedded PDF -->
        <div class="border rounded overflow-hidden">
            <iframe 
                src="{{ route('nadoautoenchere.pdf', $pdfName) }}" 
                width="100%" 
                height="600" 
                style="border:none;">
            </iframe>
        </div>
        <p class="mt-2">
            <a href="{{ route('nadoautoenchere.pdf', $pdfName) }}" target="_blank" 
               class="text-blue-600 underline">
               Ouvrir le PDF dans un nouvel onglet
            </a>
        </p>
    @else
        <p>Aucun rapport disponible pour cette enchère.</p>
    @endif
</div>




              
            </div>
        </div>

        <!-- Financing / Simulator -->
    </div>
</div>

    <script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const countdowns = document.querySelectorAll(".countdown");

    countdowns.forEach(function (el) {
        const endTime = new Date(el.dataset.end).getTime();

        function updateCountdown() {
            const now = new Date().getTime();
            const diff = endTime - now;

            if (diff <= 0) {
                el.innerHTML = "Expired";
                return;
            }

            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);

            el.innerHTML = `Termine dans: ${days}j ${hours}h ${minutes}m ${seconds}s`;
        }

        // Run immediately + every second
        updateCountdown();
        setInterval(updateCountdown, 1000);
    });
});
</script>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const allMedia = [];
    const imageData = @json($enchere->images);

    // Push main image first
    allMedia.push("{{ asset('storage/nadoautoenchere/' . $enchere->image) }}");

    // Push all other images
    imageData.forEach(m => {
        allMedia.push("{{ asset('storage/nadoautoenchere') }}/" + m.name);
    });

    let currentIndex = 0;

    function showImage(index) {
        currentIndex = index;
        Swal.fire({
            html: `
                <div class="relative">
                    <img src="${allMedia[currentIndex]}" style="max-height:80vh;max-width:100%;object-contain" />
                    <button id="prevImg" style="position:absolute;left:10px;top:50%;transform:translateY(-50%);background:white;padding:5px 10px;border-radius:50%;">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <button id="nextImg" style="position:absolute;right:10px;top:50%;transform:translateY(-50%);background:white;padding:5px 10px;border-radius:50%;">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </div>
            `,
            showConfirmButton: false,
            background: 'transparent',
            width: '90%',
            padding: 0,
            backdrop: `rgba(0,0,0,0.9)`,
            didRender: () => {
                document.getElementById('prevImg').addEventListener('click', () => {
                    let newIndex = (currentIndex - 1 + allMedia.length) % allMedia.length;
                    showImage(newIndex);
                });
                document.getElementById('nextImg').addEventListener('click', () => {
                    let newIndex = (currentIndex + 1) % allMedia.length;
                    showImage(newIndex);
                });
            }
        });
    }

    // Double-click main image
    document.getElementById('mainImage').addEventListener('dblclick', () => {
        showImage(0);
    });

    // Also allow double-click on thumbnails
    document.querySelectorAll('#thumbnailContainer img').forEach((thumb, i) => {
        thumb.addEventListener('dblclick', () => {
            showImage(i + 1); // +1 because main image is index 0
        });
    });
});
</script>

<!-- Add this script to switch between images and video -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const mainDisplay = document.getElementById('mainDisplay');
        const thumbnailContainer = document.getElementById('thumbnailContainer');
        const image = @json($enchere->image);
        const reel = @json($enchere->reel);

        thumbnailContainer.addEventListener('click', e => {
            const target = e.target;
            if (!target.classList.contains('thumb')) return;

            const type = target.getAttribute('data-type');
            const index = target.getAttribute('data-index');

            if(type === 'image'){
                // Show the image
                const imageUrl = "{{ asset('storage/nadoautoenchere') }}/" + image[index].name;
                mainDisplay.innerHTML = `
    <img src="${imageUrl}" 
         data-full="${imageUrl}" 
         alt="Annonce Image" 
         class="w-full h-auto object-contain rounded image-hover-zoom">
`;

const newMainImage = mainDisplay.querySelector('img');
newMainImage.addEventListener('dblclick', () => {
    Swal.fire({
        imageUrl: newMainImage.getAttribute('data-full'),
        imageAlt: 'Full Image',
        showConfirmButton: false,
        width: '90%',
        padding: 0,
        background: 'transparent',
        backdrop: `rgba(0,0,0,0.9)`
    });
});
            } else if(type === 'video' && reel) {
                // Show the video embed (YouTube iframe)
                mainDisplay.innerHTML = `
                    <iframe 
                        width="100%" 
                        height="400" 
                        src="https://www.youtube.com/embed/${reel}" 
                        frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                        allowfullscreen
                        class="rounded"
                    ></iframe>
                `;
            }
        });
    });
</script>
<script>
    function openSharePopup(url) {
        Swal.fire({
            title: 'Partager cette annonce',
            html: `
                <div class="flex justify-around text-blue-800 text-2xl">
                    <a href="https://api.whatsapp.com/send?text=${url}" target="_blank" title="Partager sur WhatsApp">
                        <i class="fab fa-whatsapp"></i>
                    </a>
                    <a href="https://www.facebook.com/sharer/sharer.php?u=${url}" target="_blank" title="Partager sur Facebook">
                        <i class="fab fa-facebook"></i>
                    </a>
                    <a href="https://www.messenger.com/t/?link=${url}" target="_blank" title="Partager sur Messenger">
                        <i class="fab fa-facebook-messenger"></i>
                    </a>
                    <a href="mailto:?subject=Annonce Nado.ma&body=Voici une annonce intéressante : ${url}" title="Partager par Email">
                        <i class="fas fa-envelope"></i>
                    </a>
                </div>
            `,
            showCloseButton: true,
            showConfirmButton: false,
            width: 400,
            padding: '1.5em',
        });
    }
</script>

 <style>
        .tab-content { display: none; }
        .tab-content.active { display: block; }
    </style>
  
    <style>
        .image-hover-zoom {
    transition: transform 0.3s ease;
    cursor: zoom-in;
    width: 100%;
}

.image-hover-zoom:hover {
    transform: scale(1.5);
}

    </style>
@if(session('success'))
    <script>
        Swal.fire({
            icon: 'success',
            title: '{{ session('success') }}',
            showConfirmButton: false,
            timer: 2000
        });
    </script>
@endif
<script>
  const tauxInteretDefault = {{ $tauxInteretDefault ?? 13 }};

  function updateTauxAutomatique() {
    const select = document.getElementById('clientType');
    const selectedOption = select.options[select.selectedIndex];
    const taux = selectedOption && selectedOption.dataset.taux
      ? parseFloat(selectedOption.dataset.taux)
      : tauxInteretDefault;

    // Update hidden input and displayed taux
    document.getElementById('taux').value = taux;
    document.getElementById('tauxInteret').textContent = taux.toFixed(2);

    updateCalculateur();
  }

  function updateCalculateur() {
    const prixTotal = parseFloat(document.getElementById('prixTotal').value) || 0;
    const apport = parseFloat(document.getElementById('apport').value) || 0;
    const duree = parseInt(document.getElementById('duree').value) || 1;
    const taux = parseFloat(document.getElementById('taux').value) || 0;

    const fraisDossier = 4375;
    const assuranceAnnuelle = 235;
    const nbAnnees = duree / 12;
    const assuranceTotale = assuranceAnnuelle * nbAnnees;

    const montantFinance = prixTotal - apport + fraisDossier + assuranceTotale;

    let paiementMensuel = 0;
    if (taux > 0) {
      const tauxMensuel = taux / 100 / 12;
      paiementMensuel = (montantFinance * tauxMensuel) / (1 - Math.pow(1 + tauxMensuel, -duree));
    } else {
      paiementMensuel = montantFinance / duree;
    }

    document.getElementById('montantTotal').textContent = prixTotal.toLocaleString('fr-FR', { minimumFractionDigits: 2 });
    document.getElementById('montantApport').textContent = apport.toLocaleString('fr-FR', { minimumFractionDigits: 2 });
    document.getElementById('dureeMois').textContent = duree;
    document.getElementById('paiementMensuel').textContent = paiementMensuel.toLocaleString('fr-FR', { minimumFractionDigits: 2 });
  }

  document.getElementById('clientType').addEventListener('change', updateTauxAutomatique);
  document.getElementById('apport').addEventListener('input', updateCalculateur);
  document.getElementById('duree').addEventListener('change', updateCalculateur);

  // If you want to allow manual taux input (currently hidden), add listener here:
  // document.getElementById('taux').addEventListener('input', updateCalculateur);

  window.addEventListener('DOMContentLoaded', () => {
    updateTauxAutomatique();
    updateCalculateur();
  });
</script>




<script>
document.addEventListener('DOMContentLoaded', () => {
    // Build unified media list (images + optional reel) - keep your Blade loops
    const imageList = [
        @foreach($enchere->images as $image)
        {
            type: 'image',
            src: "{{ asset('storage/nadoautoenchere/' . $image) }}",
            thumb: "{{ asset('storage/nadoautoenchere/' . $image) }}"
        },
        @endforeach
        @if($enchere->reel)
        {
            type: 'video',
            videoId: "{{ $enchere->reel }}",
            thumb: "{{ asset('assets/images/play-thumbnail.png') }}"
        }
        @endif
    ];

    const mainDisplay = document.getElementById('mainDisplay');
    const thumbnailContainer = document.getElementById('thumbnailContainer');
    let currentIndex = 0;

    // Render thumbnails
    function renderThumbnails() {
        thumbnailContainer.innerHTML = '';
        imageList.forEach((item, idx) => {
            if (item.type === 'video') {
                const wrapper = document.createElement('div');
                wrapper.className = 'relative inline-block';
                wrapper.style.display = 'inline-block';
                wrapper.dataset.index = idx;
                wrapper.dataset.type = 'video';

                const img = document.createElement('img');
                img.src = item.thumb;
                img.className = 'thumb w-20 h-16 object-cover border rounded cursor-pointer';
                img.style.objectFit = 'cover';
                wrapper.appendChild(img);

                const overlay = document.createElement('div');
                overlay.style.position = 'absolute';
                overlay.style.top = '50%';
                overlay.style.left = '50%';
                overlay.style.transform = 'translate(-50%, -50%)';
                overlay.innerHTML = '<i class="fas fa-play-circle text-white" style="font-size:1.4rem; filter: drop-shadow(0 0 4px rgba(0,0,0,0.6));"></i>';
                wrapper.appendChild(overlay);

                thumbnailContainer.appendChild(wrapper);
            } else {
                const img = document.createElement('img');
                img.src = item.thumb;
                img.dataset.index = idx;
                img.dataset.type = 'image';
                img.className = 'thumb w-20 h-16 object-cover border rounded cursor-pointer';
                img.style.objectFit = 'cover';
                thumbnailContainer.appendChild(img);
            }
        });
    }

    // Highlight current thumbnail
    function highlightActiveThumbnail() {
        thumbnailContainer.querySelectorAll('[data-index]').forEach(el => {
            el.style.outline = 'none';
        });
        const currentThumb = thumbnailContainer.querySelector('[data-index="' + currentIndex + '"]');
        if (currentThumb) currentThumb.style.outline = '2px solid #1f519b';
    }

    // Lightbox opener (SweetAlert2)
    function openLightbox(url, alt = 'Image') {
        Swal.fire({
            imageUrl: url,
            imageAlt: alt,
            showConfirmButton: false,
            width: '90%',
            padding: 0,
            background: 'transparent',
            backdrop: 'rgba(0,0,0,0.9)'
        });
    }

    // Render main (image or video). ALWAYS attach lightbox handler for images.
    function renderMain(index) {
        const item = imageList[index];
        currentIndex = index;

        if (item.type === 'image') {
            mainDisplay.innerHTML = `
                <img
                    src="${item.src}"
                    data-full="${item.src}"
                    alt="Annonce Image"
                    class="w-full h-auto object-contain rounded image-hover-zoom"
                    style="cursor: zoom-in;"
                />
            `;

            const newMainImage = mainDisplay.querySelector('img');

            // Desktop: dblclick to open. Touch devices: single tap to open.
            if ('ontouchstart' in window) {
                newMainImage.addEventListener('click', () => openLightbox(item.src));
            } else {
                newMainImage.addEventListener('dblclick', () => openLightbox(item.src));
            }
        } else if (item.type === 'video') {
            mainDisplay.innerHTML = `
                <iframe
                    width="100%"
                    height="400"
                    src="https://www.youtube.com/embed/${item.videoId}?rel=0&modestbranding=1"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen
                    class="rounded w-full"
                ></iframe>
            `;
        }
        highlightActiveThumbnail();
    }

    // Thumbnail clicks (event delegation)
    thumbnailContainer.addEventListener('click', e => {
        let target = e.target;
        if (!target.dataset.index && target.closest('[data-index]')) {
            target = target.closest('[data-index]');
        }
        const idx = parseInt(target.dataset.index);
        if (!isNaN(idx)) renderMain(idx);
    });

    // Prev/Next buttons (guard in case imageList length <= 1)
    const nextBtn = document.getElementById('nextBtn');
    const prevBtn = document.getElementById('prevBtn');
    if (nextBtn) nextBtn.addEventListener('click', () => {
        if (!imageList.length) return;
        renderMain((currentIndex + 1) % imageList.length);
    });
    if (prevBtn) prevBtn.addEventListener('click', () => {
        if (!imageList.length) return;
        renderMain((currentIndex - 1 + imageList.length) % imageList.length);
    });

    // Init
    renderThumbnails();
    if (imageList.length > 0) {
        renderMain(0);
    }
});
</script>



<!-- End financement section -->

<!-- Scripts -->
<script>
   document.querySelectorAll('.tab-link').forEach(link => {
    link.addEventListener('click', () => {
        document.querySelectorAll('.tab-link').forEach(l => l.classList.remove('text-yellow-500', 'border-yellow-500', 'border-b-2'));
        link.classList.add('text-yellow-500', 'border-b-2', 'border-yellow-500');

        const tab = link.getAttribute('data-tab');

        document.querySelectorAll('.tab-content').forEach(c => {
            c.classList.remove('active');
            c.classList.add('hidden'); // important pour tailwind
        });

        const selectedTab = document.getElementById(tab);
        selectedTab.classList.remove('hidden');
        selectedTab.classList.add('active');
    });
});
</script>
</body>
</html>
