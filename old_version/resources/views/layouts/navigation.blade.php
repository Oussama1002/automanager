<!-- header -->
@php
    $client = Auth::guard('client')->user();
    // Vérifier si on est sur une route Auto Enchère
    $isAutoEnchere = request()->routeIs('nadoautoenchere.*');
@endphp

<header class="site-header header" style="height: 80px;">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- main header -->
    <div class="sticky-header main-bar-wraper">
        <div class="main-bar clearfix ">
            <div class="container clearfix">
                <!-- website logo -->
                <div class="logo-header mostion">
                    @if($isAutoEnchere)
                        <a href="{{ route('nadoautoenchere.prelogin') }}">
                            <img src="{{ asset('assets/images/logoenchere.jpg') }}" alt="Logo Auto Enchère">
                        </a>
                    @else
                        <a href="{{ route('index') }}">
                            <img src="{{ asset('assets/images/logo.png') }}" alt="Logo Nado">
                        </a>
                    @endif
                </div>

                <!-- nav toggle button -->
                <button data-target=".header-nav" data-toggle="collapse" type="button" class="navbar-toggle collapsed" aria-expanded="false" >
                    <i class="fa fa-bars"></i>
                </button>

                <!-- main nav -->
                <div class="header-nav navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li> <a href="{{ route('achat.index') }}" style="color: #1f519b !important" >Achat</a></li>
                        <li> <a href="{{ route('vente.form') }}" style="color: #1f519b !important" >Vente</a></li>

                        <li>
                            @if($client && $client->type === 'flotte&enchere')
                                <a href="{{ route('nadoautoenchere.categories') }}"  
                                   style="background-color: #FFD700;
                                          color: #000 !important;
                                          padding: 8px 16px;
                                          border-radius: 20px;
                                          display: inline-flex;
                                          align-items: center;
                                          gap: 8px;
                                          margin-top:20px;
                                          font-weight: bold;
                                          text-decoration: none;">
                                    Auto Enchere
                                </a>
                            @else
                                <a href="{{ route('nadoautoenchere.prelogin') }}"  
                                   style="background-color: #FFD700;
                                          color: #000 !important;
                                          padding: 8px 16px;
                                          border-radius: 20px;
                                          display: inline-flex;
                                          align-items: center;
                                          gap: 8px;
                                          margin-top:20px;
                                          font-weight: bold;
                                          text-decoration: none;">
                                    Auto Enchere
                                </a>
                            @endif
                        </li>

                        <li> <a href="{{ route('reprise.index') }}" style="color: #1f519b !important" >Reprise</a></li>
                        <li> <a href="{{ route('financement.index') }}" style="color: #1f519b !important">Auto finance</a></li>
                        <li> <a href="{{ route('services.index') }}" style="color: #1f519b !important" >à-propos</a></li>

                        @if ($client)
                            <li class="nav-item dropdown" style="position: relative;">
                                <a href="#" class="dropdown-toggle"
                                   data-toggle="dropdown"
                                   style="background-color: #FFD700;
                                          color: #000 !important;
                                          padding: 8px 16px;
                                          border-radius: 20px;
                                          display: inline-flex;
                                          align-items: center;
                                          gap: 8px;
                                          margin-top:20px;
                                          font-weight: bold;
                                          text-decoration: none;">
                                    <i class="fa fa-user"></i> {{ $client->name }}
                                    <i class="fa fa-chevron-down" style="margin-left: 5px;"></i>
                                </a>

                                <ul class="sub-menu"
                                    style="position: absolute;
                                           background: white;
                                           list-style: none;
                                           padding: 0;
                                           margin: 5px 0 0;
                                           border: 1px solid #ddd;
                                           min-width: 180px;
                                           display: none;
                                           border-radius: 8px;
                                           box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

                                    <li style="list-style: none;">
                                        <a href="{{ route('client.dashboard') }}"
                                           style="display: block;
                                                  padding: 10px 15px;
                                                  text-decoration: none;
                                                  color: #333;
                                                  font-size: 14px;">
                                            <i class="fa fa-home"></i> Mon espace
                                        </a>
                                    </li>

                                    <li style="list-style: none;">
                                        <form method="POST" action="{{ route('logout') }}">
                                            @csrf
                                            <button type="submit"
                                                    style="width: 100%;
                                                           background: none;
                                                           border: none;
                                                           padding: 10px 15px;
                                                           text-align: left;
                                                           color: #c00;
                                                           font-size: 14px;
                                                           cursor: pointer;">
                                                <i class="fa fa-sign-out-alt"></i> Déconnexion
                                            </button>
                                        </form>
                                    </li>
                                </ul>
                            </li>

                            {{-- Add dropdown toggle behavior --}}
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
                        @else
                            <li class="nav-item">
                                <a href="{{ route('client.login') }}"
                                   style="background-color: #FFD700;
                                          color: #000 !important;
                                          padding: 8px 8px;
                                          margin-top:20px;
                                          border-radius: 20px;
                                          font-weight: bold;
                                          text-decoration: none;">
                                    Publier une Annonce
                                </a>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- main header END -->

    <style>
        @media only screen and (max-width: 991px) {
    .header-nav .nav {
   
        height: 250px !important;
    }
}
        .navbar-nav > li.dropdown:hover > .sub-menu {
            display: block !important;
        }
        .navbar-nav .dropdown-toggle {
            display: inline-block !important;
        }
        .navbar-nav .nav-item {
            list-style: none !important;
        }
        .navbar-nav,
        .navbar-nav ul,
        .navbar-nav li,
        .navbar-nav .sub-menu {
            list-style-type: none !important;
            padding-left: 0 !important;
            margin-left: 0 !important;
        }
        .navbar-nav li::marker,
        .navbar-nav li::before {
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
        .dropdown:hover .sub-menu {
            display: block !important;
        }
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
        .dropdown-toggle i.fa {
            margin-left: 5px;
        }
    </style>
</header>
<!-- header END -->
@include('layouts.blocknav')
