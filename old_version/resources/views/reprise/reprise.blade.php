<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">



<body id="bg" class="font-poppins home-2" style="background-color: #0f172a;">
    <!-- Ensure body matches Dark Theme -->
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MZMXWVX4" height="0" width="0"
            style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->

    <div class="page-wraper">
        <!-- Navigation (Embedded) -->
        @php
            $client = Auth::guard('client')->user();
            // Check if on Auto Enchère route
            $isAutoEnchere = request()->routeIs('nadoautoenchere.*');

            // Theme Colors
            $accentColor = $isAutoEnchere ? '#F37021' : '#FDD817';
            $buttonHoverBg = $isAutoEnchere ? '#F37021' : '#FDD817';
            $logoText = $isAutoEnchere ? 'AUTO ENCHÈRE' : 'NADO';
            
        @endphp

        <header class="nado-navbar sticky-top">
            <!-- Font Awesome & Lucide Icons -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
            <script src="https://unpkg.com/lucide@latest"></script>

            <!-- Top Bar Info -->
            <div class="top-bar" style="background-color: #FDD817;">
                <div class="container custom-container top-bar-content">
                    <div class="contact-info">
                        <div class="info-item">
                            <i data-lucide="mail"></i>
                            <a href="mailto:contact@nado.ma">contact@nado.ma</a>
                        </div>
                        <div class="info-item">
                            <i data-lucide="phone-call"></i>
                            <a href="tel:+212520070611">+212 520 070 611</a>
                        </div>
                    </div>

                    <div class="social-links">
                        <a href="#"><i data-lucide="facebook"></i></a>
                        <a href="#"><i data-lucide="instagram"></i></a>
                        <a href="#"><i data-lucide="linkedin"></i></a>
                    </div>
                </div>
            </div>

            <!-- Main Navigation -->
            <nav class="main-nav">
                <div class="container custom-container nav-content">
                    <div class="left-section">
                        <!-- Logo -->
                        <a href="{{ $isAutoEnchere ? route('nadoautoenchere.prelogin') : route('index') }}"
                            class="logo-link">
                            @if ($isAutoEnchere)
                                <span class="logo-text">
                                    <span class="text-dark">AUTO </span>
                                    <span style="color: #F37021;">ENCHÈRE</span>
                                </span>
                            @else
                                <span class="logo-text">
                                    <span style="color: #1459DD;">NA</span>
                                    <span style="color: #FDD817;">DO</span>
                                </span>
                            @endif
                        </a>

                        <!-- Desktop Menu -->
                        <div class="desktop-menu">
                            @if ($isAutoEnchere)
                                <a href="{{ route('achat.index') }}" class="nav-link">Acheter</a>
                                <div class="nav-dropdown-wrapper">
                                    <button class="nav-link dropdown-trigger">
                                        Vendre <i data-lucide="chevron-right" class="icon-sm"></i>
                                    </button>
                                    <div class="nav-dropdown-menu">
                                        <a href="{{ route('vente.form') }}">Particulier</a>
                                        <a href="{{ route('client.login') }}">Professionnel</a>
                                    </div>
                                </div>
                            @else
                                <a href="{{ route('achat.index') }}" class="nav-link">Achat</a>
                                <a href="{{ route('vente.form') }}" class="nav-link">Vente</a>
                                <a href="{{ route('nadoautoenchere.prelogin') }}"
                                    class="nav-link highlight-link">Auto-enchère</a>
                                <a href="{{ route('reprise.index') }}" class="nav-link">Reprise</a>
                                <a href="{{ route('financement.index') }}" class="nav-link">Auto-financement</a>
                                <a href="{{ route('services.index') }}" class="nav-link">À propos</a>
                            @endif
                        </div>
                    </div>

                    <!-- Right Actions -->
                    <div class="right-section">
                        @if ($client)
                            <div class="user-dropdown-wrapper">
                                <button class="cta-button outline-btn">
                                    <i data-lucide="user"></i>
                                    <span>{{ $client->name }}</span>
                                    <i data-lucide="chevron-down" class="icon-sm"></i>
                                </button>
                                <div class="user-dropdown-menu">
                                    <a href="{{ route('client.dashboard') }}"><i data-lucide="layout-dashboard"></i>
                                        Mon espace</a>
                                    <form method="POST" action="{{ route('logout') }}">
                                        @csrf
                                        <button type="submit" class="logout-btn"><i data-lucide="log-out"></i>
                                            Déconnexion</button>
                                    </form>
                                </div>
                            </div>
                        @else
                            <a href="{{ route('client.login') }}" class="cta-button outline-btn">
                                @if ($isAutoEnchere)
                                    Créez un compte
                                @else
                                    Publier une annonce
                                @endif
                            </a>
                        @endif

                        <button id="mobileMenuBtn" class="mobile-menu-btn">
                            <i data-lucide="menu"></i>
                        </button>
                    </div>
                </div>
            </nav>

            <!-- Mobile Drawer -->
            <div id="mobileDrawer" class="mobile-drawer">
                <div id="drawerBackdrop" class="drawer-backdrop"></div>
                <div id="drawerContent" class="drawer-content">
                    <div class="drawer-header">
                        <span class="logo-text">
                            @if ($isAutoEnchere)
                                <span class="text-dark">AUTO </span>
                                <span style="color: #F37021;">ENCHÈRE</span>
                            @else
                                <span style="color: #1459DD;">NA</span>
                                <span style="color: #FDD817;">DO</span>
                            @endif
                        </span>
                        <button id="closeDrawerBtn" class="close-btn">
                            <i data-lucide="x"></i>
                        </button>
                    </div>

                    <div class="drawer-links">
                        @if ($isAutoEnchere)
                            <a href="{{ route('achat.index') }}">Acheter</a>
                            <a href="{{ route('vente.form') }}">Vendre (Particulier)</a>
                            <a href="{{ route('client.login') }}">Vendre (Pro)</a>
                        @else
                            <a href="{{ route('achat.index') }}">Achat</a>
                            <a href="{{ route('vente.form') }}">Vente</a>
                            <a href="{{ route('nadoautoenchere.prelogin') }}"
                                style="color: #1459DD;">Auto-enchère</a>
                            <a href="{{ route('reprise.index') }}">Reprise</a>
                            <a href="{{ route('financement.index') }}">Auto-financement</a>
                            <a href="{{ route('services.index') }}">À propos</a>
                        @endif
                    </div>

                    <div class="drawer-footer">
                        @if ($client)
                            <a href="{{ route('client.dashboard') }}" class="drawer-cta"
                                style="background-color: {{ $accentColor }};">
                                <i data-lucide="layout-dashboard"></i> Mon espace
                            </a>
                        @else
                            <a href="{{ route('client.login') }}" class="drawer-cta"
                                style="background-color: {{ $accentColor }};">
                                <i data-lucide="user"></i> Publier une annonce
                            </a>
                        @endif

                        <div class="drawer-socials">
                            <a href="#"><i data-lucide="facebook"></i></a>
                            <a href="#"><i data-lucide="instagram"></i></a>
                            <a href="#"><i data-lucide="linkedin"></i></a>
                        </div>

                        <div class="drawer-divider"></div>

                        <div class="drawer-support">
                            <p>Support NADO</p>
                            <a href="tel:+212520070611">+212 520 070 611</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Styles -->
            <style>
                :root {
                    --primary-blue: #1459DD;
                    --slate-900: #0f172a;
                    --slate-700: #334155;
                    --slate-50: #f8fafc;
                    --border-color: #e2e8f0;
                }

                .nado-navbar {
                    font-family: 'Inter', sans-serif;
                    width: 100%;
                    z-index: 1000;
                    position: relative;
                    direction: ltr;
                }

                .sticky-top {

                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    z-index: 1000;
                }

                /* Top Bar */
                .top-bar {
                    padding: 10px 16px;
                    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                    color: var(--slate-900);
                }

                .custom-container {
                    max-width: 1280px;
                    margin: 0 auto;
                    padding: 0 16px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    width: 100%;
                }

                .contact-info {
                    display: flex;
                    gap: 12px;
                }

                .info-item {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    font-size: 11px;
                    font-weight: 900;
                    text-transform: uppercase;
                    letter-spacing: 0.1em;
                    opacity: 0.8;
                }

                .info-item i {
                    width: 12px;
                    height: 12px;
                    color: var(--primary-blue);
                }

                .info-item a {
                    color: inherit;
                    text-decoration: none;
                    transition: color 0.2s;
                }

                .info-item a:hover {
                    color: var(--primary-blue);
                }

                .social-links {
                    display: flex;
                    gap: 20px;
                }

                .social-links a {
                    color: var(--slate-900);
                    opacity: 0.6;
                    transition: opacity 0.2s, color 0.2s;
                }

                .social-links a:hover {
                    color: var(--primary-blue);
                    opacity: 1;
                }

                .social-links i {
                    width: 20px;
                    height: 20px;
                }

                /* Main Nav */
                .main-nav {
                    background: white;
                    border-bottom: 1px solid var(--border-color);
                    height: 96px;
                    display: flex;
                    align-items: center;
                }

                .nav-content {
                    height: 100%;
                    width: 100%;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .left-section {
                    display: flex;
                    align-items: center;
                    gap: 64px;
                }

                .logo-link {
                    text-decoration: none;
                    transition: transform 0.2s;
                }

                .logo-link:hover {
                    transform: scale(1.05);
                }

                .logo-text {
                    font-size: 2.25rem;
                    /* 36px */
                    font-weight: 900;
                    text-transform: uppercase;
                    line-height: 1;
                    letter-spacing: -0.05em;
                }

                .text-dark {
                    color: var(--slate-900);
                }

                /* Desktop Menu */
                .desktop-menu {
                    display: none;
                    align-items: center;
                    gap: 12px;
                }

                @media (min-width: 1024px) {
                    .desktop-menu {
                        display: flex;
                    }
                }

                .nav-link {
                    font-size: 14.4px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 0.025em;
                    padding: 8px 12px;
                    border-radius: 16px;
                    color: var(--slate-700);
                    text-decoration: none;
                    transition: all 0.2s;
                    background: transparent;
                    border: none;
                    cursor: pointer;
                }

                .nav-link:hover {
                    background-color: #f1f5f9;
                    color: var(--primary-blue);
                }

                .highlight-link {
                    color: var(--primary-blue);
                    background-color: #dbeafe;
                }

                .highlight-link:hover {
                    background-color: #bfdbfe;
                }

                /* Dropdown */
                .nav-dropdown-wrapper {
                    position: relative;
                }

                .dropdown-trigger {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .nav-dropdown-menu {
                    position: absolute;
                    top: 100%;
                    left: 0;
                    margin-top: 8px;
                    background: white;
                    border-radius: 16px;
                    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
                    border: 1px solid var(--border-color);
                    min-width: 200px;
                    overflow: hidden;
                    display: none;
                }

                .nav-dropdown-wrapper:hover .nav-dropdown-menu {
                    display: block;
                }

                .nav-dropdown-menu a {
                    display: block;
                    padding: 16px 20px;
                    font-size: 14px;
                    font-weight: 700;
                    text-transform: uppercase;
                    color: var(--slate-700);
                    text-decoration: none;
                    transition: background 0.2s;
                }

                .nav-dropdown-menu a:hover {
                    background-color: #fff7ed;
                    color: #F37021;
                }

                /* Right Section */
                .right-section {
                    margin-left: auto;
                    display: flex;
                    align-items: center;
                    gap: 12px;
                }

                .cta-button {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    padding: 10px 16px;
                    border-radius: 16px;
                    font-size: 15px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 0.1em;
                    text-decoration: none;
                    cursor: pointer;
                    transition: all 0.2s;
                }

                .cta-button:active {
                    transform: scale(0.95);
                }

                .outline-btn {
                    background-color: rgba(253, 216, 23, 0.2);
                    border: 1px solid rgba(253, 216, 23, 0.5);
                    color: var(--slate-900);
                }

                .outline-btn:hover {
                    background-color: #FDD817;
                }

                /* Adjust hover for enchere mode via JS or specific classes if needed,
                   but inline style logic handles the main color. Here we default to Nado yellow styles. */

                .desktop-only {
                    display: none;
                }

                @media (min-width: 1024px) {
                    .desktop-only {
                        display: flex;
                    }
                }

                .mobile-menu-btn {
                    display: block;
                    padding: 12px;
                    background-color: var(--slate-50);
                    border: none;
                    border-radius: 12px;
                    cursor: pointer;
                    color: var(--slate-900);
                }

                @media (min-width: 1024px) {
                    .mobile-menu-btn {
                        display: none;
                    }
                }

                .user-dropdown-wrapper {
                    position: relative;
                    display: none;
                }

                @media (min-width: 1024px) {
                    .user-dropdown-wrapper {
                        display: block;
                    }
                }

                .user-dropdown-menu {
                    position: absolute;
                    right: 0;
                    top: 100%;
                    margin-top: 8px;
                    width: 192px;
                    background: white;
                    border-radius: 12px;
                    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
                    border: 1px solid var(--border-color);
                    display: none;
                    overflow: hidden;
                }

                .user-dropdown-wrapper:hover .user-dropdown-menu {
                    display: block;
                }

                .user-dropdown-menu a,
                .user-dropdown-menu button {
                    display: flex;
                    align-items: center;
                    width: 100%;
                    padding: 12px 16px;
                    font-size: 14px;
                    font-weight: 700;
                    text-align: left;
                    background: none;
                    border: none;
                    cursor: pointer;
                    text-decoration: none;
                    color: var(--slate-700);
                }

                .user-dropdown-menu a:hover {
                    background-color: #f8fafc;
                    color: var(--primary-blue);
                }

                .user-dropdown-menu i {
                    width: 16px;
                    height: 16px;
                    margin-right: 8px;
                }

                .logout-btn {
                    color: #dc2626 !important;
                }

                .logout-btn:hover {
                    background-color: #fef2f2 !important;
                }

                /* Mobile Drawer */
                .mobile-drawer {
                    position: fixed;
                    inset: 0;
                    z-index: 1100;
                    visibility: hidden;
                    transition: visibility 0.5s;
                }

                .mobile-drawer.visible {
                    visibility: visible;
                }

                .drawer-backdrop {
                    position: absolute;
                    inset: 0;
                    background-color: rgba(15, 23, 42, 0.4);
                    backdrop-filter: blur(12px);
                    opacity: 0;
                    transition: opacity 0.5s;
                }

                .visible .drawer-backdrop {
                    opacity: 1;
                }

                .drawer-content {
                    position: absolute;
                    top: 0;
                    right: 0;
                    height: 100%;
                    width: 85%;
                    max-width: 420px;
                    background: white;
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                    transform: translateX(100%);
                    transition: transform 0.5s;
                    display: flex;
                    flex-direction: column;
                }

                .visible .drawer-content {
                    transform: translateX(0);
                }

                .drawer-header {
                    padding: 32px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .close-btn {
                    background: none;
                    border: none;
                    color: #94a3b8;
                    cursor: pointer;
                }

                .close-btn:hover {
                    color: var(--slate-900);
                }

                .drawer-links {
                    flex: 1;
                    overflow-y: auto;
                    padding: 16px 32px;
                    display: flex;
                    flex-direction: column;
                    gap: 24px;
                }

                .drawer-links a {
                    font-size: 18px;
                    font-weight: 900;
                    text-transform: uppercase;
                    letter-spacing: -0.025em;
                    color: var(--slate-900);
                    text-decoration: none;
                    transition: color 0.2s;
                }

                .drawer-links a:hover {
                    color: var(--primary-blue);
                }

                .drawer-footer {
                    padding: 40px;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }

                .drawer-cta {
                    width: 100%;
                    padding: 24px;
                    border-radius: 32px;
                    font-size: 14px;
                    font-weight: 900;
                    text-transform: uppercase;
                    letter-spacing: 0.2em;
                    color: var(--slate-900);
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 12px;
                    margin-bottom: 48px;
                    transition: transform 0.2s;
                }

                .drawer-cta:active {
                    transform: scale(0.95);
                }

                .drawer-socials {
                    display: flex;
                    gap: 40px;
                    margin-bottom: 48px;
                }

                .drawer-socials a {
                    color: #94a3b8;
                    transition: color 0.2s;
                }

                .drawer-socials a:hover {
                    color: var(--slate-900);
                }

                .drawer-divider {
                    width: 100%;
                    height: 1px;
                    background-color: #f1f5f9;
                    margin-bottom: 40px;
                }

                .drawer-support {
                    text-align: center;
                }

                .drawer-support p {
                    font-size: 14px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 0.025em;
                    margin-bottom: 12px;
                }

                .drawer-support a {
                    font-size: 20px;
                    font-weight: 900;
                    color: var(--slate-900);
                    text-decoration: none;
                    transition: color 0.2s;
                }

                .drawer-support a:hover {
                    color: var(--primary-blue);
                }

                .icon-sm {
                    width: 16px;
                    height: 16px;
                }
            </style>
        </header>

        <!-- Navbar Scripts -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Initialize Lucide Icons
                if (typeof lucide !== 'undefined') {
                    lucide.createIcons();
                }

                // Drawer Logic
                const mobileMenuBtn = document.getElementById('mobileMenuBtn');
                const closeDrawerBtn = document.getElementById('closeDrawerBtn');
                const mobileDrawer = document.getElementById('mobileDrawer');
                const drawerBackdrop = document.getElementById('drawerBackdrop');
                const drawerContent = document.getElementById('drawerContent');

                function openDrawer() {
                    if (!mobileDrawer) return;
                    mobileDrawer.classList.add('visible');
                    document.body.style.overflow = 'hidden';
                }

                function closeDrawer() {
                    if (!mobileDrawer) return;
                    mobileDrawer.classList.remove('visible');
                    document.body.style.overflow = 'unset';
                }

                if (mobileMenuBtn) mobileMenuBtn.addEventListener('click', openDrawer);
                if (closeDrawerBtn) closeDrawerBtn.addEventListener('click', closeDrawer);
                if (drawerBackdrop) drawerBackdrop.addEventListener('click', closeDrawer);
            });
        </script>

        <!-- Content -->
        <div class="page-content"
            style="width: 100%; max-width: 100%; padding: 140px 0 0 0; margin: 0; overflow-x: hidden;">

            <!-- Custom CSS for Reprise Section -->
            <style>
                :root {
                    --primary: #1459DD;
                    --slate-50: #f8fafc;
                    --slate-100: #f1f5f9;
                    --slate-300: #cbd5e1;
                    --slate-400: #94a3b8;
                    --slate-500: #64748b;
                    --slate-800: #1e293b;
                    --slate-900: #0f172a;
                    --white: #ffffff;
                }

                /* Override any potential global constraints for this specific wrapper */
                .reprise-wrapper {
                    font-family: 'Inter', sans-serif;
                    color: var(--slate-900);
                    width: 100%;
                    overflow-x: hidden;
                    margin: 0;
                    padding: 0;
                }

                .reprise-wrapper button {
                    cursor: pointer;
                    border: none;
                    outline: none;
                    transition: all 0.3s ease;
                }

                .reprise-wrapper .btn-primary {
                    background-color: var(--primary);
                    color: #ffffff !important;
                    padding: 1.5rem 3rem;
                    border-radius: 9999px;
                    font-weight: 900;
                    font-size: 0.75rem;
                    text-transform: uppercase;
                    letter-spacing: 0.1em;
                    box-shadow: 0 25px 50px -12px rgba(20, 89, 221, 0.4);
                    display: inline-flex;
                    align-items: center;
                    gap: 1rem;
                    text-decoration: none;
                }

                .reprise-wrapper .btn-primary:hover {
                    background-color: #1d4ed8;
                    transform: translateY(-2px);
                    color: var(--white);
                }

                .reprise-wrapper .btn-primary:active {
                    transform: scale(0.95);
                }

                /* Hero Section */
                .reprise-wrapper .hero {
                    position: relative;
                    min-height: 85vh;
                    display: flex;
                    align-items: center;
                    background-color: var(--slate-900);
                    overflow: hidden;
                    width: 100%;
                }

                .reprise-wrapper .hero-bg {
                    position: absolute;
                    inset: 0;
                    opacity: 0.1;
                    pointer-events: none;
                    background-image: radial-gradient(#1459DD 1px, transparent 1px);
                    background-size: 40px 40px;
                }

                .reprise-wrapper .container-custom {
                    max-width: 80rem;
                    margin: 0 auto;
                    padding: 0 1.5rem;
                    width: 100%;
                }

                /* Override for Hero Title */
                .reprise-wrapper .hero h1 {
                    font-size: 3.75rem;
                    font-weight: 900;
                    color: #ffffff !important;
                    text-transform: uppercase;
                    letter-spacing: -0.05em;
                    line-height: 1;
                    margin: 0 0 2.5rem 0;
                }

                @media (min-width: 768px) {
                    .reprise-wrapper .hero h1 {
                        font-size: 6rem;
                    }
                }

                .reprise-wrapper .text-highlight {
                    color: var(--primary) !important;
                }

                .reprise-wrapper .hero p {
                    font-size: 1.25rem;
                    color: #94a3b8 !important;
                    /* slate-400 */
                    font-weight: 500;
                    line-height: 1.625;
                    max-width: 32rem;
                    margin: 0 0 3rem 0;
                }

                .reprise-wrapper .hero-image-wrapper {
                    display: none;
                    position: relative;
                }

                @media (min-width: 1024px) {
                    .reprise-wrapper .hero-image-wrapper {
                        display: block;
                    }
                }

                .reprise-wrapper .hero-grid {
                    display: grid;
                    grid-template-columns: 1fr;
                    gap: 4rem;
                    align-items: center;
                    position: relative;
                    z-index: 10;
                }

                @media (min-width: 1024px) {
                    .reprise-wrapper .hero-grid {
                        grid-template-columns: 1fr 1fr;
                    }
                }

                .reprise-wrapper .badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    padding: 0.5rem 1rem;
                    background-color: #FDD817;
                    color: var(--slate-900);
                    border-radius: 9999px;
                    font-weight: 900;
                    font-size: 10px;
                    text-transform: uppercase;
                    letter-spacing: 0.3em;
                    margin-bottom: 2rem;
                    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
                }

                .reprise-wrapper .hero-card {
                    background-color: var(--slate-800);
                    padding: 0.75rem;
                    border-radius: 4rem;
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                    position: relative;
                    overflow: hidden;
                    transform: rotate(2deg);
                }

                .reprise-wrapper .hero-img {
                    width: 100%;
                    height: auto;
                    border-radius: 3.5rem;
                    filter: grayscale(100%);
                    display: block;
                }

                .reprise-wrapper .hero-card-content {
                    position: absolute;
                    bottom: 2.5rem;
                    left: 2.5rem;
                    right: 2.5rem;
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-end;
                }

                .reprise-wrapper .hero-card-title {
                    color: var(--white);
                    font-weight: 900;
                    font-size: 1.5rem;
                    text-transform: uppercase;
                    letter-spacing: -0.05em;
                    line-height: 1;
                }

                .reprise-wrapper .icon-box {
                    width: 4rem;
                    height: 4rem;
                    background-color: rgba(255, 255, 255, 0.1);
                    backdrop-filter: blur(24px);
                    border: 1px solid rgba(255, 255, 255, 0.2);
                    border-radius: 1rem;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: var(--white);
                }

                /* Process Section */
                .reprise-wrapper .process-section {
                    padding: 8rem 0;
                    background-color: var(--slate-50);
                }

                .reprise-wrapper .section-header {
                    text-align: left;
                    margin-bottom: 5rem;
                }

                .reprise-wrapper .subtitle {
                    font-size: 10px;
                    font-weight: 900;
                    color: var(--primary);
                    text-transform: uppercase;
                    letter-spacing: 0.5em;
                    margin-bottom: 1rem;
                    display: block;
                }

                .reprise-wrapper .section-title {
                    font-size: 2.25rem;
                    font-weight: 900;
                    color: var(--slate-900);
                    text-transform: uppercase;
                    letter-spacing: -0.05em;
                    line-height: 1;
                    margin: 0;
                }

                @media (min-width: 768px) {
                    .reprise-wrapper .section-title {
                        font-size: 3.75rem;
                    }
                }

                .reprise-wrapper .steps-grid {
                    display: grid;
                    grid-template-columns: 1fr;
                    gap: 1.5rem;
                }

                @media (min-width: 768px) {
                    .reprise-wrapper .steps-grid {
                        grid-template-columns: repeat(2, 1fr);
                    }
                }

                @media (min-width: 1024px) {
                    .reprise-wrapper .steps-grid {
                        grid-template-columns: repeat(4, 1fr);
                    }
                }

                .reprise-wrapper .step-card {
                    background-color: var(--white);
                    padding: 2.5rem;
                    border-radius: 2.5rem;
                    border: 1px solid var(--slate-100);
                    transition: all 0.3s ease;
                    position: relative;
                    overflow: hidden;
                }

                .reprise-wrapper .step-card:hover {
                    border-color: var(--primary);
                }

                .reprise-wrapper .step-number {
                    position: absolute;
                    top: 1.5rem;
                    right: 2.5rem;
                    font-size: 3rem;
                    font-weight: 900;
                    color: var(--slate-50);
                    transition: color 0.3s ease;
                }

                .reprise-wrapper .step-card:hover .step-number {
                    color: #eff6ff;
                }

                .reprise-wrapper .step-icon {
                    width: 4rem;
                    height: 4rem;
                    background-color: #eff6ff;
                    color: var(--primary);
                    border-radius: 1rem;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin-bottom: 2.5rem;
                    transition: all 0.3s ease;
                    position: relative;
                    z-index: 10;
                }

                .reprise-wrapper .step-card:hover .step-icon {
                    background-color: var(--primary);
                    color: var(--white);
                }

                .reprise-wrapper .step-title {
                    font-size: 1.25rem;
                    font-weight: 900;
                    color: var(--slate-900);
                    text-transform: uppercase;
                    letter-spacing: -0.025em;
                    margin: 0 0 1rem 0;
                    position: relative;
                    z-index: 10;
                }

                .reprise-wrapper .step-desc {
                    color: var(--slate-500);
                    font-size: 0.875rem;
                    font-weight: 500;
                    line-height: 1.625;
                    margin: 0;
                    position: relative;
                    z-index: 10;
                }

                /* Modal */
                .reprise-wrapper .modal-overlay {
                    position: fixed;
                    inset: 0;
                    z-index: 9999;
                    background-color: rgba(15, 23, 42, 0.95);
                    backdrop-filter: blur(8px);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 1rem;
                    opacity: 0;
                    visibility: hidden;
                    transition: all 0.3s ease;
                    overflow-y: auto;
                    /* Allow scrolling on small screens */
                }

                .reprise-wrapper .modal-overlay.open {
                    opacity: 1;
                    visibility: visible;
                }

                .reprise-wrapper .modal-content {
                    background-color: var(--white);
                    border-radius: 2rem;
                    /* Reduced for mobile */
                    width: 100%;
                    max-width: 64rem;
                    /* Wider max-width */
                    margin: auto;
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                    position: relative;
                    display: grid;
                    grid-template-columns: 1fr;
                    text-align: left;
                    overflow: hidden;
                }

                @media (min-width: 1024px) {
                    .reprise-wrapper .modal-content {
                        grid-template-columns: 2fr 3fr;
                        /* More space for form */
                        min-height: 600px;
                        border-radius: 3rem;
                    }
                }

                .reprise-wrapper .modal-close {
                    position: absolute;
                    top: 1.5rem;
                    right: 1.5rem;
                    background: rgba(255, 255, 255, 0.8);
                    border-radius: 50%;
                    padding: 0.5rem;
                    color: var(--slate-400);
                    z-index: 20;
                    transition: all 0.2s;
                    cursor: pointer;
                }

                @media (min-width: 768px) {
                    .reprise-wrapper .modal-close {
                        top: 2rem;
                        right: 2rem;
                    }
                }

                .reprise-wrapper .modal-close:hover {
                    color: var(--slate-900);
                    background: white;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                }

                .reprise-wrapper .modal-left {
                    background-color: var(--slate-900);
                    padding: 2.5rem;
                    display: none;
                    /* Hide on mobile by default to save space? Or stick to top? Keep it simple: show on desktop */
                    flex-direction: column;
                    justify-content: space-between;
                    color: var(--white);
                    background-image: linear-gradient(to bottom right, var(--slate-900), #0f172a);
                }

                @media (min-width: 1024px) {
                    .reprise-wrapper .modal-left {
                        display: flex;
                        padding: 4rem;
                    }
                }

                .reprise-wrapper .modal-left h3 {
                    font-size: 2.5rem;
                    font-weight: 900;
                    text-transform: uppercase;
                    letter-spacing: -0.05em;
                    line-height: 1;
                    margin: 0 0 1.5rem 0;
                    color: white !important;
                }

                .reprise-wrapper .modal-left p {
                    color: var(--slate-400);
                    font-weight: 500;
                    line-height: 1.6;
                    font-size: 1.125rem;
                }

                .reprise-wrapper .modal-right {
                    padding: 2rem;
                    /* Reduced mobile padding */
                    background-color: #fff;
                }

                @media (min-width: 768px) {
                    .reprise-wrapper .modal-right {
                        padding: 3rem;
                    }
                }

                @media (min-width: 1024px) {
                    .reprise-wrapper .modal-right {
                        padding: 4rem;
                    }
                }

                .reprise-wrapper .form-grid {
                    display: grid;
                    grid-template-columns: 1fr;
                    gap: 1rem;
                }

                /* Change breakpoint to 768px (MD) for 2 columns */
                @media (min-width: 768px) {
                    .reprise-wrapper .form-grid {
                        grid-template-columns: 1fr 1fr;
                        gap: 1.25rem;
                    }

                    .reprise-wrapper .form-col-full {
                        grid-column: span 2;
                    }
                }

                .reprise-wrapper .form-label {
                    display: block;
                    font-size: 0.7rem;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 0.05em;
                    color: var(--slate-500);
                    margin-bottom: 0.375rem;
                    margin-left: 0.25rem;
                }

                .reprise-wrapper .form-input {
                    width: 100%;
                    background-color: #f8fafc;
                    /* slate-50 */
                    border: 1px solid #e2e8f0 !important;
                    /* slate-200 */
                    border-radius: 0.75rem;
                    padding: 0.75rem 1rem;
                    font-weight: 600;
                    font-size: 0.95rem;
                    font-family: inherit;
                    box-sizing: border-box;
                    outline: none;
                    transition: all 0.2s ease;
                    height: auto;
                    color: var(--slate-900);
                    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
                }

                .reprise-wrapper .form-input:focus {
                    border-color: var(--primary) !important;
                    background-color: white;
                    box-shadow: 0 0 0 3px rgba(20, 89, 221, 0.15);
                }

                .reprise-wrapper .form-input::placeholder {
                    color: #94a3b8;
                    /* slate-400 */
                    font-weight: 500;
                }

                .reprise-wrapper .btn-submit {
                    width: 100%;
                    padding: 1rem;
                    background-color: var(--primary);
                    background-image: linear-gradient(to bottom right, var(--primary), #1d4ed8);
                    color: var(--white);
                    border-radius: 0.75rem;
                    font-weight: 800;
                    font-size: 0.875rem;
                    text-transform: uppercase;
                    letter-spacing: 0.1em;
                    text-decoration: none;
                    transition: all 0.2s ease;
                    border: none;
                    cursor: pointer;
                    box-shadow: 0 4px 6px -1px rgba(20, 89, 221, 0.3);
                }

                .reprise-wrapper .btn-submit:hover {
                    background-image: linear-gradient(to bottom right, #1d4ed8, #1e40af);
                    transform: translateY(-1px);
                    box-shadow: 0 10px 15px -3px rgba(20, 89, 221, 0.4);
                }

                .reprise-wrapper .btn-submit:active {
                    transform: scale(0.98);
                }

                .reprise-wrapper .success-view {
                    display: none;
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                    padding: 2.5rem 0;
                }

                .reprise-wrapper .success-view.visible {
                    display: flex;
                }

                .reprise-wrapper .success-title {
                    font-size: 2rem;
                    font-weight: 900;
                    color: var(--slate-900);
                    text-transform: uppercase;
                    letter-spacing: -0.05em;
                    margin: 0 0 1rem 0;
                    line-height: 1;
                }

                .reprise-wrapper .success-desc {
                    color: var(--slate-500);
                    margin: 0 0 2rem 0;
                    font-size: 1.125rem;
                }

                .reprise-wrapper .btn-secondary {
                    padding: 1rem 3rem;
                    background-color: #f1f5f9;
                    /* slate-100 */
                    color: var(--slate-900);
                    border-radius: 0.75rem;
                    font-weight: 800;
                    font-size: 0.75rem;
                    text-transform: uppercase;
                    text-decoration: none;
                    display: inline-block;
                    transition: all 0.2s;
                }

                .reprise-wrapper .btn-secondary:hover {
                    background-color: #e2e8f0;
                    /* slate-200 */
                }

                /* Error message styling */
                .reprise-wrapper .error-msg {
                    color: #ef4444;
                    /* red-500 */
                    font-size: 0.875rem;
                    font-weight: 600;
                    margin-top: 0.5rem;
                    display: none;
                    padding: 0.75rem;
                    background-color: #fef2f2;
                    border-radius: 0.5rem;
                    border: 1px solid #fee2e2;
                }

                .reprise-wrapper .reprise-btn {
                    display: inline-block;
                    color: var(--slate-500);
                    font-weight: 700;
                    text-decoration: none;
                    font-size: 0.75rem;
                    letter-spacing: 0.05em;
                    margin-top: 1.5rem;
                    transition: color 0.2s;
                }

                .reprise-wrapper .reprise-btn:hover {
                    color: var(--primary);
                }
            </style>

            <div class="reprise-wrapper">
                <!-- Hero Section -->
                <section class="hero">
                    <div class="hero-bg"></div>
                    <div class="container-custom relative z-10 w-full">
                        <div class="hero-grid">
                            <div>
                                <div class="badge">
                                    <i data-lucide="hand-coins" width="14" height="14"></i> Reprise & Échange
                                </div>
                                <h1>
                                    L'échange <br />
                                    <span class="text-highlight">Gagnant.</span>
                                </h1>
                                <p>
                                    Nous reprenons votre véhicule au juste prix en échange d'une voiture de votre choix
                                    dans le stock NADO. <strong>La solution la plus simple pour changer de
                                        voiture.</strong>
                                </p>
                                <button class="btn-primary" onclick="openRepriseModal()">
                                    Estimer pour une reprise <i data-lucide="arrow-right" width="20"
                                        height="20"></i>
                                </button>
                            </div>

                            <div class="hero-image-wrapper">
                                <div class="hero-card">
                                    <img src="https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&q=80&w=1200"
                                        alt="Premium Car" class="hero-img">
                                    <div class="hero-card-content">
                                        <div>
                                            <p class="hero-card-title">Juste Prix</p>
                                        </div>
                                        <div class="icon-box">
                                            <i data-lucide="zap" width="32" height="32"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Process Section -->
                <section class="process-section">
                    <div class="container-custom">
                        <div class="section-header">
                            <span class="subtitle">Notre Processus</span>
                            <h2 class="section-title">
                                Le Procès <br />REPRISE NADO.
                            </h2>
                        </div>
                        <div class="steps-grid">
                            <!-- Step 1 -->
                            <div class="step-card">
                                <span class="step-number">01</span>
                                <div class="step-icon">
                                    <i data-lucide="search" width="32" height="32"></i>
                                </div>
                                <h3 class="step-title">Évaluation en ligne</h3>
                                <p class="step-desc">Obtenez une première estimation de la valeur de votre véhicule
                                    actuel en quelques clics via notre simulateur IA.</p>
                            </div>
                            <!-- Step 2 -->
                            <div class="step-card">
                                <span class="step-number">02</span>
                                <div class="step-icon">
                                    <i data-lucide="shield-check" width="32" height="32"></i>
                                </div>
                                <h3 class="step-title">Expertise physique</h3>
                                <p class="step-desc">Rendez-vous dans l'un de nos showrooms NADO pour une vérification
                                    de 30 min et une offre de reprise ferme.</p>
                            </div>
                            <!-- Step 3 -->
                            <div class="step-card">
                                <span class="step-number">03</span>
                                <div class="step-icon">
                                    <i data-lucide="check-square" width="32" height="32"></i>
                                </div>
                                <h3 class="step-title">Validation & Échange</h3>
                                <p class="step-desc">Nous rachetons votre voiture au juste prix. Ce montant est déduit
                                    directement du prix de votre futur véhicule NADO.</p>
                            </div>
                            <!-- Step 4 -->
                            <div class="step-card">
                                <span class="step-number">04</span>
                                <div class="step-icon">
                                    <i data-lucide="truck" width="32" height="32"></i>
                                </div>
                                <h3 class="step-title">Livraison & Reprise</h3>
                                <p class="step-desc">Repartez avec votre nouveau véhicule. Nous nous occupons de toute
                                    la paperasse administrative de votre ancienne voiture.</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Modal Form -->
                <div id="repriseModal" class="modal-overlay">
                    <div class="modal-content">
                        <button class="modal-close" onclick="closeRepriseModal()">
                            <i data-lucide="x" width="32" height="32"></i>
                        </button>
                        <div class="modal-left">
                            <div>
                                <h3>Reprise <br />Automatisée</h3>
                                <p>Déposez votre demande pour un échange contre un véhicule NADO.</p>
                            </div>
                        </div>
                        <div class="modal-right">
                            <!-- Form View -->
                            <div id="repriseFormView" class="form-group">
                                <form id="repriseForm" action="{{ route('reprise.store') }}" method="POST"
                                    onsubmit="submitRepriseForm(event)">
                                    @csrf
                                    <div class="form-grid">
                                        <!-- Name (Full Width) -->
                                        <div class="form-col-full">
                                            <label class="form-label">Nom & Prénom</label>
                                            <input type="text" class="form-input" name="name" id="name"
                                                placeholder="Votre nom complet" required>
                                        </div>

                                        <!-- Phone -->
                                        <div>
                                            <label class="form-label">Téléphone</label>
                                            <input type="tel" class="form-input" name="phone" id="phone"
                                                placeholder="06..." required>
                                        </div>

                                        <!-- City -->
                                        <div>
                                            <label class="form-label">Ville</label>
                                            <select class="form-input" name="city" id="city" required>
                                                <option value="" disabled selected>Ville</option>
                                                @foreach ($city as $c)
                                                    <option value="{{ $c->name }}">{{ $c->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Brand -->
                                        <div>
                                            <label class="form-label">Marque</label>
                                            <select class="form-input" name="mark" id="mark" required>
                                                <option value="" disabled selected>Marque</option>
                                                @foreach ($brands as $brand)
                                                    <option value="{{ $brand->name }}"
                                                        data-id="{{ $brand->id }}">
                                                        {{ $brand->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Model -->
                                        <div>
                                            <label class="form-label">Modèle</label>
                                            <select class="form-input" name="modele" id="modele" required
                                                disabled>
                                                <option value="" disabled selected>Modèle</option>
                                            </select>
                                        </div>

                                        <!-- Year -->
                                        <div>
                                            <label class="form-label">Année</label>
                                            <select class="form-input" name="year" id="year" required>
                                                <option value="" disabled selected>Année</option>
                                                @for ($i = date('Y'); $i >= 1992; $i--)
                                                    <option title="{{ $i }}" value="{{ $i }}">
                                                        {{ $i }}
                                                    </option>
                                                @endfor
                                            </select>
                                        </div>

                                        <!-- Email (Full Width) -->
                                        <div class="form-col-full">
                                            <label class="form-label">Email</label>
                                            <input type="email" class="form-input" name="email" id="email"
                                                placeholder="votre@email.com" required>
                                        </div>

                                        <!-- Contact Preference -->
                                        <div class="form-col-full">
                                            <label class="form-label">Préférence de contact</label>
                                            <select class="form-input" name="contacte" id="contacte" required>
                                                <option value="" disabled selected>Choisir...</option>
                                                <option value="WhatsApp">WhatsApp</option>
                                                <option value="Telephone">Téléphone</option>
                                            </select>
                                        </div>

                                        <!-- Appointment (Date) -->
                                        <div class="form-col-full">
                                            <label class="form-label">Date de rendez-vous souhaitée</label>
                                            <input class="form-input" name="rendezvous" id="rendezvous"
                                                type="date" min="{{ date('Y-m-d') }}" required>
                                        </div>

                                        <p id="repriseError" class="error-msg form-col-full"></p>

                                        <div class="form-col-full" style="margin-top: 1rem;">
                                            <button type="submit" class="btn-submit">Calculer mon offre</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Success View -->
                            <div id="repriseSuccessView" class="success-view">
                                <h3 class="success-title">Demande de reprise reçue</h3>
                                <p class="success-desc">Un conseiller expert vous contactera pour finaliser l'offre.
                                </p>
                                <button onclick="closeRepriseModal()" class="btn-secondary">Retour au site</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content END-->
            @include('layouts.bottom-page')
        </div>
        @include('layouts.footer')
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <!-- Bootstrap JS bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>

    <script>
        // Initialize Icons
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }

        const modal = document.getElementById('repriseModal');
        const formView = document.getElementById('repriseFormView');
        const successView = document.getElementById('repriseSuccessView');
        const errorMsg = document.getElementById('repriseError');

        function openRepriseModal() {
            if (modal) {
                modal.classList.add('open');
                formView.style.display = 'block';
                successView.classList.remove('visible');
                errorMsg.style.display = 'none';
            }
        }

        function closeRepriseModal() {
            if (modal) modal.classList.remove('open');
        }

        function submitRepriseForm(event) {
            event.preventDefault(); // Prevent default form submission

            const form = document.getElementById('repriseForm');
            const formData = new FormData(form);

            // Submit via AJAX
            fetch(form.action, {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest',
                        'X-CSRF-TOKEN': document.querySelector('input[name="_token"]')?.value || document.querySelector(
                            'meta[name="csrf-token"]')?.content
                    }
                })
                .then(response => {
                    if (response.ok) {
                        // Success
                        formView.style.display = 'none';
                        successView.classList.add('visible');
                        form.reset();
                    } else {
                        // Error
                        return response.json().then(data => {
                            throw new Error(data.message || 'Une erreur est survenue.');
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    errorMsg.textContent = "Erreur: " + error.message;
                    errorMsg.style.display = 'block';
                });
        }

        // Close on click outside
        window.addEventListener('click', function(e) {
            if (e.target === modal) {
                closeRepriseModal();
            }
        });

        // AJAX for Model Selection (Adapted from user snippet)
        $(document).ready(function() {
            $('#mark').on('change', function() {
                // Determine source: standard view uses data-id, some setups use value
                // In the user's snippet: <option value="{{ $brand->name }}" data-id="{{ $brand->id }}">
                let brandId = $(this).find(':selected').data('id');
                let $modele = $('#modele');

                // Disable and show loading
                $modele.prop('disabled', true).html('<option value="">Chargement...</option>');

                if (brandId) {
                    $.ajax({
                        url: "{{ route('get.models') }}",
                        type: "GET",
                        data: {
                            brand_id: brandId
                        },
                        success: function(data) {
                            $modele.empty().append(
                                '<option value="">Sélectionnez le modèle</option>');
                            $.each(data, function(key, value) {
                                $modele.append('<option value="' + value.name + '">' +
                                    value.name + '</option>');
                            });
                            $modele.prop('disabled', false);
                        },
                        error: function() {
                            $modele.empty().append(
                                '<option value="">Erreur de chargement</option>');
                            $modele.prop('disabled', false);
                        }
                    });
                } else {
                    $modele.empty().append('<option value="">Sélectionnez une marque d’abord</option>');
                    $modele.prop('disabled', true);
                }
            });
        });
    </script>
</body>

</html>
