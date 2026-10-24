<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title')</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="stylesheet" href="{{ asset('assets/back/assets/extensions/choices.js/public/assets/styles/choices.css') }}">

    <link rel="stylesheet" href="{{ asset('assets/back/assets/css/main/app.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/back/assets/css/main/app-dark.css') }}">
    <link rel="shortcut icon" href="{{ asset('assets/images/favicon.png') }}" type="image/png">

    {{-- Automanager · Obsidian & Gold admin theme override --}}
    <style>
        :root {
            --am-obsidian: #0E0F12;
            --am-obsidian-800: #17181C;
            --am-gold: #C8A24B;
            --am-gold-bright: #E3C178;
            --am-gold-deep: #A17E31;
            --am-ivory: #F7F5F1;
            --bs-primary: #C8A24B;
            --bs-primary-rgb: 200, 162, 75;
            --bs-link-color: #A17E31;
            --bs-link-hover-color: #C8A24B;
        }

        /* Typography */
        body, .form-control, .form-select, .btn, input, select, textarea, table, .card, .page-title {
            font-family: 'Jost', system-ui, -apple-system, sans-serif;
        }
        h1, h2, h3, h4, h5, .card-title, .page-title h3, .breadcrumb-header .fw-bold {
            font-family: 'Cormorant Garamond', Georgia, serif !important;
            font-weight: 600 !important;
            letter-spacing: 0;
        }

        /* Sidebar → obsidian */
        #sidebar .sidebar-wrapper,
        .sidebar-wrapper { background-color: var(--am-obsidian) !important; border-right: 1px solid rgba(200,162,75,.14); }
        .sidebar-wrapper .sidebar-header { background-color: var(--am-obsidian) !important; padding-top: 1.25rem; }
        .am-wordmark { font-family: 'Jost', sans-serif; font-size: 1.35rem; font-weight: 800; letter-spacing: .06em; text-transform: uppercase; white-space: nowrap; }
        .am-wordmark .bw-dark { color: var(--am-ivory); }
        .am-wordmark .bw-gold { color: var(--am-gold); margin-left: .1em; }
        .sidebar-wrapper .menu .sidebar-title { color: rgba(247,245,241,.45) !important; letter-spacing: .08em; text-transform: uppercase; font-size: .72rem; }
        .sidebar-wrapper .menu .sidebar-link { color: rgba(247,245,241,.72) !important; border-radius: 8px; transition: all .2s; }
        .sidebar-wrapper .menu .sidebar-link span { color: inherit !important; }
        .sidebar-wrapper .menu .sidebar-link i,
        .sidebar-wrapper .menu .sidebar-link svg { color: rgba(247,245,241,.72) !important; fill: rgba(247,245,241,.72) !important; }
        .sidebar-wrapper .menu .sidebar-link:hover { background-color: rgba(200,162,75,.1) !important; color: var(--am-gold) !important; }
        .sidebar-wrapper .menu .sidebar-link:hover i,
        .sidebar-wrapper .menu .sidebar-link:hover svg { color: var(--am-gold) !important; fill: var(--am-gold) !important; }
        .sidebar-wrapper .menu .sidebar-item.active > .sidebar-link { background-color: rgba(200,162,75,.15) !important; box-shadow: inset 3px 0 0 var(--am-gold); }
        .sidebar-wrapper .menu .sidebar-item.active > .sidebar-link span { color: var(--am-gold) !important; }
        .sidebar-wrapper .menu .sidebar-item.active > .sidebar-link i,
        .sidebar-wrapper .menu .sidebar-item.active > .sidebar-link svg { color: var(--am-gold) !important; fill: var(--am-gold) !important; }
        .sidebar-wrapper .sidebar-toggler a,
        .sidebar-wrapper .sidebar-header .bi { color: var(--am-ivory) !important; }

        /* Buttons & accents */
        .btn-primary {
            --bs-btn-bg: var(--am-gold); --bs-btn-border-color: var(--am-gold); --bs-btn-color: var(--am-obsidian);
            --bs-btn-hover-bg: var(--am-gold-bright); --bs-btn-hover-border-color: var(--am-gold-bright); --bs-btn-hover-color: var(--am-obsidian);
            --bs-btn-active-bg: var(--am-gold-deep); --bs-btn-active-border-color: var(--am-gold-deep); --bs-btn-active-color: #fff;
            font-weight: 600; letter-spacing: .02em;
        }
        .btn-outline-primary {
            --bs-btn-color: var(--am-gold-deep); --bs-btn-border-color: var(--am-gold);
            --bs-btn-hover-bg: var(--am-gold); --bs-btn-hover-border-color: var(--am-gold); --bs-btn-hover-color: var(--am-obsidian);
        }
        .text-primary { color: var(--am-gold-deep) !important; }
        .bg-primary { background-color: var(--am-gold) !important; }
        .badge.bg-primary { color: var(--am-obsidian) !important; }
        .link-primary { color: var(--am-gold-deep) !important; }
        .link-primary:hover, .link-primary:focus { color: var(--am-gold) !important; }
        a { color: var(--am-gold-deep); }
        .page-link { color: var(--am-gold-deep); }
        .page-item.active .page-link { background-color: var(--am-gold); border-color: var(--am-gold); color: var(--am-obsidian); }
        .form-check-input:checked { background-color: var(--am-gold); border-color: var(--am-gold); }
        .form-control:focus, .form-select:focus { border-color: var(--am-gold); box-shadow: 0 0 0 .2rem rgba(200,162,75,.2); }
        .nav-pills .nav-link.active { background-color: var(--am-gold) !important; color: var(--am-obsidian) !important; }

        /* Topbar refinement */
        #main .header-top, .navbar { background: #fff; }
        .page-heading h3 { color: var(--am-obsidian); }
    </style>

    <link rel="stylesheet" href="{{ asset('assets/back/assets/css/shared/iconly.css') }}">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
	<style type="text/css" class="init">

    tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }

    </style>
    <!-- Owl Carousel CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />

<!-- jQuery (nécessaire pour Owl Carousel) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Owl Carousel JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>


    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    @yield('link')
    <!-- Scripts -->
    <!-- @ vite(['resources/css/app.css', 'resources/js/app.js'])-->

</head>
