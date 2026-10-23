@extends('layouts.auth')

@section('content')
<style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    .auth-page { min-height: 100vh; min-height: 100dvh; display: flex; flex-direction: column; background: #f8fafc; font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; position: relative; }
    .auth-grid-bg { position: fixed; inset: 0; opacity: 0.03; pointer-events: none; background-image: linear-gradient(#0E0F12 1px, transparent 1px), linear-gradient(90deg, #0E0F12 1px, transparent 1px); background-size: 32px 32px; z-index: 0; }
    .auth-z { position: relative; z-index: 10; display: flex; flex-direction: column; flex: 1; min-height: 0; }
    .auth-main { flex: 1; padding: 32px 16px; }
    @media (min-width: 640px) { .auth-main { padding: 40px 24px; } }
    .auth-main-inner { max-width: 72rem; margin: 0 auto; display: flex; flex-direction: column; }
    .auth-title-block { text-align: center; margin-bottom: 24px; }
    .auth-title-block h1 { font-size: 24px; font-weight: 900; color: #0f172a; letter-spacing: -0.03em; margin-bottom: 8px; }
    .auth-title-block p { color: #475569; font-size: 14px; font-weight: 500; }
    .auth-alert { max-width: 480px; margin: 0 auto 24px; padding: 12px 16px; border-radius: 12px; font-size: 14px; font-weight: 600; }
    .auth-alert.success { background: #dcfce7; color: #15803d; }
    .auth-alert.danger  { background: #fee2e2; color: #b91c1c; }
    .auth-alert ul { padding-left: 18px; }
    .auth-grid-single { max-width: 480px; margin: 0 auto; width: 100%; }
    .auth-card { border-radius: 1.5rem; background: #fff; border: 1px solid #e2e8f0; box-shadow: 0 8px 24px -4px rgba(148,163,184,0.15); }
    .auth-card-body { padding: 24px; }
    @media (min-width: 1024px) { .auth-card-body { padding: 32px; } }
    .auth-card-head { display: flex; align-items: center; gap: 12px; margin-bottom: 20px; }
    .auth-card-icon { width: 48px; height: 48px; border-radius: 10px; display: flex; align-items: center; justify-content: center; background: rgba(20,89,221,0.1); color: #0E0F12; }
    .auth-card-head h2 { font-size: 20px; font-weight: 900; color: #0f172a; margin: 0 0 2px; }
    .auth-card-head p { font-size: 14px; color: #64748b; margin: 0; }
    .auth-form { display: flex; flex-direction: column; gap: 20px; }
    .auth-label { display: block; font-size: 11px; font-weight: 800; color: #334155; text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 6px; }
    .auth-input-wrap { position: relative; }
    .auth-input-icon { position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: #94a3b8; display: flex; align-items: center; }
    .auth-input { width: 100%; padding: 14px 16px 14px 42px; background: #f8fafc; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 14px; font-weight: 500; color: #0f172a; outline: none; min-height: 48px; }
    .auth-input:focus { border-color: #0E0F12; background: #fff; box-shadow: 0 0 0 3px rgba(20,89,221,0.15); }
    .auth-btn-login { width: 100%; padding: 16px; background: #0E0F12; color: #fff; border: none; border-radius: 10px; font-size: 14px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.08em; cursor: pointer; box-shadow: 0 8px 20px -4px rgba(20,89,221,0.3); min-height: 48px; }
    .auth-btn-login:hover { background: #0d47b4; }
</style>

<div class="auth-page">
    <div class="auth-grid-bg"></div>
    <div class="auth-z">
        @include('partials.nado-navbar')
        <div style="height:110px;"></div>

        <main class="auth-main">
            <div class="auth-main-inner">
                <div class="auth-title-block">
                    <h1>Mot de passe oublié</h1>
                    <p>Entrez votre email pour recevoir un lien de réinitialisation</p>
                </div>

                @if(session('status'))
                    <div class="auth-alert success">{{ session('status') }}</div>
                @endif
                @if($errors->any())
                    <div class="auth-alert danger">
                        <ul>@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
                    </div>
                @endif

                <div class="auth-grid-single">
                    <div class="auth-card">
                        <div class="auth-card-body">
                            <div class="auth-card-head">
                                <div class="auth-card-icon">
                                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                                        <path d="M7 11V7a5 5 0 0110 0v4"/>
                                    </svg>
                                </div>
                                <div>
                                    <h2>Réinitialiser</h2>
                                    <p>Nous vous enverrons un lien par email.</p>
                                </div>
                            </div>

                            <form class="auth-form" method="POST" action="{{ route('client.password.email') }}">
                                @csrf
                                <div>
                                    <label class="auth-label" for="email">Email</label>
                                    <div class="auth-input-wrap">
                                        <span class="auth-input-icon">
                                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                                                <polyline points="22,6 12,13 2,6"/>
                                            </svg>
                                        </span>
                                        <input type="email" id="email" name="email" class="auth-input" placeholder="vous@exemple.com" value="{{ old('email') }}" required autofocus>
                                    </div>
                                </div>
                                <button type="submit" class="auth-btn-login">Envoyer le lien</button>
                                <p style="text-align:center;font-size:14px;color:#475569;font-weight:500;">
                                    <a href="{{ route('client.login') }}" style="color:#0E0F12;font-weight:700;text-decoration:none;">Retour à la connexion</a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
@endsection
