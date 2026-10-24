{{-- Automanager · Obsidian & Gold override for standalone pages with their own embedded navbars. --}}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<style>
    :root {
        --am-obsidian: #0E0F12;
        --am-obsidian-800: #17181C;
        --am-gold: #C8A24B;
        --am-gold-bright: #E3C178;
        --am-ivory: #F7F5F1;
    }

    /* Luxe headings everywhere on these pages */
    h1, h2, h3, h4,
    .section-title, .hero-title, .page-title, .block-title {
        font-family: 'Cormorant Garamond', Georgia, serif !important;
        font-weight: 600 !important;
        letter-spacing: 0;
    }

    /* ===== Navbar → obsidian + gold (covers .main-nav and .nv- variants) ===== */
    .nado-navbar .top-bar {
        background: var(--am-obsidian) !important;
        color: var(--am-ivory) !important;
        border-bottom: 1px solid rgba(200, 162, 75, .16) !important;
    }
    .nado-navbar .top-bar a,
    .nado-navbar .top-bar .info-item { color: var(--am-ivory) !important; }
    .nado-navbar .top-bar i { color: var(--am-gold) !important; }
    .nado-navbar .top-bar a:hover { color: var(--am-gold) !important; }

    .nado-navbar .main-nav,
    .nado-navbar .nv-main-nav {
        background: var(--am-obsidian-800) !important;
        border-bottom: 1px solid rgba(200, 162, 75, .22) !important;
    }

    .nado-navbar .social-links a { color: var(--am-ivory) !important; opacity: .6; }
    .nado-navbar .social-links a:hover { color: var(--am-gold) !important; opacity: 1; }

    .nado-navbar .nav-link,
    .nado-navbar .nv-nav-link { color: rgba(247, 245, 241, .72) !important; }
    .nado-navbar .nav-link:hover,
    .nado-navbar .nv-nav-link:hover { background-color: rgba(200, 162, 75, .1) !important; color: var(--am-gold) !important; }
    .nado-navbar .highlight-link,
    .nado-navbar .nv-highlight-link {
        color: var(--am-gold) !important;
        background-color: rgba(200, 162, 75, .12) !important;
        box-shadow: inset 0 -2px 0 var(--am-gold) !important;
    }
    .nado-navbar .text-dark { color: var(--am-ivory) !important; }

    .nado-navbar .nav-dropdown-menu,
    .nado-navbar .nv-dropdown-menu {
        background: var(--am-obsidian-800) !important;
        border: 1px solid rgba(200, 162, 75, .2) !important;
    }
    .nado-navbar .nav-dropdown-menu a,
    .nado-navbar .nv-dropdown-menu a { color: rgba(247, 245, 241, .75) !important; }
    .nado-navbar .nav-dropdown-menu a:hover,
    .nado-navbar .nv-dropdown-menu a:hover { background-color: rgba(200, 162, 75, .12) !important; color: var(--am-gold) !important; }

    .nado-navbar .outline-btn {
        background-color: rgba(200, 162, 75, .1) !important;
        border: 1px solid rgba(200, 162, 75, .45) !important;
        color: var(--am-ivory) !important;
    }
    .nado-navbar .outline-btn:hover { background-color: rgba(200, 162, 75, .22) !important; border-color: var(--am-gold) !important; }
    .nado-navbar .cta-publish {
        background-color: var(--am-gold) !important;
        border-color: var(--am-gold) !important;
        color: var(--am-obsidian) !important;
    }
    .nado-navbar .mobile-menu-btn { background-color: rgba(200, 162, 75, .12) !important; color: var(--am-ivory) !important; }

    /* Logo image → AUTOMANAGER wordmark */
    .nado-navbar .logo-link img,
    .nado-navbar .nv-logo-link img { display: none !important; }
    .nado-navbar .logo-link,
    .nado-navbar .nv-logo-link {
        display: inline-flex !important;
        align-items: center;
        font-family: 'Jost', sans-serif;
        font-size: 1.7rem;
        font-weight: 800;
        letter-spacing: .06em;
        text-transform: uppercase;
        line-height: 1;
        white-space: nowrap;
    }
    .nado-navbar .logo-link::before,
    .nado-navbar .nv-logo-link::before { content: "AUTO"; color: var(--am-ivory); }
    .nado-navbar .logo-link::after,
    .nado-navbar .nv-logo-link::after { content: "MANAGER"; color: var(--am-gold); margin-left: .1em; }
</style>
