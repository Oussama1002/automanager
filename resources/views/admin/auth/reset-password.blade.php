@extends('admin.layouts.guest')

@section('title' , 'Reset password')

@section('content')

    <div class="auth-logo">
        <a href="index.html"><img src="{{ asset('assets/images/logo.png')}}" alt="Logo"></a>
    </div>
    <h1 class="auth-title" style="font-size:3rem !important;">Reset password</h1>

    <form method="POST" action="{{ route('password.store') }}">
        @csrf
        <!-- Password Reset Token -->
        <input type="hidden" name="token" value="{{ $request->route('token') }}">

        <div class="form-group position-relative has-icon-left mb-4">
            <input type="email" id="email" class="form-control form-control-xl @error('email') is-invalid  @enderror"  name="email" value="{{old('email')}}" placeholder="Email" required autofocus autocomplete="username">
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
            <input type="password" name="password" id="password" class="form-control form-control-xl @error('password') is-invalid  @enderror" placeholder="Password" required autocomplete="new-password">
            <div class="form-control-icon">
                <i class="bi bi-shield-lock"></i>
            </div>
            @error('password')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
        </div>
        <div class="form-group position-relative has-icon-left mb-4">
            <input type="password" name="password_confirmation" id="password_confirmation" class="form-control form-control-xl @error('password') is-invalid  @enderror" placeholder="Confirm Password" required autocomplete="new-password">
            <div class="form-control-icon">
                <i class="bi bi-shield-lock"></i>
            </div>
            @error('password_confirmation')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror
        </div>
        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Reset Password</button>
    </form>
@endsection
