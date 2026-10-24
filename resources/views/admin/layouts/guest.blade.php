<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>@yield('title')</title>

        <link rel="stylesheet" href="{{ asset('assets/back/assets/css/main/app.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/back/assets/css/pages/auth.css') }}">
        <link rel="shortcut icon" href="{{ asset('assets/images/favicon.png') }}" type="image/png">

        <link rel="stylesheet" href="{{ asset('assets/back/assets/css/shared/iconly.css') }}">
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Jost:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

        {{-- Automanager · Obsidian & Gold login override --}}
        <style>
            :root { --bs-primary:#C8A24B; --bs-primary-rgb:200,162,75; }
            body, .form-control, .btn, input { font-family:'Jost',system-ui,sans-serif; }
            h1, h2, h3, h4, h5, #auth-left .auth-title { font-family:'Cormorant Garamond',Georgia,serif !important; font-weight:600 !important; }
            #auth-right { background:
                radial-gradient(1200px 600px at 70% 20%, rgba(200,162,75,.18), transparent 60%),
                linear-gradient(160deg, #0E0F12 0%, #17181C 100%) !important; }
            .btn-primary {
                --bs-btn-bg:#C8A24B; --bs-btn-border-color:#C8A24B; --bs-btn-color:#0E0F12;
                --bs-btn-hover-bg:#E3C178; --bs-btn-hover-border-color:#E3C178; --bs-btn-hover-color:#0E0F12;
                font-weight:600; }
            a, .text-primary { color:#A17E31 !important; }
            .form-control:focus { border-color:#C8A24B; box-shadow:0 0 0 .2rem rgba(200,162,75,.2); }
        </style>

    </head>

    <body>
        <div id="auth">

            <div class="row h-100">
                <div class="col-lg-5 col-12">
                    <div id="auth-left">
                        @include('admin.partials.flashdata')
                        @yield('content')
                    </div>
                </div>
                <div class="col-lg-7 d-none d-lg-block" >
                    <div id="auth-right" style="background: #f5c04a;">

                    </div>
                </div>
            </div>

        </div>
    </body>

</html>
