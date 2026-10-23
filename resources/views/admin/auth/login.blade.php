@extends('admin.layouts.guest')

@section('title' , 'Log in')

@section('content')

    <div class="auth-logo">
        <a href="index.html"><img src="{{ asset('assets/images/logo.png')}}" alt="Logo"></a>
    </div>
    <h1 class="auth-title">Log in</h1>

    <form method="POST" action="{{ route('admin.login') }}">
        @csrf
        <div class="form-group position-relative has-icon-left mb-4">
            <input type="email" id="name" class="form-control form-control-xl @error('email') is-invalid  @enderror"  name="email" value="{{old('email')}}" placeholder="Email" required autofocus autocomplete="username">
            <div class="form-control-icon">
                <i class="bi bi-person"></i>
            </div>
            @error('email')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
        </div>
        <div class="form-group position-relative has-icon-left mb-4">
            <input type="password" name="password" class="form-control form-control-xl @error('password') is-invalid  @enderror" placeholder="Password" required autocomplete="current-password">
            <div class="form-control-icon">
                <i class="bi bi-shield-lock"></i>
            </div>
            @error('password')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
        </div>
        <div class="form-check form-check-lg d-flex align-items-end">
            <input class="form-check-input me-2" type="checkbox" value="{{ old('remember_me') }}" id="remember_me" name="remember">
            <label class="form-check-label text-gray-600" for="remember_me" >
                Remember me
            </label>
        </div>
        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Log in</button>
    </form>
    <div class="text-center mt-5 text-lg fs-4">
        @if (Route::has('password.request'))
            <p><a class="font-bold" href="{{ route('password.request') }}">Forgot password?</a></p>
        @endif
    </div>
@endsection
