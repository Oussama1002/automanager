<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Automanager')</title>

    <script src="https://unpkg.com/lucide@latest"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Owl Carousel CSS (kept for pages that still use it) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    <style>
        :root {
            /* Obsidian & Gold — Automanager identity */
            --primary:    #0E0F12;   /* obsidian (brand dark / primary surfaces) */
            --secondary:  #C8A24B;   /* champagne gold (accent / actions)        */

            --obsidian:        #0E0F12;
            --obsidian-800:    #17181C;
            --obsidian-700:    #202228;
            --gold:            #C8A24B;
            --gold-bright:     #E3C178;
            --gold-deep:       #A17E31;
            --gold-soft:       #F2E9D2;
            --ivory:           #F7F5F1;

            --slate-50:   #f8fafc;
            --slate-100:  #f1f5f9;
            --slate-200:  #e2e8f0;
            --slate-300:  #cbd5e1;
            --slate-400:  #94a3b8;
            --slate-500:  #64748b;
            --slate-600:  #475569;
            --slate-700:  #334155;
            --slate-800:  #1e293b;
            --slate-900:  #0f172a;
            --white:      #ffffff;
            --black:      #000000;

            --font-display: 'Cormorant Garamond', Georgia, serif;
            --font-sans:    'Jost', system-ui, sans-serif;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: var(--font-sans);
            background-color: var(--white);
            color: var(--slate-900);
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        a      { text-decoration: none; color: inherit; }
        ul     { list-style: none; }
        button { border: none; background: none; cursor: pointer; font-family: inherit; }
        ::selection { background: var(--gold); color: var(--obsidian); }
        h1, h2, h3, h4 { font-family: var(--font-display); font-weight: 600; letter-spacing: 0; }
    </style>

    @yield('link')
    @yield('styles')
</head>

<body class="no-scrollbar">

    @php
        $client        = Auth::guard('client')->user();
        $isAutoEnchere = request()->routeIs('nadoautoenchere.*');
        $accentColor   = $isAutoEnchere ? '#C8A24B' : '#C8A24B';
    @endphp

    {{-- Full AUTOMANAGER navbar (same partial as the home page) --}}
    @include('partials.nado-navbar')

    {{-- Spacer so content never sits under the fixed navbar --}}
    <div style="height:110px;"></div>

    <main>
        @yield('content')
    </main>

    @yield('script')
</body>
</html>
