<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Auto Enchère')</title>
    <link rel="stylesheet" href="{{ asset('assets/back/assets/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/back/assets/vendors/bootstrap-icons/bootstrap-icons.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/back/assets/css/app.css') }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <style>
        :root { --bs-primary:#C8A24B; --bs-primary-rgb:200,162,75; }
        body, .btn, .form-control, input, table { font-family:'Jost',system-ui,sans-serif; }
        h1,h2,h3,h4,h5,h6,.card-title { font-family:'Cormorant Garamond',Georgia,serif !important; font-weight:600 !important; }
        .sidebar-wrapper { background-color:#0E0F12 !important; border-right:1px solid rgba(200,162,75,.14); }
        .sidebar-wrapper .menu .sidebar-link { color:rgba(247,245,241,.72) !important; border-radius:8px; }
        .sidebar-wrapper .menu .sidebar-link i { color:rgba(247,245,241,.72) !important; }
        .sidebar-wrapper .menu .sidebar-link:hover { background-color:rgba(200,162,75,.1) !important; color:#C8A24B !important; }
        .sidebar-wrapper .menu .sidebar-link:hover i { color:#C8A24B !important; }
        .sidebar-wrapper .menu .sidebar-item.active > .sidebar-link { background-color:rgba(200,162,75,.15) !important; box-shadow:inset 3px 0 0 #C8A24B; }
        .sidebar-wrapper .menu .sidebar-item.active > .sidebar-link span,
        .sidebar-wrapper .menu .sidebar-item.active > .sidebar-link i { color:#C8A24B !important; }
        .am-wordmark { font-family:'Jost',sans-serif; font-size:1.3rem; font-weight:800; letter-spacing:.06em; text-transform:uppercase; text-decoration:none; }
        .am-wordmark .bw-dark { color:#F7F5F1; } .am-wordmark .bw-gold { color:#C8A24B; margin-left:.1em; }
        .btn-primary { --bs-btn-bg:#C8A24B; --bs-btn-border-color:#C8A24B; --bs-btn-color:#0E0F12; --bs-btn-hover-bg:#E3C178; --bs-btn-hover-border-color:#E3C178; --bs-btn-hover-color:#0E0F12; font-weight:600; }
        .text-primary { color:#A17E31 !important; } .bg-primary { background-color:#C8A24B !important; }
    </style>
</head>
<body>
<div id="app">
    <!-- 🔹 Sidebar -->
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header text-center mt-3">
                <a href="{{ route('dashboard') }}" class="am-wordmark">
                    <span class="bw-dark">AUTO</span><span class="bw-gold">ENCHÈRE</span>
                </a>
            </div>

            <div class="sidebar-menu mt-4">
                <ul class="menu">
                    <li @class(['sidebar-item','active' => request()->routeIs('admin.nadoautoenchere.index')])>
                        <a href="{{ route('admin.nadoautoenchere.index') }}" class='sidebar-link'>
                            <i class="bi bi-coin"></i>
                            <span>Auto Enchère</span>
                        </a>
                    </li>

                    <li @class(['sidebar-item','active' => request()->routeIs('admin.nadoautoencherebid.index')])>
                        <a href="{{ route('admin.nadoautoencherebid.index') }}" class='sidebar-link'>
                            <i class="bi bi-tags"></i>
                            <span>Offres Auto Enchère</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="sidebar-footer text-center mb-3">
                <a href="{{ route('dashboard') }}" class="btn btn-outline-secondary btn-sm">
                    <i class="bi bi-arrow-left"></i> Retour Admin
                </a>
            </div>
        </div>
    </div>

    <!-- 🔹 Main content -->
    <div id="main" class="layout-navbar">
        <header class="mb-3">
            <nav class="navbar navbar-expand navbar-light bg-white shadow-sm">
                <div class="container-fluid">
                    <a href="#" class="burger-btn d-block">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                    <div class="ms-auto d-flex align-items-center">
                        <div class="dropdown">
                            <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="user-menu d-flex align-items-center">
                                    <div class="user-name text-end me-3">
                                        <h6 class="mb-0 text-gray-600"></h6>
                                        <p class="mb-0 text-sm text-gray-600"></p>
                                    </div>
                                    <div class="avatar avatar-md">
                                        <img src="{{ asset('assets/back/assets/images/logo/user.png') }}" alt="user">
                                    </div>
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <form method="POST" action="{{ route('logout') }}">
                                        @csrf
                                        <a class="dropdown-item" href="#" onclick="event.preventDefault(); this.closest('form').submit();">
                                            <i class="bi bi-box-arrow-left me-2"></i> Logout
                                        </a>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <div class="page-content">
            @yield('content')
        </div>
    </div>
</div>

<script src="{{ asset('assets/back/assets/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/back/assets/js/app.js') }}"></script>
</body>
</html>
