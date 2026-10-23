<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        {{ $annonce->titre ?? ($annonce->brand->name ?? 'Marque') . ' ' . ($annonce->modeleRelation->name ?? 'Modèle') }}
        | Nado.ma
    </title>

    {{-- Open Graph Meta Tags --}}
    <meta property="og:title" content="{{ $annonce->titre ?? $annonce->mark . ' ' . $annonce->modele }}">
    <meta property="og:description" content="{{ Str::limit(strip_tags($annonce->description), 120) }}">
    <meta property="og:image" content="{{ asset('storage/ads/' . ($annonce->images[0] ?? 'default.jpg')) }}">
    <meta property="og:url" content="{{ request()->fullUrl() }}">
    <meta property="og:type" content="website">

    {{-- Fonts & Icons --}}
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    {{-- SweetAlert2 --}}
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<style>
    :root {
        --bg-light: #f8fafc;
        --blue-primary: #1459DD;
        --slate-900: #0f172a;
        --active-color: #1459DD;
        --slate-700: #334155;
        --slate-500: #64748b;
        --slate-200: #e2e8f0;
        --slate-100: #f1f5f9;
        --slate-50: #f8fafc;
    }

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Inter', sans-serif;
        background-color: var(--bg-light);
        color: var(--slate-900);
    }

    .container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    /* Top Bar */
    .top-bar {
        background-color: #FDD817;
        color: var(--slate-900);
        padding: 0.625rem 1rem;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }

    .top-bar-inner {
        max-width: 1280px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .top-bar-contact {
        display: flex;
        align-items: center;
        gap: 1.5rem;
    }

    .top-bar-item {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        font-size: 10px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        opacity: 0.8;
    }

    .top-bar-item a {
        color: inherit;
        text-decoration: none;
        transition: color 0.2s;
    }

    .top-bar-item a:hover {
        color: var(--blue-primary);
    }

    .top-bar-item i {
        color: var(--blue-primary);
        font-size: 12px;
    }

    .top-bar-social {
        display: flex;
        align-items: center;
        gap: 1.25rem;
    }

    .top-bar-social a {
        color: var(--slate-900);
        opacity: 0.6;
        transition: all 0.2s;
        font-size: 1rem;
    }

    .top-bar-social a:hover {
        color: var(--blue-primary);
        opacity: 1;
    }

    @media (max-width: 640px) {
        .top-bar-item.hide-mobile {
            display: none;
        }
    }

    /* Header / Main Nav */
    .header {
        background-color: white;
        border-bottom: 1px solid var(--slate-200);
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        position: sticky;
        top: 0;
        z-index: 50;
    }

    .header-inner {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 1rem;
        height: 5rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .header-left {
        display: flex;
        align-items: center;
        gap: 2.5rem;
    }

    .logo-link {
        display: flex;
        align-items: center;
        text-decoration: none;
        transition: transform 0.2s;
    }

    .logo-link:hover {
        transform: scale(1.05);
    }

    .logo-text {
        font-size: 1.5rem;
        font-weight: 900;
        letter-spacing: -0.05em;
        text-transform: uppercase;
    }

    .logo-text .blue {
        color: var(--blue-primary);
    }

    .logo-text .yellow {
        color: #FDD817;
    }

    .logo-link img {
        height: 40px;
    }

    /* Desktop Navigation */
    .nav-menu {
        display: none;
        align-items: center;
        gap: 0.75rem;
    }

    @media (min-width: 1024px) {
        .nav-menu {
            display: flex;
        }
    }

    .nav-menu a {
        text-decoration: none;
        font-size: 11px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: -0.02em;
        color: var(--slate-600);
        padding: 0.5rem 1rem;
        border-radius: 0.75rem;
        transition: all 0.2s;
        white-space: nowrap;
    }

    .nav-menu a:hover {
        color: var(--blue-primary);
        background: var(--slate-50);
    }

    .nav-menu a.highlighted {
        color: var(--blue-primary);
        background: #eff6ff;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
    }

    .header-right {
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .connect-btn {
        display: none;
        align-items: center;
        gap: 0.5rem;
        padding: 0.75rem 1.5rem;
        background: var(--blue-primary);
        color: white;
        border-radius: 0.75rem;
        text-decoration: none;
        font-size: 10px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        transition: all 0.2s;
        box-shadow: 0 10px 15px -3px rgba(20, 89, 221, 0.1);
    }

    .connect-btn:hover {
        background: #0f4ac4;
    }

    .connect-btn:active {
        transform: scale(0.95);
    }

    @media (min-width: 640px) {
        .connect-btn {
            display: flex;
        }
    }

    .nav-toggle {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0.75rem;
        background: var(--slate-50);
        border: none;
        border-radius: 0.75rem;
        color: var(--slate-900);
        cursor: pointer;
        transition: background 0.2s;
    }

    .nav-toggle:hover {
        background: var(--slate-100);
    }

    .nav-toggle i {
        font-size: 1.5rem;
    }

    @media (min-width: 1024px) {
        .nav-toggle {
            display: none;
        }
    }

    /* Mobile Drawer */
    .mobile-drawer-overlay {
        position: fixed;
        inset: 0;
        z-index: 100;
        visibility: hidden;
        transition: visibility 0.5s;
    }

    .mobile-drawer-overlay.open {
        visibility: visible;
    }

    .mobile-drawer-backdrop {
        position: absolute;
        inset: 0;
        background: rgba(15, 23, 42, 0.4);
        backdrop-filter: blur(8px);
        opacity: 0;
        transition: opacity 0.5s;
    }

    .mobile-drawer-overlay.open .mobile-drawer-backdrop {
        opacity: 1;
    }

    .mobile-drawer {
        position: absolute;
        top: 0;
        right: 0;
        height: 100%;
        width: 85%;
        max-width: 420px;
        background: white;
        box-shadow: -10px 0 40px rgba(0, 0, 0, 0.15);
        transform: translateX(100%);
        transition: transform 0.5s ease;
        display: flex;
        flex-direction: column;
    }

    .mobile-drawer-overlay.open .mobile-drawer {
        transform: translateX(0);
    }

    .drawer-header {
        padding: 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .drawer-close {
        padding: 0.5rem;
        background: none;
        border: none;
        color: var(--slate-400);
        cursor: pointer;
        transition: color 0.2s;
        font-size: 2rem;
    }

    .drawer-close:hover {
        color: var(--slate-900);
    }

    .drawer-nav {
        flex: 1;
        overflow-y: auto;
        padding: 1rem 2rem;
        display: flex;
        flex-direction: column;
        gap: 1.5rem;
    }

    .drawer-nav a {
        text-decoration: none;
        font-size: 1.125rem;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: -0.02em;
        color: var(--slate-800);
        transition: color 0.2s;
    }

    .drawer-nav a:hover,
    .drawer-nav a.highlighted {
        color: var(--blue-primary);
    }

    .drawer-footer {
        padding: 2.5rem;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .drawer-cta {
        width: 100%;
        padding: 1.5rem;
        background: #FDD817;
        color: var(--slate-900);
        border: none;
        border-radius: 2rem;
        font-size: 0.875rem;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: 0.2em;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        text-decoration: none;
        box-shadow: 0 20px 40px -10px rgba(253, 216, 23, 0.4);
        margin-bottom: 3rem;
        transition: transform 0.2s;
    }

    .drawer-cta:active {
        transform: scale(0.95);
    }

    .drawer-social {
        display: flex;
        justify-content: center;
        gap: 2.5rem;
        margin-bottom: 3rem;
    }

    .drawer-social a {
        color: var(--slate-400);
        font-size: 1.25rem;
        transition: color 0.2s;
    }

    .drawer-social a:hover {
        color: var(--slate-900);
    }

    .drawer-divider {
        width: 100%;
        height: 1px;
        background: var(--slate-100);
        margin-bottom: 2.5rem;
    }

    .drawer-support {
        text-align: center;
    }

    .drawer-support-label {
        font-size: 11px;
        font-weight: 800;
        color: var(--slate-400);
        text-transform: uppercase;
        letter-spacing: 0.3em;
        margin-bottom: 0.75rem;
    }

    .drawer-support-phone {
        font-size: 1.25rem;
        font-weight: 900;
        color: var(--slate-900);
        text-decoration: none;
        transition: color 0.2s;
    }

    .drawer-support-phone:hover {
        color: var(--blue-primary);
    }

    @media (min-width: 1024px) {
        .mobile-drawer-overlay {
            display: none;
        }
    }

    /* Layout */
    .main-content {
        padding: 6rem 1rem 3rem;
    }

    .layout-grid {
        display: flex;
        flex-direction: column;
        gap: 3rem;
    }

    @media (min-width: 1024px) {
        .layout-grid {
            flex-direction: row;
        }
    }

    .content-column {
        flex: 1;
        min-width: 0;
    }

    /* Typography */
    .badge-row {
        display: flex;
        gap: 0.5rem;
        margin-bottom: 0.75rem;
        flex-wrap: wrap;
    }

    .badge {
        font-size: 10px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        padding: 0.125rem 0.5rem;
        border-radius: 4px;
    }

    .id-badge {
        background: var(--slate-100);
        color: var(--slate-600);
    }

    .certified-badge {
        background: #eff6ff;
        color: var(--blue-primary);
        border: 1px solid #dbeafe;
    }

    .main-title {
        font-size: clamp(2rem, 6vw, 3rem);
        font-weight: 900;
        text-transform: uppercase;
        line-height: 1;
        letter-spacing: -0.02em;
    }

    .text-blue {
        color: var(--blue-primary);
    }

    .specs-subtitle {
        margin-top: 1rem;
        font-size: 1.125rem;
        color: var(--slate-500);
        font-weight: 500;
    }

    /* Gallery */
    .gallery-section {
        margin-top: 2rem;
    }

    .main-image-container {
        position: relative;
        border-radius: 1.5rem;
        overflow: hidden;
        background: var(--slate-100);
    }

    .main-image-container img {
        width: 100%;
        height: auto;
        max-height: 500px;
        object-fit: contain;
        cursor: zoom-in;
        transition: transform 0.3s;
    }

    .main-image-container img:hover {
        transform: scale(1.02);
    }

    .gallery-nav-btn {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: white;
        border: none;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        cursor: pointer;
        font-size: 1rem;
        opacity: 0;
        transition: opacity 0.3s;
    }

    .main-image-container:hover .gallery-nav-btn {
        opacity: 1;
    }

    .image-counter {
        position: absolute;
        top: 1.5rem;
        right: 1.5rem;
        background: rgba(0, 0, 0, 0.5);
        backdrop-filter: blur(4px);
        color: white;
        padding: 0.375rem 1rem;
        border-radius: 99px;
        font-size: 10px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        z-index: 10;
        pointer-events: none;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }

    .gallery-nav-btn:hover {
        background: var(--blue-primary);
        color: white;
    }

    .gallery-nav-btn.prev {
        left: 1rem;
    }

    .gallery-nav-btn.next {
        right: 1rem;
    }

    .thumbnails {
        display: flex;
        gap: 0.5rem;
        margin-top: 1rem;
        flex-wrap: wrap;
    }

    .thumb {
        width: 193px;
        height: 120px;
        object-fit: cover;
        border-radius: 1rem;
        cursor: pointer;
        border: 2px solid transparent;
        transition: all 0.3s;
        filter: grayscale(100%);
    }

    @media (max-width: 768px) {
        .thumb {
            width: calc(25% - 0.38rem);
            height: auto;
            aspect-ratio: 1.6;
        }
    }

    .thumb:hover,
    .thumb.active {
        border-color: var(--blue-primary);
        filter: grayscale(0%);
    }

    .thumb-video {
        position: relative;
    }

    .thumb-video::after {
        content: '▶';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-size: 1rem;
        text-shadow: 0 0 4px rgba(0, 0, 0, 0.8);
    }

    /* About Section */
    .about-section {
        margin-top: 3rem;
    }

    .section-title {
        font-size: 1.25rem;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: -0.05em;
        display: flex;
        align-items: center;
        gap: 0.75rem;
        margin-bottom: 1.5rem;
    }

    .blue-line {
        width: 2.5rem;
        height: 4px;
        background-color: var(--blue-primary);
        border-radius: 99px;
    }

    .description-card {
        background: white;
        padding: 2rem;
        border-radius: 1.5rem;
        border: 1px solid var(--slate-200);
    }

    .description-text {
        font-size: 1rem;
        color: var(--slate-700);
        line-height: 1.7;
    }

    .tag-group {
        display: flex;
        flex-wrap: wrap;
        gap: 0.5rem;
        margin-top: 1.5rem;
    }

    .info-tag {
        padding: 0.4rem 1rem;
        background: var(--slate-50);
        border: 1px solid var(--slate-100);
        border-radius: 99px;
        font-size: 10px;
        font-weight: 800;
        color: var(--slate-500);
        text-transform: uppercase;
    }

    /* Tabs */
    .tabs-container {
        background: white;
        border-radius: 1.5rem;
        border: 1px solid var(--slate-200);
        overflow: hidden;
        margin-top: 2rem;
    }

    .tabs-header {
        display: flex;
        overflow-x: auto;
        border-bottom: 1px solid var(--slate-200);
    }

    .tabs-header::-webkit-scrollbar {
        display: none;
    }

    .tab-btn {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        padding: 1rem 1.25rem;
        font-size: 0.875rem;
        font-weight: 600;
        color: var(--slate-500);
        background: transparent;
        border: none;
        border-bottom: 2px solid transparent;
        cursor: pointer;
        white-space: nowrap;
        transition: all 0.2s;
    }

    .tab-btn i {
        font-size: 0.85rem;
    }

    .tab-btn.active {
        color: var(--blue-primary);
        border-bottom-color: var(--blue-primary);
    }

    .tabs-content {
        padding: 1.5rem;
    }

    .tab-pane {
        display: none;
    }

    .tab-pane.active {
        display: block;
    }

    .specs-grid {
        display: grid;
        grid-template-columns: 1fr;
        row-gap: 0;
    }

    .spec-item {
        display: flex;
        justify-content: space-between;
        padding: 0.5rem 0;
        border-bottom: 1px solid var(--slate-50);
        font-size: 0.875rem;
    }

    .spec-item span {
        color: var(--slate-500);
    }

    .spec-item strong {
        color: var(--blue-primary);
    }

    .equipment-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 0.75rem;
    }

    @media (min-width: 768px) {
        .equipment-grid {
            grid-template-columns: repeat(3, 1fr);
        }
    }

    .eq-item {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.6rem;
        background: var(--slate-50);
        border-radius: 0.5rem;
        font-size: 0.8rem;
    }

    .eq-item i {
        color: #16a34a;
    }

    .expertise-hero {
        background: #eff6ff;
        padding: 1.5rem;
        border-radius: 1rem;
        display: flex;
        gap: 1rem;
        margin-bottom: 1.5rem;
        align-items: center;
        flex-wrap: wrap;
    }

    .expertise-icon-box {
        background: var(--blue-primary);
        width: 48px;
        height: 48px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 0.75rem;
        font-size: 1.25rem;
        color: white;
    }

    .expertise-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 0.75rem;
    }

    @media (min-width: 768px) {
        .expertise-grid {
            grid-template-columns: repeat(4, 1fr);
        }
    }

    .status-card {
        text-align: center;
        padding: 1rem;
        border: 1px solid var(--slate-100);
        border-radius: 0.75rem;
        background: white;
    }

    .status-card span {
        font-size: 0.65rem;
        font-weight: 800;
        color: var(--slate-400);
        text-transform: uppercase;
    }

    .text-green {
        color: #16a34a;
    }

    .timeline {
        position: relative;
        padding-left: 2rem;
    }

    .timeline::before {
        content: '';
        position: absolute;
        left: 10px;
        top: 5px;
        bottom: 5px;
        width: 2px;
        background: var(--slate-200);
    }

    .timeline-item {
        position: relative;
        margin-bottom: 1.25rem;
        padding-left: 1rem;
    }

    .timeline-dot {
        position: absolute;
        left: -22px;
        top: 0;
        width: 20px;
        height: 20px;
        background: white;
        border: 2px solid var(--blue-primary);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .timeline-dot::after {
        content: '';
        width: 6px;
        height: 6px;
        background: var(--blue-primary);
        border-radius: 50%;
    }

    .warranty-card {
        text-align: center;
        padding: 2rem;
    }

    .shield-icon {
        font-size: 2.5rem;
        margin-bottom: 1rem;
    }

    .secondary-button {
        margin-top: 1rem;
        padding: 0.6rem 1.5rem;
        background: var(--blue-primary);
        color: white;
        border: none;
        border-radius: 0.5rem;
        font-weight: 700;
        cursor: pointer;
        font-size: 0.875rem;
    }

    /* Finance Simulator */
    .finance-card {
        background: white;
        border-radius: 1.5rem;
        border: 1px solid var(--slate-200);
        overflow: hidden;
        margin-top: 2rem;
    }

    .finance-header {
        padding: 1.5rem;
        border-bottom: 1px solid var(--slate-100);
    }

    .header-content {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .finance-icon {
        background: #eff6ff;
        width: 48px;
        height: 48px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 0.75rem;
        font-size: 1.25rem;
        color: var(--blue-primary);
    }

    .finance-title {
        font-size: 1.25rem;
        font-weight: 800;
        color: var(--slate-900);
    }

    .finance-subtitle {
        color: var(--slate-500);
        font-size: 0.8rem;
    }

    .finance-body {
        display: grid;
        grid-template-columns: 1fr;
    }

    @media (min-width: 1024px) {
        .finance-body {
            grid-template-columns: 1.2fr 0.8fr;
        }
    }

    .finance-inputs {
        padding: 1.5rem;
    }

    .finance-result {
        padding: 2rem 1.5rem;
        background: var(--slate-50);
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .input-group {
        margin-bottom: 1.5rem;
    }

    .label-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 0.75rem;
        align-items: center;
    }

    .label-row label {
        font-size: 0.7rem;
        font-weight: 800;
        color: var(--slate-500);
        text-transform: uppercase;
    }

    .val-highlight {
        color: var(--blue-primary);
        font-weight: 900;
        font-size: 1rem;
    }

    .custom-range {
        width: 100%;
        height: 6px;
        -webkit-appearance: none;
        appearance: none;
        background: var(--slate-200);
        border-radius: 99px;
        cursor: pointer;
        outline: none;
    }

    .custom-range::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 20px;
        height: 20px;
        background: var(--blue-primary);
        border-radius: 50%;
        cursor: pointer;
        box-shadow: 0 2px 6px rgba(20, 89, 221, 0.3);
        margin-top: -7px;
    }

    .custom-range::-moz-range-thumb {
        width: 20px;
        height: 20px;
        background: var(--blue-primary);
        border-radius: 50%;
        cursor: pointer;
        border: none;
        box-shadow: 0 2px 6px rgba(20, 89, 221, 0.3);
    }

    .custom-range::-webkit-slider-runnable-track {
        height: 6px;
        border-radius: 99px;
    }

    .custom-range::-moz-range-track {
        height: 6px;
        background: var(--slate-200);
        border-radius: 99px;
    }

    .duration-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 0.4rem;
    }

    .profile-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 0.75rem;
    }

    .duration-btn {
        padding: 0.75rem 1rem;
        border: 1px solid var(--slate-200);
        background: white;
        border-radius: 99px;
        font-size: 0.875rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s;
        color: var(--slate-600);
    }

    .profile-btn {
        padding: 0.875rem 1rem;
        border: 1px solid var(--slate-200);
        background: white;
        border-radius: 99px;
        font-size: 0.8rem;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s;
        color: var(--slate-600);
        text-transform: uppercase;
    }

    .duration-btn.active {
        border-color: var(--blue-primary);
        background: #eff6ff;
        color: var(--blue-primary);
    }

    .profile-btn.active {
        border-color: var(--blue-primary);
        background: #eff6ff;
        color: var(--blue-primary);
    }

    .result-label {
        text-transform: uppercase;
        font-size: 0.75rem;
        font-weight: 700;
        color: var(--blue-primary);
        letter-spacing: 0.15em;
        margin-bottom: 0.5rem;
    }

    .result-amount {
        font-size: 3.5rem;
        font-weight: 900;
        color: var(--slate-900);
        margin: 0.5rem 0;
        display: flex;
        align-items: baseline;
        justify-content: center;
        gap: 0.5rem;
    }

    .result-amount small {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--slate-400);
    }

    .disclaimer {
        font-size: 0.75rem;
        color: var(--slate-400);
        max-width: 280px;
        margin-bottom: 2rem;
        line-height: 1.5;
        text-align: center;
    }

    .chat-btn {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        background: var(--blue-primary);
        color: white;
        padding: 1rem 2.5rem;
        border-radius: 99px;
        border: none;
        font-weight: 700;
        font-size: 0.9rem;
        cursor: pointer;
        box-shadow: 0 8px 25px rgba(20, 89, 221, 0.25);
        text-decoration: none;
        transition: all 0.2s;
    }

    .chat-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 12px 30px rgba(20, 89, 221, 0.35);
    }

    /* Sidebar */
    .sidebar {
        width: 100%;
    }

    @media (min-width: 1024px) {
        .sidebar {
            width: 400px;
            flex-shrink: 0;
        }
    }

    .sticky-content {
        position: sticky;
        top: 5rem;
    }

    .pricing-card {
        background: white;
        border-radius: 1.5rem;
        border: 1px solid var(--slate-200);
        box-shadow: 0 20px 40px -12px rgba(0, 0, 0, 0.12);
        overflow: hidden;
        margin-bottom: 1.5rem;
    }

    .p-6 {
        padding: 1.5rem;
    }

    .price-row {
        display: flex;
        align-items: baseline;
        gap: 0.75rem;
        margin-bottom: 0.75rem;
    }

    .price-amount {
        font-size: 3rem;
        font-weight: 900;
        color: var(--blue-primary);
        letter-spacing: -0.02em;
    }

    .price-currency {
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--slate-400);
    }

    .finance-badge {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.5rem 1rem;
        background: #eff6ff;
        color: var(--blue-primary);
        border-radius: 0.5rem;
        font-weight: 700;
        font-size: 0.875rem;
    }

    .action-buttons {
        display: flex;
        flex-direction: column;
        gap: 0.75rem;
        margin-top: 1.5rem;
    }

    .btn-primary {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        width: 100%;
        padding: 1.15rem 1.5rem;
        border-radius: 1rem;
        /* Match design: rounded-2xl */
        font-size: 1rem;
        font-weight: 800;
        border: none;
        cursor: pointer;
        transition: all 0.2s;
        text-decoration: none;
    }

    .btn-whatsapp {
        background: var(--blue-primary);
        color: white;
        box-shadow: 0 4px 15px rgba(20, 89, 221, 0.3);
    }

    .btn-whatsapp:hover {
        background: #1e6aff;
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(20, 89, 221, 0.4);
    }

    .btn-call {
        background: #FDD817;
        color: var(--slate-900);
        font-size: 1.125rem;
        /* Match chat button size */
        font-weight: 900;
    }

    .btn-call:hover {
        background: #eec915;
    }

    .btn-offer {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        width: 100%;
        padding: 1rem 1.5rem;
        background: white;
        border: 2px solid var(--slate-200);
        border-radius: 1rem;
        /* Match design: rounded-2xl */
        color: var(--slate-600);
        font-weight: 700;
        cursor: pointer;
        font-size: 1rem;
        transition: all 0.2s;
    }

    .btn-offer:hover {
        background: var(--slate-50);
        border-color: var(--slate-300);
    }

    .btn-outline {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.5rem;
        width: 100%;
        padding: 0.75rem;
        background: white;
        border: 2px solid var(--slate-200);
        border-radius: 99px;
        color: var(--slate-600);
        font-weight: 700;
        cursor: pointer;
        font-size: 0.875rem;
    }

    .pricing-footer-info {
        margin-top: 1.5rem;
        padding-top: 1rem;
        border-top: 1px solid var(--slate-100);
    }

    .info-item {
        display: flex;
        align-items: flex-start;
        gap: 0.5rem;
        margin-bottom: 0.75rem;
        font-size: 0.8rem;
        color: var(--slate-600);
    }

    .trust-badge-footer {
        background: var(--slate-50);
        padding: 0.75rem;
        text-align: center;
    }

    .trust-badge-footer span {
        font-size: 9px;
        font-weight: 900;
        color: var(--slate-400);
        letter-spacing: 0.15em;
    }

    .cta-box {
        background: var(--slate-900);
        padding: 1.5rem;
        border-radius: 1.5rem;
        color: white;
        position: relative;
        overflow: hidden;
    }

    .glow-effect {
        position: absolute;
        top: 0;
        right: 0;
        width: 6rem;
        height: 6rem;
        background: rgba(20, 89, 221, 0.3);
        filter: blur(40px);
        border-radius: 50%;
        transform: translate(40%, -40%);
    }

    .cta-title {
        font-weight: 900;
        text-transform: uppercase;
        font-size: 1rem;
        margin-bottom: 1.2rem;
        position: relative;
    }

    .cta-desc {
        font-size: 0.8rem;
        opacity: 0.7;
        margin-bottom: 1rem;
        line-height: 1.5;
        position: relative;
    }

    .cta-button {
        width: 100%;
        padding: 0.75rem;
        background: var(--blue-primary);
        border: none;
        color: white;
        border-radius: 0.75rem;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        cursor: pointer;
        font-size: 0.8rem;
    }

    /* Trust Section */
    /* Trust Section */
    .trust-section {
        padding: 4rem 2rem;
        background: white;
        border: 1px solid var(--slate-100);
        border-radius: 2rem;
        margin-top: 3rem;
        text-align: center;
    }

    .trust-header {
        margin-bottom: 3rem;
    }

    .trust-main-title {
        font-size: 1.75rem;
        font-weight: 900;
        color: var(--slate-900);
        text-transform: uppercase;
        margin-bottom: 1rem;
    }

    .trust-subtitle {
        color: var(--slate-500);
        max-width: 700px;
        margin: 0 auto;
        font-size: 1rem;
        line-height: 1.6;
    }

    .trust-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 2rem;
        margin-bottom: 4rem;
    }

    .trust-item {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .trust-icon-box {
        width: 80px;
        height: 80px;
        background: #eff6ff;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2rem;
        color: var(--blue-primary);
        margin-bottom: 1.5rem;
    }

    .trust-item-title {
        font-size: 1rem;
        font-weight: 900;
        color: var(--slate-900);
        text-transform: uppercase;
        margin-bottom: 1rem;
    }

    .trust-item-desc {
        font-size: 0.9rem;
        color: var(--slate-500);
        line-height: 1.5;
        max-width: 250px;
    }

    .brand-logos {
        display: flex;
        align-items: center;
        gap: 3rem;
        overflow: hidden;
        margin-top: 3rem;
        padding-top: 3rem;
        border-top: 1px solid var(--slate-50);
        position: relative;
    }

    .brand-logos-track {
        display: flex;
        align-items: center;
        gap: 3rem;
        animation: slide 15s linear infinite;
        white-space: nowrap;
    }

    @keyframes slide {
        0% {
            transform: translateX(0);
        }

        100% {
            transform: translateX(-50%);
        }
    }

    .brand-logos-track img {
        height: 30px;
        object-fit: contain;
        filter: grayscale(100%);
        opacity: 0.6;
        transition: all 0.3s;
        flex-shrink: 0;
    }

    .brand-logos-track img:hover {
        filter: grayscale(0%);
        opacity: 1;
    }

    /* Propose Price Form */
    .propose-form {
        background: #fffbeb;
        padding: 1rem;
        border-radius: 1rem;
        border: 1px solid #fef3c7;
        margin-bottom: 1rem;
    }

    .propose-form h4 {
        font-size: 0.9rem;
        font-weight: 800;
        color: var(--slate-900);
        margin-bottom: 0.75rem;
    }

    .propose-form-inner {
        display: flex;
        gap: 0.5rem;
    }

    .propose-form input {
        flex: 1;
        padding: 0.6rem;
        border: 1px solid var(--slate-200);
        border-radius: 0.5rem;
        font-size: 0.875rem;
    }

    .propose-form button {
        padding: 0.6rem 1rem;
        background: var(--blue-primary);
        color: white;
        border: none;
        border-radius: 0.5rem;
        font-weight: 700;
        cursor: pointer;
        font-size: 0.875rem;
    }

    /* Share & Favorite Buttons */
    .action-icons {
        display: flex;
        gap: 0.75rem;
        margin-top: 1rem;
    }

    .icon-btn {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        border: 1px solid var(--slate-200);
        background: white;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.2s;
    }

    .icon-btn:hover {
        background: var(--slate-50);
    }

    .icon-btn i {
        color: var(--slate-500);
    }

    .icon-btn.favorited i {
        color: #ef4444;
    }

    .mt-4 {
        margin-top: 1rem;
    }

    /* Vue en Direct (Live View) */
    .live-view-thumbnail {
        position: absolute;
        bottom: 1.5rem;
        right: 1.5rem;
        width: 7rem;
        height: 10rem;
        border-radius: 1rem;
        overflow: hidden;
        border: 2px solid white;
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        z-index: 20;
        cursor: pointer;
        transition: transform 0.3s;
    }

    .live-view-thumbnail:hover {
        transform: scale(1.1);
    }

    .live-view-thumbnail img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 0.9;
    }

    .play-overlay {
        position: absolute;
        inset: 0;
        background: rgba(0, 0, 0, 0.4);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .play-button {
        width: 2.5rem;
        height: 2.5rem;
        background: rgba(255, 255, 255, 0.4);
        backdrop-filter: blur(4px);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .play-button i {
        color: white;
        margin-left: 2px;
        font-size: 1rem;
    }

    .live-tag {
        position: absolute;
        top: 0.5rem;
        right: 0.5rem;
        display: flex;
        gap: 0.25rem;
        align-items: center;
    }

    .pulsing-dot {
        width: 0.5rem;
        height: 0.5rem;
        background-color: #ef4444;
        border-radius: 50%;
        animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
    }

    @keyframes pulse {

        0%,
        100% {
            opacity: 1;
        }

        50% {
            opacity: .5;
        }
    }

    .live-text {
        font-size: 8px;
        font-weight: 900;
        color: white;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
    }

    /* Finance Chat Modal */
    .finance-chat-overlay {
        position: fixed;
        inset: 0;
        z-index: 9999;
        background: rgba(0, 0, 0, 0.4);
        display: none;
        align-items: flex-end;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s;
    }

    @media (min-width: 1024px) {
        .finance-chat-overlay {
            align-items: center;
        }
    }

    .finance-chat-overlay.open {
        display: flex;
        opacity: 1;
    }

    .finance-chat-modal {
        width: 100%;
        height: 85vh;
        background: white;
        border-radius: 1.5rem 1.5rem 0 0;
        display: flex;
        flex-direction: column;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        transform: translateY(100%);
        transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1);
    }

    @media (min-width: 1024px) {
        .finance-chat-modal {
            width: 420px;
            height: 600px;
            border-radius: 1.5rem;
            transform: translateY(20px);
            opacity: 0;
        }
    }

    .finance-chat-overlay.open .finance-chat-modal {
        transform: translateY(0);
        opacity: 1;
    }

    .chat-header {
        padding: 1rem;
        border-bottom: 1px solid var(--slate-100);
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .chat-title-group p {
        font-size: 0.75rem;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        color: var(--slate-400);
        font-weight: 700;
    }

    .chat-title-group h3 {
        font-weight: 900;
        color: var(--slate-900);
        margin: 0;
    }

    .chat-close-btn {
        background: none;
        border: none;
        cursor: pointer;
        padding: 0.5rem;
        color: var(--slate-500);
        font-size: 1.25rem;
    }

    .chat-body {
        flex: 1;
        padding: 1rem;
        overflow-y: auto;
        background: var(--slate-50);
        display: flex;
        flex-direction: column;
        gap: 0.75rem;
    }

    .chat-bubble {
        max-width: 80%;
        padding: 0.75rem;
        border-radius: 0.75rem;
        font-size: 0.875rem;
        line-height: 1.5;
    }

    .chat-bubble.user {
        background: white;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        align-self: flex-start;
        color: var(--slate-900);
    }

    .chat-bubble.agent {
        background: var(--blue-primary);
        color: white;
        align-self: flex-end;
    }

    .chat-footer {
        padding: 1rem;
        border-top: 1px solid var(--slate-100);
        display: flex;
        gap: 0.5rem;
    }

    .chat-input {
        flex: 1;
        padding: 0.75rem 1rem;
        border: 1px solid var(--slate-200);
        border-radius: 0.75rem;
        font-size: 0.875rem;
        outline: none;
    }

    .chat-input:focus {
        border-color: var(--blue-primary);
    }

    .chat-send-btn {
        background: var(--blue-primary);
        color: white;
        border: none;
        padding: 0 1rem;
        border-radius: 0.75rem;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Redesigned Chat Button */
    .btn-chat-new {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        width: 100%;
        padding: 1.25rem;
        background: var(--blue-primary);
        color: white;
        border-radius: 1rem;
        font-weight: 900;
        font-size: 1.125rem;
        border: none;
        cursor: pointer;
        transition: all 0.2s;
        box-shadow: 0 10px 25px -5px rgba(20, 89, 221, 0.4);
        text-decoration: none;
        white-space: nowrap;
    }

    .btn-chat-new i {
        font-size: 1.375rem;
        /* 22px to match lucide-react size={22} */
    }

    .btn-chat-new:hover {
        background: #0f4ac4;
        transform: translateY(-2px);
        box-shadow: 0 15px 30px -5px rgba(20, 89, 221, 0.5);
    }

    .btn-chat-new:active {
        transform: scale(0.98);
    }
</style>

<body>
    {{-- TOP BAR --}}
    <div class="top-bar">
        <div class="top-bar-inner">
            <div class="top-bar-contact">
                <div class="top-bar-item">
                    <i class="fas fa-envelope"></i>
                    <a href="mailto:contact@nado.ma">contact@nado.ma</a>
                </div>
                <div class="top-bar-item hide-mobile">
                    <i class="fas fa-phone"></i>
                    <a href="tel:+212520070611">+212 520 070 611</a>
                </div>
            </div>
            <div class="top-bar-social">
                <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>

    {{-- HEADER / MAIN NAV --}}
    <header class="header">
        <div class="header-inner">
            <div class="header-left">
                {{-- Logo --}}
                <a href="{{ route('index') }}" class="logo-link">
                    <span class="logo-text">
                        <span class="blue">NA</span><span class="yellow">DO</span>
                    </span>
                </a>

                {{-- Desktop Navigation --}}
                <nav class="nav-menu">
                    <a href="{{ route('achat.index') }}">Achat</a>
                    <a href="{{ route('vente.index') }}">Vente</a>
                    <a href="{{ route('nadoautoenchere.categories') }}" class="highlighted">Auto-enchère</a>
                    <a href="{{ route('reprise.index') }}">Reprise</a>
                    <a href="{{ route('financement.index') }}">Auto-financement</a>
                    <a href="{{ route('services.index') }}">À propos</a>
                </nav>
            </div>

            <div class="header-right">
                @if (Auth::guard('client')->check())
                    <a href="{{ route('client.dashboard') }}" class="connect-btn">
                        <i class="fas fa-user"></i>
                        <span>{{ Auth::guard('client')->user()->name }}</span>
                    </a>
                @else
                    <a href="{{ route('client.login') }}" class="connect-btn">
                        <i class="fas fa-user"></i>
                        <span>Se connecter</span>
                    </a>
                @endif

                <button id="navToggle" class="nav-toggle">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </div>
    </header>

    {{-- MOBILE DRAWER --}}
    <div id="mobileDrawer" class="mobile-drawer-overlay">
        <div class="mobile-drawer-backdrop" id="drawerBackdrop"></div>
        <div class="mobile-drawer">
            {{-- Drawer Header --}}
            <div class="drawer-header">
                <a href="{{ route('index') }}" class="logo-link">
                    <span class="logo-text">
                        <span class="blue">NA</span><span class="yellow">DO</span>
                    </span>
                </a>
                <button id="drawerClose" class="drawer-close">
                    <i class="fas fa-times"></i>
                </button>
            </div>

            {{-- Drawer Navigation --}}
            <nav class="drawer-nav">
                <a href="{{ route('achat.index') }}">Achat</a>
                <a href="{{ route('vente.index') }}">Vente</a>
                <a href="{{ route('nadoautoenchere.categories') }}" class="highlighted">Auto-enchère</a>
                <a href="{{ route('reprise.index') }}">Reprise</a>
                <a href="{{ route('financement.index') }}">Auto-financement</a>
                <a href="{{ route('services.index') }}">À propos</a>
            </nav>

            {{-- Drawer Footer --}}
            <div class="drawer-footer">
                @if (Auth::guard('client')->check())
                    <a href="{{ route('client.dashboard') }}" class="drawer-cta">
                        <i class="fas fa-user"></i> {{ Auth::guard('client')->user()->name }}
                    </a>
                @else
                    <a href="{{ route('client.login') }}" class="drawer-cta">
                        <i class="fas fa-user"></i> Se connecter
                    </a>
                @endif

                <div class="drawer-social">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>

                <div class="drawer-divider"></div>

                <div class="drawer-support">
                    <p class="drawer-support-label">Support NADO</p>
                    <a href="tel:+212520070611" class="drawer-support-phone">+212 520 070 611</a>
                </div>
            </div>
        </div>
    </div>

    <main class="container main-content">
        <div class="layout-grid">
            {{-- MAIN CONTENT COLUMN --}}
            <div class="content-column">
                {{-- Header Section --}}
                <div class="header-section">
                    <div class="badge-row">
                        <span class="badge id-badge">Réf: VC{{ $annonce->id }}</span>
                        <span class="badge certified-badge">Certifié NADO Expert</span>
                    </div>
                    <h1 class="main-title">
                        {{ $annonce->brand ? $annonce->brand->name : 'Marque' }}
                        <span
                            class="text-blue">{{ $annonce->modeleRelation ? $annonce->modeleRelation->name : 'Modèle' }}</span>
                    </h1>
                    <p class="specs-subtitle">
                        {{ $annonce->year ?? 'Année' }} • {{ number_format($annonce->km ?? 0, 0, ',', ' ') }} KM •
                        {{ $annonce->carburant ?? 'Carburant' }} • {{ $annonce->transmission ?? 'Boîte' }}
                    </p>


                </div>

                {{-- Gallery Section --}}
                <div class="gallery-section">
                    <div class="main-image-container" id="mainDisplay">
                        @php
                            $mainImage = null;
                            if (is_array($annonce->images) && count($annonce->images) > 0) {
                                $mainImage = asset('storage/ads/' . $annonce->images[0]);
                            } elseif ($annonce->media->count() > 0) {
                                $mainImage = asset('storage/ads/' . $annonce->media->first()->name);
                            }
                            $totalMedia =
                                (is_array($annonce->images) ? count($annonce->images) : 0) +
                                $annonce->media->count() +
                                ($annonce->reel ? 1 : 0);
                        @endphp

                        <div class="image-counter">1 / {{ $totalMedia }}</div>

                        @if ($mainImage)
                            <img id="mainImage" src="{{ $mainImage }}" alt="Image véhicule">
                        @endif

                        @if ($annonce->reel)
                            <div class="live-view-thumbnail" onclick="document.querySelector('.thumb-video').click()">
                                @php
                                    $thumbImage = null;
                                    if (is_array($annonce->images) && count($annonce->images) > 1) {
                                        $thumbImage = asset('storage/ads/' . $annonce->images[1]);
                                    } elseif (is_array($annonce->images) && count($annonce->images) > 0) {
                                        $thumbImage = asset('storage/ads/' . $annonce->images[0]);
                                    } else {
                                        $thumbImage = asset('assets/images/default-car.jpg');
                                    }
                                @endphp
                                <img src="{{ $thumbImage }}" alt="Aperçu vidéo">
                                <div class="play-overlay">
                                    <div class="play-button">
                                        <i class="fas fa-play"></i>
                                    </div>
                                </div>
                                <div class="live-tag">
                                    <span class="pulsing-dot"></span>
                                    <span class="live-text">VUE EN DIRECT</span>
                                </div>
                            </div>
                        @endif
                        <button id="prevBtn" class="gallery-nav-btn prev"><i
                                class="fas fa-chevron-left"></i></button>
                        <button id="nextBtn" class="gallery-nav-btn next"><i
                                class="fas fa-chevron-right"></i></button>
                    </div>

                    <div class="thumbnails" id="thumbnailContainer">
                        @if (is_array($annonce->images) && count($annonce->images) > 0)
                            @foreach ($annonce->images as $index => $img)
                                <img src="{{ asset('storage/ads/' . $img) }}" data-index="{{ $index }}"
                                    data-type="image" class="thumb {{ $index === 0 ? 'active' : '' }}">
                            @endforeach
                        @endif
                        @foreach ($annonce->media as $index => $media)
                            <img src="{{ asset('storage/ads/' . $media->name) }}"
                                data-index="{{ (is_array($annonce->images) ? count($annonce->images) : 0) + $index }}"
                                data-type="image" class="thumb">
                        @endforeach
                        @if ($annonce->reel)
                            <div class="thumb thumb-video"
                                data-index="{{ (is_array($annonce->images) ? count($annonce->images) : 0) + $annonce->media->count() }}"
                                data-type="video">
                                <img src="{{ asset('assets/images/play-thumbnail.png') }}"
                                    style="width:100%;height:100%;object-fit:cover;border-radius:0.5rem;">
                            </div>
                        @endif
                    </div>
                </div>

                {{-- About Section --}}
                <section class="about-section">
                    <h2 class="section-title">
                        <span class="blue-line"></span>
                        À propos de ce véhicule
                    </h2>
                    <div class="description-card">
                        <p class="description-text">
                            Ce {{ $annonce->brand ? $annonce->brand->name : 'véhicule' }}
                            {{ $annonce->modeleRelation ? $annonce->modeleRelation->name : '' }} d'occasion,
                            @if ($annonce->origine)
                                d'origine {{ $annonce->origine }},
                            @endif
                            modèle {{ $annonce->year ?? 'N/A' }}, est une excellente opportunité
                            @if ($annonce->premiere_main ?? false)
                                première main
                            @endif à saisir.
                            Arborant une élégante finition de couleur {{ $annonce->colors ?? 'N/A' }},
                            ce véhicule affiche {{ number_format($annonce->km ?? 0, 0, ',', ' ') }} km au compteur.
                            Il est équipé d'une boîte de vitesses {{ $annonce->transmission ?? 'N/A' }} et d'une
                            puissance fiscale de {{ $annonce->cv ?? 'N/A' }} CV.
                            Ce véhicule {{ $annonce->nb_Door ?? '' }} portes est certifié par NADO
                            @if ($annonce->garantie ?? false)
                                , bénéficie d'une garantie
                            @endif.
                            Disponible à Casablanca, il est proposé au prix de
                            {{ number_format($annonce->prix, 0, ',', ' ') }} DH.
                        </p>
                        <div class="tag-group">
                            @if ($annonce->premiere_main ?? false)
                                <span class="info-tag">Première main</span>
                            @endif
                            <span class="info-tag">Carnet d'entretien</span>
                            <span class="info-tag">Non accidenté</span>
                            @if ($annonce->garantie ?? false)
                                <span class="info-tag">Garantie incluse</span>
                            @endif
                        </div>
                    </div>
                </section>

                {{-- Tabs Section --}}
                <div class="tabs-container">
                    <div class="tabs-header">
                        <button class="tab-btn active" data-tab="details"><i class="fas fa-info-circle"></i>
                            Détails techniques</button>
                        <button class="tab-btn" data-tab="equipment"><i class="fas fa-list"></i> Équipements</button>
                        <button class="tab-btn" data-tab="expertise"><i class="fas fa-file-alt"></i>
                            Expertise NADO</button>
                        <button class="tab-btn" data-tab="history"><i class="fas fa-history"></i> Historique</button>
                        <button class="tab-btn" data-tab="warranty"><i class="fas fa-shield-alt"></i>
                            Garantie</button>
                    </div>

                    <div class="tabs-content">
                        {{-- Details Tab --}}
                        <div class="tab-pane active" id="details">
                            <div class="specs-grid">
                                <div class="spec-item">
                                    <span>Prix</span><strong>{{ number_format($annonce->prix, 0, ',', ' ') }}
                                        DH</strong>
                                </div>
                                <div class="spec-item"><span>Marque &
                                        Modèle</span><strong>{{ $annonce->brand->name ?? 'N/A' }}
                                        {{ $annonce->modeleRelation->name ?? '' }}</strong></div>
                                <div class="spec-item">
                                    <span>Kilométrage</span><strong>{{ number_format($annonce->km ?? 0, 0, ',', ' ') }}
                                        KM</strong>
                                </div>
                                <div class="spec-item">
                                    <span>Carburant</span><strong>{{ $annonce->carburant ?? 'N/A' }}</strong>
                                </div>
                                <div class="spec-item">
                                    <span>Année</span><strong>{{ $annonce->year ?? 'N/A' }}</strong>
                                </div>
                                <div class="spec-item">
                                    <span>Origine</span><strong>{{ $annonce->origine ?? 'N/A' }}</strong>
                                </div>
                                <div class="spec-item">
                                    <span>Couleur</span><strong>{{ $annonce->colors ?? 'N/A' }}</strong>
                                </div>
                                <div class="spec-item">
                                    <span>Portes</span><strong>{{ $annonce->nb_Door ?? 'N/A' }}</strong>
                                </div>
                                <div class="spec-item"><span>Puissance
                                        (CV)</span><strong>{{ $annonce->cv ?? 'N/A' }}</strong></div>
                                <div class="spec-item">
                                    <span>Boîte</span><strong>{{ $annonce->transmission ?? 'N/A' }}</strong>
                                </div>
                            </div>
                        </div>

                        {{-- Equipment Tab --}}
                        <div class="tab-pane" id="equipment">
                            @if (isset($equipements) && count($equipements))
                                <div class="equipment-grid">
                                    @foreach ($equipements as $label)
                                        <div class="eq-item"><i class="fas fa-check"></i> {{ $label }}</div>
                                    @endforeach
                                </div>
                            @else
                                <p style="color:var(--slate-500);">Aucun équipement listé.</p>
                            @endif
                        </div>

                        {{-- Expertise Tab --}}
                        <div class="tab-pane" id="expertise">
                            <div class="expertise-hero">
                                <div class="expertise-icon-box">📄</div>
                                <div>
                                    <h4 style="font-weight:800;margin-bottom:0.25rem;">Rapport de certification NADO
                                        Expert</h4>
                                    <p style="font-size:0.8rem;color:var(--slate-500);">Ce véhicule a passé notre
                                        inspection de 110 points.</p>
                                    @php $pdfPath = "storage/ads/pdf/{$annonce->id}.pdf"; @endphp
                                    @if (file_exists(public_path($pdfPath)))
                                        <a href="{{ asset($pdfPath) }}" target="_blank"
                                            style="color:var(--blue-primary);font-weight:700;font-size:0.8rem;">Télécharger
                                            le rapport (PDF) ➔</a>
                                    @endif
                                </div>
                            </div>
                            <div class="expertise-grid">
                                <div class="status-card"><span>STRUCTURE</span><br><strong class="text-green">100%
                                        OK</strong></div>
                                <div class="status-card"><span>MÉCANIQUE</span><br><strong class="text-green">100%
                                        OK</strong></div>
                                <div class="status-card"><span>ÉLECTRONIQUE</span><br><strong class="text-green">100%
                                        OK</strong></div>
                                <div class="status-card"><span>ESTHÉTIQUE</span><br><strong class="text-green">100%
                                        OK</strong></div>
                            </div>
                        </div>

                        {{-- History Tab --}}
                        <div class="tab-pane" id="history">
                            <div class="timeline">
                                @forelse($annonce->entretiens ?? [] as $entretien)
                                    <div class="timeline-item">
                                        <div class="timeline-dot"></div>
                                        <div>
                                            <h5 style="font-weight:700;font-size:0.9rem;">
                                                {{ $entretien->revision ?? 'Entretien' }}
                                            </h5>
                                            <p style="font-size:0.8rem;color:var(--slate-500);">
                                                {{ $entretien->date ?? '' }} - {{ $entretien->entretien ?? '' }}
                                            </p>
                                        </div>
                                    </div>
                                @empty
                                    <p style="color:var(--slate-500);font-size:0.875rem;">Aucune donnée d'historique
                                        disponible.</p>
                                @endforelse
                            </div>
                        </div>

                        {{-- Warranty Tab --}}
                        <div class="tab-pane" id="warranty">
                            <div class="warranty-card">
                                <div class="shield-icon">🛡️</div>
                                <h3 style="font-size:1.25rem;font-weight:800;">Garantie NADO Sérénité</h3>
                                <p style="color:var(--slate-500);font-size:0.875rem;margin-top:0.5rem;">Garantie de 1
                                    mois couvrant pièces et main d'œuvre, dans la limite de 1 000 km.</p>
                                <button class="secondary-button">Consulter les conditions</button>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- Finance Simulator --}}
                <section class="finance-card">
                    <div class="finance-header">
                        <div class="header-content">
                            <div class="finance-icon"><i class="fas fa-border-all"></i></div>
                            <div>
                                <h2 class="finance-title">Simulateur de Financement</h2>
                                <p class="finance-subtitle">Personnalisez votre plan de financement.</p>
                            </div>
                        </div>
                    </div>

                    <div class="finance-body">
                        <div class="finance-inputs">
                            <input type="hidden" id="prixTotal" value="{{ $annonce->prix }}">
                            <input type="hidden" id="taux" value="{{ $tauxInteretDefault ?? 13 }}">

                            <div class="input-group">
                                <div class="label-row">
                                    <label><i class="fas fa-coins"></i> APPORT INITIAL (MAD)</label>
                                    <span id="apport-val" class="val-highlight">0</span>
                                </div>
                                <input type="range" id="apport-range" min="0" max="{{ $annonce->prix }}"
                                    step="5000" value="0" class="custom-range">
                            </div>

                            <div class="input-group">
                                <div class="label-row">
                                    <label><i class="fas fa-clock"></i> DURÉE DU CRÉDIT</label>
                                    <span id="duree-val" class="val-highlight">60 mois</span>
                                </div>
                                <div class="duration-grid">
                                    <button class="duration-btn" data-months="12">12m</button>
                                    <button class="duration-btn" data-months="24">24m</button>
                                    <button class="duration-btn" data-months="36">36m</button>
                                    <button class="duration-btn" data-months="48">48m</button>
                                    <button class="duration-btn active" data-months="60">60m</button>
                                    <button class="duration-btn" data-months="72">72m</button>
                                </div>
                            </div>

                            <div class="input-group">
                                <div class="label-row" style="margin-bottom:0.75rem;">
                                    <label><i class="fas fa-user"></i> Votre Profil</label>
                                </div>
                                <div class="profile-grid">
                                    @foreach ($clientTypes ?? [] as $type)
                                        <button class="profile-btn"
                                            data-taux="{{ $type->taux_interet }}">{{ $type->name }}</button>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        <div class="finance-result">
                            <span class="result-label">MENSUALITÉ ESTIMÉE</span>
                            <div class="result-amount">
                                <span id="monthly-payment">0</span><small>MAD</small>
                            </div>
                            <p class="disclaimer">Offre indicative soumise à acceptation du dossier par nos partenaires
                                financiers.</p>
                            <a href="https://wa.me/212520070611" target="_blank" class="chat-btn">
                                <i class="fas fa-comment"></i> Discuter de cette offre
                            </a>
                        </div>
                    </div>
                </section>

                {{-- Trust Section --}}
                <section class="trust-section">
                    <div class="trust-header">
                        <h2 class="trust-main-title">POURQUOI FAIRE CONFIANCE À NADO ?</h2>
                        <p class="trust-subtitle">Plus de 20 ans d'expertise dans l'automobile premium au Maroc. Nous
                            ne vendons pas seulement des voitures, nous offrons la tranquillité d'esprit.</p>
                    </div>
                    <div class="trust-grid">
                        <div class="trust-item">
                            <div class="trust-icon-box"><i class="fas fa-check-circle"></i></div>
                            <h3 class="trust-item-title">CONTRÔLE EXPERT</h3>
                            <p class="trust-item-desc">Chaque véhicule est soumis à une inspection rigoureuse de 110
                                points par nos techniciens certifiés.</p>
                        </div>
                        <div class="trust-item">
                            <div class="trust-icon-box"><i class="fas fa-ban"></i></div>
                            <h3 class="trust-item-title">TRANSPARENCE TOTALE</h3>
                            <p class="trust-item-desc">Historique d'entretien vérifié et rapport d'expertise complet
                                disponible pour chaque annonce.</p>
                        </div>
                        <div class="trust-item">
                            <div class="trust-icon-box"><i class="fas fa-trophy"></i></div>
                            <h3 class="trust-item-title">GARANTIE INCLUSE</h3>
                            <p class="trust-item-desc">Roulez serein avec notre garantie NADO Sérénité couvrant pièces
                                et main d'œuvre pendant 12 mois.</p>
                        </div>
                        <div class="trust-item">
                            <div class="trust-icon-box"><i class="fas fa-star"></i></div>
                            <h3 class="trust-item-title">ACCOMPAGNEMENT</h3>
                            <p class="trust-item-desc">Un conseiller dédié vous accompagne de l'essai routier jusqu'à
                                la signature finale.</p>
                        </div>
                    </div>
                    <div class="brand-logos">
                        <div class="brand-logos-track">
                            <img src="{{ asset('assets/images/brands/porsche.png') }}" alt="Porsche">
                            <img src="{{ asset('assets/images/brands/bmw.png') }}" alt="BMW">
                            <img src="{{ asset('assets/images/brands/mercedes.png') }}" alt="Mercedes">
                            <img src="{{ asset('assets/images/brands/audi.png') }}" alt="Audi">
                            <!-- Duplicated for seamless loop -->
                            <img src="{{ asset('assets/images/brands/porsche.png') }}" alt="Porsche">
                            <img src="{{ asset('assets/images/brands/bmw.png') }}" alt="BMW">
                            <img src="{{ asset('assets/images/brands/mercedes.png') }}" alt="Mercedes">
                            <img src="{{ asset('assets/images/brands/audi.png') }}" alt="Audi">
                        </div>
                    </div>
                </section>
            </div>

            {{-- SIDEBAR --}}
            <aside class="sidebar">
                <div class="sticky-content">
                    <div class="pricing-card">
                        <div class="p-6">
                            <div class="price-row">
                                <span class="price-amount">{{ number_format($annonce->prix, 0, ' ', ' ') }}</span>
                                <span class="price-currency">MAD</span>
                            </div>
                            <div class="finance-badge">
                                <i class="fas fa-calendar-alt"></i>
                                <span>Dès {{ number_format($annonce->prix / 60, 0, ' ', ' ') }} MAD / mois</span>
                            </div>

                            <div class="action-buttons">
                                <button onclick="openFinanceChat()" class="btn-chat-new">
                                    <i class="fas fa-comment-dots"></i> Chat en direct avec le 
                                    
                                </button>
                                @if ($annonce->phone)
                                    <a href="tel:{{ $annonce->phone }}" class="btn-primary btn-call">
                                        <i class="fas fa-mobile-alt"></i> {{ $annonce->phone }}
                                    </a>
                                @else
                                    <a href="tel:0520070611" class="btn-primary btn-call">
                                        <i class="fas fa-mobile-alt"></i> 05 20 07 06 11
                                    </a>
                                @endif
                                <button class="btn-offer" onclick="openOfferModal()">
                                    <i class="fas fa-tag"></i> Faire une offre
                                </button>
                            </div>

                            <div class="pricing-footer-info">
                                <div class="info-item">
                                    <i class="fas fa-check-circle text-green"></i>
                                    <span>Disponibilité immédiate à Casablanca</span>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-check-circle text-green"></i>
                                    <span>Garantie constructeur préservée</span>
                                </div>
                            </div>
                        </div>
                        <div class="trust-badge-footer">
                            <span>PROGRAMME DE CONFIANCE NADO</span>
                        </div>
                    </div>

                    <div class="cta-box">
                        <div class="glow-effect"></div>
                        <h4 class="cta-title">Besoin d'un essai ?</h4>
                        <p class="cta-desc">Prenez rendez-vous pour essayer ce véhicule dans notre showroom à
                            Casablanca.</p>
                        <button class="cta-button">Planifier maintenant</button>
                    </div>
                </div>
            </aside>
        </div>
    </main>

    {{-- Finance Chat Modal --}}
    <div id="financeChatOverlay" class="finance-chat-overlay">
        <div class="finance-chat-modal">
            <div class="chat-header">
                <div class="chat-title-group">
                    <p>Financement</p>
                    <h3>Discussion avec le vendeur</h3>
                </div>
                <button class="chat-close-btn" onclick="closeFinanceChat()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="chat-body" id="chatBody">
                <div class="chat-bubble user">
                    Bonjour, je souhaite discuter des options de financement pour ce véhicule (Réf:
                    VC{{ $annonce->id }}).
                </div>
                <div class="chat-bubble agent">
                    Bien sûr, je suis à votre disposition. Quelle durée de financement envisagez-vous ?
                </div>
            </div>
            <div class="chat-footer">
                <input type="text" class="chat-input" placeholder="Écrire un message..." id="chatInput">
                <button class="chat-send-btn">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </div>
    </div>

    {{-- SCRIPTS --}}
    <script>
        // Mobile Drawer Toggle
        const navToggle = document.getElementById('navToggle');
        const mobileDrawer = document.getElementById('mobileDrawer');
        const drawerClose = document.getElementById('drawerClose');
        const drawerBackdrop = document.getElementById('drawerBackdrop');

        function openDrawer() {
            mobileDrawer.classList.add('open');
            document.body.style.overflow = 'hidden';
        }

        function closeDrawer() {
            mobileDrawer.classList.remove('open');
            document.body.style.overflow = 'unset';
        }

        navToggle?.addEventListener('click', openDrawer);
        drawerClose?.addEventListener('click', closeDrawer);
        drawerBackdrop?.addEventListener('click', closeDrawer);

        // Close drawer when clicking on nav links
        document.querySelectorAll('.drawer-nav a').forEach(link => {
            link.addEventListener('click', closeDrawer);
        });

        // Tab Switching
        const tabButtons = document.querySelectorAll('.tab-btn');
        const tabPanes = document.querySelectorAll('.tab-pane');
        tabButtons.forEach(button => {
            button.addEventListener('click', () => {
                const targetTab = button.getAttribute('data-tab');
                tabButtons.forEach(btn => btn.classList.remove('active'));
                tabPanes.forEach(pane => pane.classList.remove('active'));
                button.classList.add('active');
                document.getElementById(targetTab).classList.add('active');
            });
        });

        // Share Popup
        function openSharePopup(url) {
            Swal.fire({
                title: 'Partager cette annonce',
                html: `
            <div style="display:flex;justify-content:center;gap:1.5rem;font-size:2rem;">
                <a href="https://api.whatsapp.com/send?text=${url}" target="_blank" style="color:#25D366;"><i class="fab fa-whatsapp"></i></a>
                <a href="https://www.facebook.com/sharer/sharer.php?u=${url}" target="_blank" style="color:#1877F2;"><i class="fab fa-facebook"></i></a>
                <a href="mailto:?subject=Annonce Nado.ma&body=Voici une annonce intéressante : ${url}" style="color:#EA4335;"><i class="fas fa-envelope"></i></a>
            </div>
        `,
                showCloseButton: true,
                showConfirmButton: false,
                width: 350,
            });
        }

        // Gallery Logic
        document.addEventListener('DOMContentLoaded', () => {
            const mediaList = [];
            @foreach ($annonce->images ?? [] as $img)
                mediaList.push({
                    type: 'image',
                    src: "{{ asset('storage/ads/' . $img) }}"
                });
            @endforeach
            @foreach ($annonce->media as $m)
                mediaList.push({
                    type: 'image',
                    src: "{{ asset('storage/ads/' . $m->name) }}"
                });
            @endforeach
            @if ($annonce->reel)
                mediaList.push({
                    type: 'video',
                    videoId: "{{ $annonce->reel }}"
                });
            @endif

            let currentIndex = 0;
            const mainDisplay = document.getElementById('mainDisplay');
            const thumbs = document.querySelectorAll('.thumb, .thumb-video');

            function renderMain(index) {
                currentIndex = index;
                const item = mediaList[index];
                const counterHtml = `<div class="image-counter">${index + 1} / ${mediaList.length}</div>`;

                if (item.type === 'image') {
                    let overlayHtml = '';
                    const videoIndex = mediaList.findIndex(m => m.type === 'video');
                    if (videoIndex !== -1) {
                        const thumbSrc = mediaList.length > 1 && mediaList[1].type === 'image' ? mediaList[1].src :
                            mediaList[0].src;

                        overlayHtml = `
                        <div class="live-view-thumbnail">
                            <img src="${thumbSrc}" alt="Aperçu vidéo">
                            <div class="play-overlay">
                                <div class="play-button"><i class="fas fa-play"></i></div>
                            </div>
                            <div class="live-tag">
                                <span class="pulsing-dot"></span>
                                <span class="live-text">VUE EN DIRECT</span>
                            </div>
                        </div>`;
                    }

                    mainDisplay.innerHTML = `${counterHtml}
                <img src="${item.src}" alt="Image" style="width:100%;max-height:500px;object-fit:contain;cursor:zoom-in;">
                ${overlayHtml}
                <button id="prevBtn" class="gallery-nav-btn prev"><i class="fas fa-chevron-left"></i></button>
                <button id="nextBtn" class="gallery-nav-btn next"><i class="fas fa-chevron-right"></i></button>`;

                    if (videoIndex !== -1) {
                        mainDisplay.querySelector('.live-view-thumbnail')?.addEventListener('click', (e) => {
                            e.stopPropagation();
                            renderMain(videoIndex);
                        });
                    }

                } else {
                    mainDisplay.innerHTML = `${counterHtml}
                <iframe width="100%" height="400" src="https://www.youtube.com/embed/${item.videoId}" frameborder="0" allowfullscreen style="border-radius:1rem;"></iframe>
                <button id="prevBtn" class="gallery-nav-btn prev"><i class="fas fa-chevron-left"></i></button>
                <button id="nextBtn" class="gallery-nav-btn next"><i class="fas fa-chevron-right"></i></button>`;
                }
                thumbs.forEach((t, i) => t.classList.toggle('active', i === index));
                attachNavListeners();
            }

            function attachNavListeners() {
                document.getElementById('prevBtn')?.addEventListener('click', () => renderMain((currentIndex - 1 +
                    mediaList.length) % mediaList.length));
                document.getElementById('nextBtn')?.addEventListener('click', () => renderMain((currentIndex + 1) %
                    mediaList.length));
            }

            thumbs.forEach((thumb, i) => thumb.addEventListener('click', () => renderMain(i)));

            mainDisplay?.addEventListener('dblclick', () => {
                if (mediaList[currentIndex]?.type === 'image') {
                    Swal.fire({
                        imageUrl: mediaList[currentIndex].src,
                        showConfirmButton: false,
                        background: 'transparent',
                        backdrop: 'rgba(0,0,0,0.9)'
                    });
                }
            });

            attachNavListeners();
        });

        // Finance Calculator
        // ... (Existing calculator code)

        // Finance Chat Logic
        const chatOverlay = document.getElementById('financeChatOverlay');
        const chatInput = document.getElementById('chatInput');
        const chatBody = document.getElementById('chatBody');

        function openFinanceChat() {
            chatOverlay.classList.add('open');
            document.body.style.overflow = 'hidden';
            setTimeout(() => chatInput.focus(), 100);
        }

        function closeFinanceChat() {
            chatOverlay.classList.remove('open');
            document.body.style.overflow = 'unset';
        }

        // Close on outside click
        chatOverlay?.addEventListener('click', (e) => {
            if (e.target === chatOverlay) {
                closeFinanceChat();
            }
        });

        // Send message logic (visual only for demo)
        document.querySelector('.chat-send-btn')?.addEventListener('click', sendMessage);
        chatInput?.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') sendMessage();
        });

        function sendMessage() {
            const text = chatInput.value.trim();
            if (!text) return;

            // Add user message
            const userMsg = document.createElement('div');
            userMsg.className = 'chat-bubble user';
            userMsg.textContent = text;
            chatBody.appendChild(userMsg);

            chatInput.value = '';
            chatBody.scrollTop = chatBody.scrollHeight;

            // Simulate agent typing/response after delay if needed
        }
        const VEHICLE_PRICE = {{ $annonce->prix }};
        let currentDuree = 60;
        let currentTaux = {{ $tauxInteretDefault ?? 13 }};

        const apportRange = document.getElementById('apport-range');
        const apportVal = document.getElementById('apport-val');
        const dureeVal = document.getElementById('duree-val');
        const monthlyText = document.getElementById('monthly-payment');
        const durationBtns = document.querySelectorAll('.duration-btn');
        const profileBtns = document.querySelectorAll('.profile-btn');

        function calculateFinance() {
            const apport = parseInt(apportRange?.value || 0);
            const capital = VEHICLE_PRICE - apport;
            const monthlyRate = currentTaux / 100 / 12;
            let monthly = 0;
            if (monthlyRate > 0) {
                monthly = (capital * monthlyRate) / (1 - Math.pow(1 + monthlyRate, -currentDuree));
            } else {
                monthly = capital / currentDuree;
            }
            if (apportVal) apportVal.innerText = apport.toLocaleString('fr-FR') + ' DH';
            if (dureeVal) dureeVal.innerText = currentDuree + ' mois';
            if (monthlyText) monthlyText.innerText = Math.round(monthly).toLocaleString('fr-FR');

            // Update slider fill
            updateSliderFill();
        }

        function updateSliderFill() {
            if (!apportRange) return;
            const min = parseInt(apportRange.min) || 0;
            const max = parseInt(apportRange.max) || 100;
            const val = parseInt(apportRange.value) || 0;
            const percentage = ((val - min) / (max - min)) * 100;
            apportRange.style.background =
                `linear-gradient(to right, #1459DD 0%, #1459DD ${percentage}%, #e2e8f0 ${percentage}%, #e2e8f0 100%)`;
        }

        apportRange?.addEventListener('input', calculateFinance);
        durationBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                durationBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                currentDuree = parseInt(btn.getAttribute('data-months'));
                calculateFinance();
            });
        });
        profileBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                profileBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                currentTaux = parseFloat(btn.getAttribute('data-taux')) || {{ $tauxInteretDefault ?? 13 }};
                calculateFinance();
            });
        });

        calculateFinance();

        // Success Message
        @if (session('success'))
            Swal.fire({
                icon: 'success',
                title: "{{ session('success') }}",
                showConfirmButton: false,
                timer: 2000
            });
        @endif
    </script>
</body>

</html>
