@extends('layouts.app')
@section('title', 'Liste des annonces')

@section('content')
    <style>
        /* ========== BASE STYLES ========== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .purchase-page {
            background-color: #f8fafc;
            min-height: 100vh;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            padding-bottom: 80px;
        }

        /* ========== BREADCRUMB ========== */
        .breadcrumb-bar {
            background: #fff;
            border-bottom: 1px solid #e2e8f0;
            padding: 12px 0;
        }

        .breadcrumb-bar .container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 16px;
        }

        .breadcrumb-nav {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: #94a3b8;
        }

        .breadcrumb-nav a {
            color: #94a3b8;
            text-decoration: none;
            transition: color 0.3s;
        }

        .breadcrumb-nav a:hover {
            color: #1459DD;
        }

        .breadcrumb-nav .current {
            color: #0f172a;
        }

        /* ========== HERO HEADER ========== */
        .hero-section {
            max-width: 1280px;
            margin: 0 auto;
            padding: 32px 16px;
        }

        .hero-content {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        @media (min-width: 768px) {
            .hero-content {
                flex-direction: row;
                align-items: flex-end;
                justify-content: space-between;
            }
        }

        .hero-update {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #1459DD;
            font-size: 10px;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            margin-bottom: 8px;
        }

        .hero-title {
            font-size: 2.5rem;
            font-weight: 900;
            color: #0f172a;
            text-transform: uppercase;
            letter-spacing: -0.05em;
            line-height: 1;
        }

        @media (min-width: 768px) {
            .hero-title {
                font-size: 3.75rem;
            }
        }

        .hero-title .primary {
            color: #1459DD;
        }

        .hero-title .secondary {
            color: #FDD817;
        }

        .experts-section {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatars {
            display: flex;
        }

        .avatars img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #fff;
            margin-left: -12px;
            object-fit: cover;
        }

        .avatars img:first-child {
            margin-left: 0;
        }

        .experts-text {
            font-size: 10px;
            font-weight: 900;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        /* ========== CATEGORIES ========== */
        .categories-section {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 16px;
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            padding: 8px 0 32px;
        }

        @media (min-width: 640px) {
            .categories-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (min-width: 768px) {
            .categories-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        @media (min-width: 1024px) {
            .categories-grid {
                grid-template-columns: repeat(6, 1fr);
            }
        }

        .category-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 16px;
            border-radius: 12px;
            white-space: nowrap;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border: 1px solid #e2e8f0;
            background: #fff;
            color: #475569;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            width: 100%;
        }

        .category-btn:hover {
            border-color: #1459DD;
            color: #1459DD;
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .category-btn.active {
            background: #1459DD;
            color: #fff;
            border-color: #1459DD;
            box-shadow: 0 10px 15px -3px rgba(20, 89, 221, 0.3);
            transform: translateY(-2px);
        }

        .category-btn i {
            font-size: 14px;
        }

        /* ========== MAIN LAYOUT ========== */
        .main-section {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 16px;
        }

        .main-layout {
            display: flex;
            flex-direction: column;
            gap: 40px;
        }

        @media (min-width: 1024px) {
            .main-layout {
                flex-direction: row;
            }
        }

        /* ========== SIDEBAR FILTERS ========== */
        .sidebar {
            display: none;
            width: 340px;
            flex-shrink: 0;
        }

        @media (min-width: 1024px) {
            .sidebar {
                display: block;
                position: sticky;
                top: 0;
                height: 100vh;
                overflow-y: auto;
                align-self: flex-start;
                scrollbar-width: none;
                -ms-overflow-style: none;
            }

            .sidebar::-webkit-scrollbar {
                display: none;
            }
        }

        .filter-card {
            background: #FDD817;
            border-radius: 2.5rem;
            padding: 35px 25px;
            box-shadow: 0 25px 50px -12px rgba(253, 216, 23, 0.25);
            overflow: hidden;
            min-height: calc(100vh - 40px);
            margin: 20px 10px;
        }

        .filter-card::before {
            content: '';
            position: absolute;
            top: -40px;
            right: -40px;
            width: 160px;
            height: 160px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            filter: blur(48px);
        }

        .filter-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }

        .filter-header h2 {
            font-size: 3rem;
            font-weight: 900;
            color: #000;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .filter-content {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .filter-select {
            width: 100%;
            background: #fff;
            border: none;
            border-radius: 1.5rem;
            padding: 18px 20px;
            font-size: 13px;
            font-weight: 700;
            color: #000;
            cursor: pointer;
            appearance: none;
            box-shadow: none;
        }

        .filter-label {
            display: block;
            font-size: 11px;
            font-weight: 900;
            color: #000;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 10px;
            margin-left: 0;
        }

        .energy-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .energy-btn {
            padding: 14px 28px;
            background: #fff;
            border: 2px solid transparent;
            border-radius: 9999px;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: none;
            color: #000;
        }

        .energy-btn:hover,
        .energy-btn.active {
            border-color: #000;
            background: #fff;
        }

        .slider-card {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(8px);
            padding: 28px 24px;
            border-radius: 2rem;
            border: none;
        }

        .slider-group {
            margin-bottom: 32px;
        }

        .slider-group:last-child {
            margin-bottom: 0;
        }

        .slider-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .slider-header label {
            font-size: 11px;
            font-weight: 900;
            color: #000;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .slider-header span {
            font-size: 15px;
            font-weight: 900;
            color: #1459DD;
        }

        input[type="range"] {
            width: 100%;
            height: 8px;
            background: rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            appearance: none;
            cursor: pointer;
        }

        input[type="range"]::-webkit-slider-thumb {
            appearance: none;
            width: 24px;
            height: 24px;
            background: #1459DD;
            border: 4px solid #fff;
            border-radius: 50%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }

        .search-btn {
            width: 100%;
            padding: 20px;
            background: #000;
            color: #fff;
            border: none;
            border-radius: 2rem;
            font-size: 11px;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: none;
        }

        .search-btn:hover {
            background: #1459DD;
        }

        .search-btn:active {
            transform: scale(0.95);
        }

        /* ========== PAGINATION ========== */
        .pagination-wrapper {
            margin-top: 60px;
            display: flex;
            justify-content: center;
        }

        .pagination {
            display: flex;
            align-items: center;
            gap: 12px;
            list-style: none;
        }

        .pagination li a,
        .pagination li span {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: #fff;
            color: #000 !important;
            font-size: 16px;
            font-weight: 800;
            text-decoration: none;
            transition: all 0.3s;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }

        .pagination li.active span {
            background: #1459DD !important;
            color: #fff !important;
            box-shadow: 0 10px 25px -5px rgba(20, 89, 221, 0.4);
            border-color: #1459DD !important;
            transform: none !important;
            cursor: default;
        }

        .pagination li.active span:hover {
            transform: none !important;
            background: #1459DD !important;
            color: #fff !important;
            box-shadow: 0 10px 25px -5px rgba(20, 89, 221, 0.4) !important;
        }

        .pagination li a:hover {
            background: #1459DD !important;
            color: #fff !important;
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .pagination li.disabled span {
            opacity: 0.5;
            cursor: not-allowed;
            background: #fff;

            color: #cbd5e1;
            box-shadow: none;
        }

        .pagination li.disabled span:hover {
            background: #fff !important;
            color: #cbd5e1 !important;
            transform: none !important;
            box-shadow: none !important;
        }

        /* ========== VEHICLE GRID ========== */
        .listing-section {
            flex: 1;
        }

        .results-bar {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 12px;
            margin-bottom: 40px;
        }

        .results-count {
            font-size: 10px;
            font-weight: 900;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        .active-filter {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            background: #1459DD;
            color: #fff;
            border-radius: 9999px;
            font-size: 9px;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }

        .active-filter a {
            color: #fff;
            text-decoration: none;
            cursor: pointer;
        }

        .vehicle-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 32px;
        }

        @media (min-width: 768px) {
            .vehicle-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        /* ========== VEHICLE CARD ========== */
        .vehicle-card {
            background: #fff;
            border-radius: 2.5rem;
            overflow: hidden;
            border: 1px solid #e2e8f0;
            display: flex;
            flex-direction: column;
            height: 100%;
            cursor: pointer;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            text-decoration: none;
        }

        .vehicle-card:hover {
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
        }

        .card-image {
            position: relative;
            aspect-ratio: 16 / 11;
            overflow: hidden;
        }

        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.7s;
        }

        .vehicle-card:hover .card-image img {
            transform: scale(1.1);
        }

        .status-badge {
            position: absolute;
            top: 24px;
            left: 24px;
            padding: 8px 16px;
            border-radius: 9999px;
            font-size: 10px;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: #fff;
            backdrop-filter: blur(8px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.2);
        }

        .status-badge.disponible {
            background: rgba(34, 197, 94, 0.9);
        }

        .status-badge.reserve {
            background: rgba(249, 115, 22, 0.9);
        }

        .status-badge.vendu {
            background: rgba(239, 68, 68, 0.9);
        }

        .client-badge {
            position: absolute;
            top: 24px;
            right: 24px;
            padding: 4px 12px;
            border-radius: 8px;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            color: #fff;
        }

        .client-badge.pro {
            background: #1459DD;
        }

        .client-badge.particulier {
            background: #1e293b;
        }

        .price-overlay {
            position: absolute;
            bottom: 24px;
            left: 24px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(8px);
            padding: 16px 20px;
            border-radius: 1rem;
            border: 1px solid #f1f5f9;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
        }

        .price-overlay span {
            font-size: 1.5rem;
            font-weight: 900;
            color: #1459DD;
            letter-spacing: -0.05em;
            line-height: 1;
        }

        .card-info {
            padding: 32px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .card-info-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 24px;
        }

        .card-info-header h3 {
            font-size: 1.5rem;
            font-weight: 900;
            color: #0f172a;
            text-transform: uppercase;
            letter-spacing: -0.05em;
            line-height: 1;
            transition: color 0.3s;
        }

        .vehicle-card:hover .card-info-header h3 {
            color: #1459DD;
        }

        .card-info-header svg {
            color: #1459DD;
            flex-shrink: 0;
        }

        .specs-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px 32px;
            margin-bottom: 32px;
        }

        .spec-item {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #94a3b8;
        }

        .spec-item i {
            color: #1459DD;
            font-size: 14px;
        }

        .spec-item span {
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: -0.01em;
            color: #475569;
        }

        .monthly-box {
            margin-top: auto;
            padding: 24px;
            background: #1459DD;
            border-radius: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 10px 25px -5px rgba(20, 89, 221, 0.3);
            transition: transform 0.3s;
        }

        .vehicle-card:hover .monthly-box {
            transform: scale(1.02);
        }

        .monthly-label {
            font-size: 9px;
            font-weight: 900;
            color: rgba(255, 255, 255, 0.7);
            text-transform: uppercase;
            letter-spacing: 0.1em;
            margin-bottom: 4px;
        }

        .monthly-value {
            font-size: 1.5rem;
            font-weight: 900;
            color: #fff;
        }

        .monthly-value small {
            font-size: 12px;
            font-weight: 900;
            color: #FDD817;
        }

        .monthly-arrow {
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }

        /* ========== BANNER ========== */
        .banner-card {
            grid-column: 1 / -1;
            background: #0A1120;
            border-radius: 3rem;
            padding: 32px;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            margin: 32px 0;
        }

        @media (min-width: 768px) {
            .banner-card {
                padding: 48px;
            }
        }

        .banner-card img {
            width: 100%;
            height: 256px;
            object-fit: cover;
            border-radius: 1rem;
        }

        /* ========== MOBILE FILTER BUTTON ========== */
        .mobile-filter-trigger {
            display: block;
            position: fixed;
            bottom: 24px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 60;
            width: 90%;
            max-width: 400px;
        }

        @media (min-width: 1024px) {
            .mobile-filter-trigger {
                display: none;
            }
        }

        .mobile-filter-btn {
            width: 100%;
            height: 64px;
            background: #0f172a;
            color: #fff;
            border: none;
            border-radius: 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
            font-size: 12px;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            cursor: pointer;
            box-shadow: 0 25px 50px -12px rgba(15, 23, 42, 0.4);
            transition: transform 0.2s;
        }

        .mobile-filter-btn:active {
            transform: scale(0.95);
        }

        .mobile-filter-btn svg {
            color: #FDD817;
        }

        /* ========== MOBILE DRAWER ========== */
        .mobile-drawer {
            position: fixed;
            inset: 0;
            z-index: 100;
            background: #fff;
            transform: translateY(100%);
            transition: transform 0.5s ease-in-out;
        }

        .mobile-drawer.open {
            transform: translateY(0);
        }

        @media (min-width: 1024px) {
            .mobile-drawer {
                display: none;
            }
        }

        .drawer-container {
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .drawer-header {
            background: #FDD817;
            padding: 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .drawer-header h2 {
            font-size: 1.5rem;
            font-weight: 900;
            color: #0f172a;
            text-transform: uppercase;
            letter-spacing: -0.05em;
        }

        .drawer-close {
            width: 48px;
            height: 48px;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #0f172a;
            cursor: pointer;
        }

        .drawer-content {
            flex: 1;
            overflow-y: auto;
            padding: 32px;
            background: #f8fafc;
            display: flex;
            flex-direction: column;
            gap: 32px;
        }

        /* ========== EMPTY STATE ========== */
        .empty-state {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 0;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            font-weight: 700;
            color: #64748b;
        }
    </style>

    <div class="purchase-page">
        <!-- Breadcrumb -->
        <div class="breadcrumb-bar">
            <div class="container">
                <nav class="breadcrumb-nav">
                    <a href="/">Accueil</a>
                    <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="2">
                        <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                    <span class="current">Catalogue</span>
                </nav>
            </div>
        </div>

        <!-- Hero -->
        <div class="hero-section">
            <div class="hero-content">
                <div>
                    <div class="hero-update">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2">
                            <circle cx="12" cy="12" r="10" />
                            <polyline points="12 6 12 12 16 14" />
                        </svg>
                        <span>Mis à jour il y a 5 min</span>
                    </div>
                    <h1 class="hero-title">
                        Trouvez votre <br>
                        <span class="primary">VOITURE</span> <span class="secondary">IDÉALE</span>
                    </h1>
                </div>
                <div class="experts-section">
                    <div class="avatars">
                        <img src="https://i.pravatar.cc/100?img=11" alt="Expert">
                        <img src="https://i.pravatar.cc/100?img=12" alt="Expert">
                        <img src="https://i.pravatar.cc/100?img=13" alt="Expert">
                    </div>
                    <p class="experts-text">+150 experts en ligne</p>
                </div>
            </div>
        </div>

        <!-- Categories -->
        <div class="categories-section">
            <div class="categories-grid">
                <button class="category-btn {{ !request('category') || request('category') == 'Toutes' ? 'active' : '' }}" data-category="Toutes">
                    <i class="fas fa-list"></i> TOUTES
                </button>
                <button class="category-btn {{ request('category') == 'Micro Citadine' ? 'active' : '' }}" data-category="Micro Citadine">
                    <i class="fas fa-car"></i> MICRO CITADINE
                </button>
                <button class="category-btn {{ request('category') == 'Citadine' ? 'active' : '' }}" data-category="Citadine">
                    <i class="fas fa-car-side"></i> CITADINE
                </button>
                <button class="category-btn {{ request('category') == 'Compacte' ? 'active' : '' }}" data-category="Compacte">
                    <i class="fas fa-expand"></i> COMPACTE
                </button>
                <button class="category-btn {{ request('category') == 'Familiale' ? 'active' : '' }}" data-category="Familiale">
                    <i class="fas fa-users"></i> FAMILIALE
                </button>
                <button class="category-btn {{ request('category') == 'Monospace Break' ? 'active' : '' }}" data-category="Monospace Break">
                    <i class="fas fa-shuttle-van"></i> MONOSPACE / BREAK
                </button>
                <button class="category-btn {{ request('category') == 'Routière' ? 'active' : '' }}" data-category="Routière">
                    <i class="fas fa-road"></i> ROUTIÈRE
                </button>
                <button class="category-btn {{ request('category') == 'Luxe Prestige' ? 'active' : '' }}" data-category="Luxe Prestige">
                    <i class="fas fa-gem"></i> LUXE / PRESTIGE
                </button>
                <button class="category-btn {{ request('category') == 'SUV' ? 'active' : '' }}" data-category="SUV">
                    <i class="fas fa-mountain"></i> 4X4 / SUV / CROSSOVER
                </button>
                <button class="category-btn {{ request('category') == 'Coupé Sportive' ? 'active' : '' }}" data-category="Coupé Sportive">
                    <i class="fas fa-flag-checkered"></i> COUPÉ / SPORTIVE
                </button>
                <button class="category-btn {{ request('category') == 'Cabriolet Roadster' ? 'active' : '' }}" data-category="Cabriolet Roadster">
                    <i class="fas fa-wind"></i> CABRIOLET / ROADSTER
                </button>
                <button class="category-btn {{ request('category') == 'Utilitaire' ? 'active' : '' }}" data-category="Utilitaire">
                    <i class="fas fa-tools"></i> UTILITAIRE
                </button>
            </div>
        </div>

        <div class="main-section">
            <div class="main-layout">
                <!-- Sidebar -->
                <aside class="sidebar">
                    <form action="{{ route('achat.index') }}" method="GET" class="filter-form">
                        <div class="filter-card">
                            <div class="filter-header">
                                <h2>Affiner</h2>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <line x1="4" y1="21" x2="4" y2="14"></line>
                                    <line x1="4" y1="10" x2="4" y2="3"></line>
                                    <line x1="12" y1="21" x2="12" y2="12"></line>
                                    <line x1="12" y1="8" x2="12" y2="3"></line>
                                    <line x1="20" y1="21" x2="20" y2="16"></line>
                                    <line x1="20" y1="12" x2="20" y2="3"></line>
                                </svg>
                            </div>
                            <div class="filter-content">
                                <select name="marque" id="marque" class="filter-select nado-marks">
                                    <option value="">Toutes les marques</option>
                                    @foreach ($brands as $brand)
                                        <option value="{{ $brand->name }}" data-id="{{ $brand->id }}"
                                            {{ request('marque') == $brand->name || (!request('marque') && $loop->first) ? 'selected' : '' }}>
                                            {{ $brand->name }}
                                        </option>
                                    @endforeach
                                </select>

                                <select name="modele" id="modele" class="filter-select nado-models">
                                    <option value="">Tous les modèles</option>
                                </select>

                                <div>
                                    <label class="filter-label">Année</label>
                                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                                        <select name="annee_min" class="filter-select">
                                            <option value="">Min</option>
                                            @for ($i = date('Y'); $i >= 1992; $i--)
                                                <option value="{{ $i }}"
                                                    {{ request('annee_min') == $i ? 'selected' : '' }}>{{ $i }}
                                                </option>
                                            @endfor
                                        </select>
                                        <select name="annee_max" class="filter-select">
                                            <option value="">Max</option>
                                            @for ($i = date('Y'); $i >= 1992; $i--)
                                                <option value="{{ $i }}"
                                                    {{ request('annee_max') == $i ? 'selected' : '' }}>{{ $i }}
                                                </option>
                                            @endfor
                                        </select>
                                    </div>
                                </div>

                                <div>
                                    <label class="filter-label">Énergie</label>
                                    <div class="energy-buttons">
                                        @foreach (['Diesel', 'Essence', 'Électrique', 'Hybride'] as $fuel)
                                            <button type="button"
                                                class="energy-btn {{ request('carburant') == $fuel ? 'active' : '' }}"
                                                data-fuel="{{ $fuel }}">{{ $fuel }}</button>
                                        @endforeach
                                    </div>
                                    <input type="hidden" name="carburant" id="carburantInput"
                                        value="{{ request('carburant') }}">
                                </div>

                                <div>
                                    <label class="filter-label">Transmission</label>
                                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                                        @foreach (['Manuelle', 'Automatique'] as $trans)
                                            <button type="button"
                                                class="energy-btn {{ request('transmission') == $trans ? 'active' : '' }}"
                                                data-trans="{{ $trans }}"
                                                style="padding: 16px 10px;">{{ strtoupper($trans) }}</button>
                                        @endforeach
                                    </div>
                                    <input type="hidden" name="transmission" id="transmissionInput"
                                        value="{{ request('transmission') }}">
                                </div>

                                <div class="slider-card">
                                    <div class="slider-group">
                                        <div class="slider-header">
                                            <label>Prix Max</label>
                                            <span
                                                id="priceDisplay">{{ number_format(request('prix', 800000), 0, ',', ' ') }}
                                                MAD</span>
                                        </div>
                                        <input type="range" name="prix" id="priceRange" min="0"
                                            max="5000000" step="10000" value="{{ request('prix', 800000) }}">
                                    </div>
                                    <div class="slider-group">
                                        <div class="slider-header">
                                            <label>Km Max</label>
                                            <span id="kmDisplay">{{ number_format(request('km', 100000), 0, ',', ' ') }}
                                                KM</span>
                                        </div>
                                        <input type="range" name="km" id="kmRange" min="0"
                                            max="500000" step="5000" value="{{ request('km', 100000) }}">
                                    </div>
                                </div>

                                <button type="submit" class="search-btn">Lancer la recherche</button>
                            </div>
                        </div>
                    </form>
                </aside>

                <!-- Vehicle Listing -->
                <div class="listing-section">
                    <div class="results-bar">
                        <span class="results-count">Résultats: {{ count($ads) }} véhicules</span>
                        @if (request('marque'))
                            <span class="active-filter">{{ request('marque') }} <a
                                    href="{{ route('achat.index') }}">&times;</a></span>
                        @endif
                    </div>

                    <div class="vehicle-grid">
                        @forelse ($ads as $index => $ad)
                            <a href="{{ route('achat.detail', ['marque' => str_replace(' ', '', $ad->mark), 'modele' => str_replace(' ', '', $ad->modele), 'id' => $ad->id]) }}"
                                class="vehicle-card">
                                <div class="card-image">
                                    <img src="{{ !empty($ad->images) && isset($ad->images[0]) ? asset('storage/ads/' . $ad->images[0]) : asset('storage/ads/default.jpg') }}"
                                        alt="Annonce">

                                    @if ($ad->status == 'disponible')
                                        <span class="status-badge disponible">DISPONIBLE</span>
                                    @elseif($ad->status == 'réserve')
                                        <span class="status-badge reserve">RÉSERVÉ</span>
                                    @elseif($ad->status == 'vendu')
                                        <span class="status-badge vendu">VENDU</span>
                                    @endif

                                    @if ($ad->client)
                                        <span
                                            class="client-badge {{ $ad->client->type }}">{{ strtoupper($ad->client->type) }}</span>
                                    @endif

                                    <div class="price-overlay">
                                        <span>{{ number_format($ad->price, 0, ',', ' ') }} MAD</span>
                                    </div>
                                </div>
                                <div class="card-info">
                                    <div class="card-info-header">
                                        <h3>{{ $ad->brand ? $ad->brand->name : '' }}
                                            {{ $ad->modeleRelation ? $ad->modeleRelation->name : '' }}</h3>
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="2">
                                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
                                        </svg>
                                    </div>
                                    <div class="specs-grid">
                                        <div class="spec-item">
                                            <i class="fas fa-calendar-alt"></i>
                                            <span>{{ $ad->year }}</span>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-road"></i>
                                            <span>{{ number_format($ad->km, 0, ',', ' ') }} km</span>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-cogs"></i>
                                            <span>{{ $ad->boite_vitesse ?? 'Auto' }}</span>
                                        </div>
                                        <div class="spec-item">
                                            <i class="fas fa-gas-pump"></i>
                                            <span>{{ $ad->carburant }}</span>
                                        </div>
                                    </div>
                                    <div class="monthly-box">
                                        <div>
                                            <div class="monthly-label">VOTRE MENSUALITÉ À PARTIR DE</div>
                                            <div class="monthly-value">{{ number_format($ad->price / 84, 0, ',', ' ') }}
                                                <small>MAD / MOIS</small>
                                            </div>
                                        </div>
                                        <div class="monthly-arrow">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="2">
                                                <line x1="5" y1="12" x2="19" y2="12">
                                                </line>
                                                <polyline points="12 5 19 12 12 19"></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </a>

                            @if ($index + 1 === 6 && $firstBanner)
                                <div class="banner-card">
                                    <img src="{{ asset('storage/' . $firstBanner->image) }}" alt="Publicité">
                                </div>
                            @endif

                            @if ($index + 1 === 12 && $secondBanner)
                                <div class="banner-card">
                                    <img src="{{ asset('storage/' . $secondBanner->image) }}" alt="Publicité">
                                </div>
                            @endif

                            @if ($index + 1 === 18 && $thirdBanner)
                                <div class="banner-card">
                                    <img src="{{ asset('storage/' . $thirdBanner->image) }}" alt="Publicité">
                                </div>
                            @endif
                        @empty
                            <div class="empty-state">
                                <h3>Aucun véhicule trouvé</h3>
                            </div>
                        @endforelse
                    </div>

                    <!-- Pagination -->
                    @if ($ads->hasPages())
                        <div class="pagination-wrapper">
                            <ul class="pagination">
                                {{-- Previous Page Link --}}
                                @if ($ads->onFirstPage())
                                    <li class="disabled"><span>&lsaquo;</span></li>
                                @else
                                    <li><a href="{{ $ads->previousPageUrl() }}" rel="prev">&lsaquo;</a></li>
                                @endif

                                {{-- Pagination Elements --}}
                                @foreach ($ads->getUrlRange(max(1, $ads->currentPage() - 2), min($ads->lastPage(), $ads->currentPage() + 2)) as $page => $url)
                                    @if ($page == $ads->currentPage())
                                        <li class="active"><span>{{ $page }}</span></li>
                                    @else
                                        <li><a href="{{ $url }}">{{ $page }}</a></li>
                                    @endif
                                @endforeach

                                {{-- Next Page Link --}}
                                @if ($ads->hasMorePages())
                                    <li><a href="{{ $ads->nextPageUrl() }}" rel="next">&rsaquo;</a></li>
                                @else
                                    <li class="disabled"><span>&rsaquo;</span></li>
                                @endif
                            </ul>
                        </div>
                    @endif
                </div>
            </div>
        </div>

        <!-- Mobile Filter Button -->
        <div class="mobile-filter-trigger">
            <button id="openMobileFilter" class="mobile-filter-btn">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2">
                    <line x1="4" y1="21" x2="4" y2="14"></line>
                    <line x1="4" y1="10" x2="4" y2="3"></line>
                    <line x1="12" y1="21" x2="12" y2="12"></line>
                    <line x1="12" y1="8" x2="12" y2="3"></line>
                    <line x1="20" y1="21" x2="20" y2="16"></line>
                    <line x1="20" y1="12" x2="20" y2="3"></line>
                </svg>
                Filtrer ma recherche
            </button>
        </div>

        <!-- Mobile Drawer -->
        <div id="mobileDrawer" class="mobile-drawer">
            <div class="drawer-container">
                <div class="drawer-header">
                    <h2>Filtres</h2>
                    <button id="closeMobileFilter" class="drawer-close">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </button>
                </div>
                <div class="drawer-content">
                    <form action="{{ route('achat.index') }}" method="GET">
                        <select name="marque" class="filter-select nado-marks" style="margin-bottom: 24px;">
                            <option value="">Toutes les marques</option>
                            @foreach ($brands as $brand)
                                <option value="{{ $brand->name }}" data-id="{{ $brand->id }}"
                                    {{ request('marque') == $brand->name ? 'selected' : '' }}>{{ $brand->name }}</option>
                            @endforeach
                        </select>
                        <select name="modele" class="filter-select nado-models" style="margin-bottom: 24px;">
                            <option value="">Tous les modèles</option>
                        </select>
                        <select name="annee" class="filter-select" style="margin-bottom: 24px;">
                            <option value="">Année</option>
                            @for ($i = date('Y'); $i >= 1992; $i--)
                                <option value="{{ $i }}" {{ request('annee') == $i ? 'selected' : '' }}>
                                    {{ $i }}</option>
                            @endfor
                        </select>
                        <button type="submit" class="search-btn">Lancer la recherche</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // ========== RANGE SLIDERS ==========
            var priceRange = document.getElementById('priceRange');
            var priceDisplay = document.getElementById('priceDisplay');
            var kmRange = document.getElementById('kmRange');
            var kmDisplay = document.getElementById('kmDisplay');

            if (priceRange && priceDisplay) {
                priceRange.addEventListener('input', function() {
                    priceDisplay.textContent = parseInt(this.value).toLocaleString('fr-FR') + ' MAD';
                });
            }

            if (kmRange && kmDisplay) {
                kmRange.addEventListener('input', function() {
                    kmDisplay.textContent = parseInt(this.value).toLocaleString('fr-FR') + ' KM';
                });
            }

            // ========== ENERGY BUTTONS ==========
            var energyBtns = document.querySelectorAll('.energy-btn');
            var carburantInput = document.getElementById('carburantInput');

            energyBtns.forEach(function(btn) {
                btn.addEventListener('click', function() {
                    // Only toggle energy buttons, not transmission
                    if (this.dataset.fuel) {
                        document.querySelectorAll('[data-fuel]').forEach(function(b) {
                            b.classList.remove('active');
                        });
                        this.classList.add('active');
                        if (carburantInput) {
                            carburantInput.value = this.dataset.fuel;
                        }
                    }
                });
            });

            // ========== TRANSMISSION BUTTONS ==========
            var transmissionBtns = document.querySelectorAll('[data-trans]');
            var transmissionInput = document.getElementById('transmissionInput');

            transmissionBtns.forEach(function(btn) {
                btn.addEventListener('click', function() {
                    transmissionBtns.forEach(function(b) {
                        b.classList.remove('active');
                    });
                    this.classList.add('active');
                    if (transmissionInput) {
                        transmissionInput.value = this.dataset.trans;
                    }
                });
            });

            // ========== CATEGORY BUTTONS ==========
            var categoryBtns = document.querySelectorAll('.category-btn');

            categoryBtns.forEach(function(btn) {
                btn.addEventListener('click', function() {
                    categoryBtns.forEach(function(b) {
                        b.classList.remove('active');
                    });
                    this.classList.add('active');

                    var category = this.dataset.category;
                    var url = new URL(window.location.href);
                    if (category === 'Toutes') {
                        url.searchParams.delete('category');
                    } else {
                        url.searchParams.set('category', category);
                    }
                    window.location.href = url.toString();
                });
            });

            // ========== MOBILE DRAWER ==========
            var openBtn = document.getElementById('openMobileFilter');
            var closeBtn = document.getElementById('closeMobileFilter');
            var drawer = document.getElementById('mobileDrawer');

            if (openBtn && drawer) {
                openBtn.addEventListener('click', function() {
                    drawer.classList.add('open');
                    document.body.style.overflow = 'hidden';
                });
            }

            if (closeBtn && drawer) {
                closeBtn.addEventListener('click', function() {
                    drawer.classList.remove('open');
                    document.body.style.overflow = '';
                });
            }

            // ========== LOAD MODELS ON BRAND CHANGE ==========
            var brandSelects = document.querySelectorAll('select.nado-marks');

            function loadModels(brandId, modelSelect) {
                if (!brandId) {
                    modelSelect.innerHTML = '<option value="">Tous les modèles</option>';
                    return;
                }
                modelSelect.innerHTML = '<option value="">Chargement...</option>';

                fetch('/client/models-by-brand/' + brandId)
                    .then(function(response) {
                        return response.json();
                    })
                    .then(function(data) {
                        modelSelect.innerHTML = '<option value="">Tous les modèles</option>';
                        data.forEach(function(model) {
                            var option = document.createElement('option');
                            option.value = model.name;
                            option.textContent = model.name;
                            var urlParams = new URLSearchParams(window.location.search);
                            if (urlParams.get('modele') === model.name) {
                                option.selected = true;
                            }
                            modelSelect.appendChild(option);
                        });
                    })
                    .catch(function() {
                        modelSelect.innerHTML = '<option value="">Erreur</option>';
                    });
            }

            brandSelects.forEach(function(brandSelect) {
                brandSelect.addEventListener('change', function() {
                    var selectedOption = this.options[this.selectedIndex];
                    var brandId = selectedOption.getAttribute('data-id');
                    var form = this.closest('form');
                    var modelSelect = form ? form.querySelector('select.nado-models') : null;
                    if (modelSelect) {
                        loadModels(brandId, modelSelect);
                    }
                });

                // Load models on page load if brand is pre-selected
                if (brandSelect.value) {
                    var selectedOption = brandSelect.options[brandSelect.selectedIndex];
                    var brandId = selectedOption.getAttribute('data-id');
                    var form = brandSelect.closest('form');
                    var modelSelect = form ? form.querySelector('select.nado-models') : null;
                    if (modelSelect) {
                        loadModels(brandId, modelSelect);
                    }
                }
            });
        });
    </script>
@endsection
