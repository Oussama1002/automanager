@extends('admin.layouts.guest')

@section('title' , 'Forgot Password')

@section('content')

    <div class="auth-logo">
        <a href="index.html"><img src="{{ asset('assets/images/logo.png')}}" alt="Logo"></a>
    </div>
    <h1 class="auth-title" style="font-size:3rem !important;">Forgot Password</h1>

    <form method="POST" action="{{ route('password.email') }}">
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
        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Send</button>
    </form>
    <div class="text-center mt-5 text-lg fs-4">
        <p class='text-gray-600'>Remember your account? <a href="{{ route('login') }}" class="font-bold">Log in</a>
        </p>
    </div>
@endsection
