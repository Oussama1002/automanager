@extends('layouts.auth')

@section('content')
<style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    .auth-page { min-height: 100vh; display: flex; flex-direction: column; background: #f8fafc; font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; }
    .auth-grid-bg { position: fixed; inset: 0; opacity: 0.03; pointer-events: none; background-image: linear-gradient(#1459DD 1px, transparent 1px), linear-gradient(90deg, #1459DD 1px, transparent 1px); background-size: 32px 32px; z-index: 0; }
    .auth-z { position: relative; z-index: 10; display: flex; flex-direction: column; flex: 1; }
    .auth-main { flex: 1; padding: 32px 16px; }
    .auth-main-inner { max-width: 72rem; margin: 0 auto; display: flex; flex-direction: column; }
    .auth-title-block { text-align: center; margin-bottom: 24px; }
    .auth-title-block h1 { font-size: 24px; font-weight: 900; color: #0f172a; margin-bottom: 8px; }
    .auth-title-block p { color: #475569; font-size: 14px; }
    .auth-alert { max-width: 480px; margin: 0 auto 24px; padding: 12px 16px; border-radius: 12px; font-size: 14px; font-weight: 600; }
    .auth-alert.danger { background: #fee2e2; color: #b91c1c; }
    .auth-alert ul { padding-left: 18px; }
    .auth-grid-single { max-width: 480px; margin: 0 auto; width: 100%; }
    .auth-card { border-radius: 1.5rem; background: #fff; border: 1px solid #e2e8f0; box-shadow: 0 8px 24px -4px rgba(148,163,184,0.15); }
    .auth-card-body { padding: 32px; }
    .auth-card-head { display: flex; align-items: center; gap: 12px; margin-bottom: 20px; }
    .auth-card-icon { width: 48px; height: 48px; border-radius: 10px; display: flex; align-items: center; justify-content: center; background: rgba(20,89,221,0.1); color: #1459DD; }
    .auth-card-head h2 { font-size: 20px; font-weight: 900; color: #0f172a; margin: 0 0 2px; }
    .auth-card-head p { font-size: 14px; color: #64748b; margin: 0; }
    .auth-form { display: flex; flex-direction: column; gap: 20px; }
    .auth-label { display: block; font-size: 11px; font-weight: 800; color: #334155; text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 6px; }
    .auth-input-wrap { position: relative; }
    .auth-input-icon { position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: #94a3b8; }
    .auth-input { width: 100%; padding: 14px 16px 14px 42px; background: #f8fafc; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 14px; min-height: 48px; }
    .auth-input:focus { border-color: #1459DD; background: #fff; box-shadow: 0 0 0 3px rgba(20,89,221,0.15); outline: none; }
    .auth-btn-login { width: 100%; padding: 16px; background: #1459DD; color: #fff; border: none; border-radius: 10px; font-size: 14px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.08em; cursor: pointer; min-height: 48px; }
    .auth-btn-login:hover { background: #0d47b4; }

    /* Show / hide password */
    .pw-toggle {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        background: none;
        border: 0;
        padding: 4px;
        cursor: pointer;
        color: #94a3b8;
        line-height: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .pw-toggle:hover { color: #1459DD; }
    .auth-input-wrap:has(.pw-toggle) .auth-input { padding-right: 40px !important; }
</style>

<div class="auth-page">
    <div class="auth-grid-bg"></div>
    <div class="auth-z">
        @include('partials.nado-navbar')
        <div style="height:110px;"></div>

        <main class="auth-main">
            <div class="auth-main-inner">
                <div class="auth-title-block">
                    <h1>Nouveau mot de passe</h1>
                    <p>Choisissez un nouveau mot de passe pour votre compte</p>
                </div>

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
                                    <h2>Réinitialisation</h2>
                                    <p>Définissez votre nouveau mot de passe.</p>
                                </div>
                            </div>

                            <form class="auth-form" method="POST" action="{{ route('client.password.update') }}">
                                @csrf
                                <input type="hidden" name="token" value="{{ $token }}">

                                <div>
                                    <label class="auth-label" for="email">Email</label>
                                    <div class="auth-input-wrap">
                                        <input type="email" id="email" name="email" class="auth-input" style="padding-left:16px;" value="{{ old('email', $email) }}" required>
                                    </div>
                                </div>

                                <div>
                                    <label class="auth-label" for="password">Nouveau mot de passe</label>
                                    <div class="auth-input-wrap">
                                        <input type="password" id="password" name="password" class="auth-input" style="padding-left:16px;" placeholder="Min. 6 caractères" required>
                                    
                                        <button type="button" class="pw-toggle" data-target="password"
                                            aria-label="Afficher le mot de passe" title="Afficher / masquer">
                                            <svg class="pw-eye" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>
                                            </svg>
                                            <svg class="pw-eye-off" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                style="display:none;">
                                                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
                                                <line x1="1" y1="1" x2="23" y2="23"/>
                                            </svg>
                                        </button>
                                    </div>
                                </div>

                                <div>
                                    <label class="auth-label" for="password_confirmation">Confirmer</label>
                                    <div class="auth-input-wrap">
                                        <input type="password" id="password_confirmation" name="password_confirmation" class="auth-input" style="padding-left:16px;" placeholder="Confirmer le mot de passe" required>
                                    
                                        <button type="button" class="pw-toggle" data-target="password_confirmation"
                                            aria-label="Afficher le mot de passe" title="Afficher / masquer">
                                            <svg class="pw-eye" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>
                                            </svg>
                                            <svg class="pw-eye-off" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                style="display:none;">
                                                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
                                                <line x1="1" y1="1" x2="23" y2="23"/>
                                            </svg>
                                        </button>
                                    </div>
                                </div>

                                <button type="submit" class="auth-btn-login">Réinitialiser</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script>
    // Show / hide password. Icons swap between eye and eye-off.
    document.querySelectorAll('.pw-toggle').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var input = document.getElementById(btn.dataset.target);
            if (!input) return;
            var show = input.type === 'password';
            input.type = show ? 'text' : 'password';
            btn.querySelector('.pw-eye').style.display = show ? 'none' : '';
            btn.querySelector('.pw-eye-off').style.display = show ? '' : 'none';
            btn.setAttribute('aria-label', show ? 'Masquer le mot de passe' : 'Afficher le mot de passe');
            input.focus();
        });
    });
</script>
@endsection
