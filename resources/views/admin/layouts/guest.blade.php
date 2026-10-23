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
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

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
