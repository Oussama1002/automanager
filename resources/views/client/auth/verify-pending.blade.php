@extends('layouts.auth')

@section('content')
<style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    .auth-page {
        min-height: 100vh;
        min-height: 100dvh;
        display: flex;
        flex-direction: column;
        background: #f8fafc;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        position: relative;
    }

    .auth-grid-bg {
        position: fixed;
        inset: 0;
        opacity: 0.03;
        pointer-events: none;
        background-image:
            linear-gradient(#0E0F12 1px, transparent 1px),
            linear-gradient(90deg, #0E0F12 1px, transparent 1px);
        background-size: 32px 32px;
        z-index: 0;
    }

    .auth-z { position: relative; z-index: 1; }

    .verify-wrap {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 40px 20px;
    }

    .verify-card {
        width: 100%;
        max-width: 520px;
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 10px 40px rgba(20, 89, 221, 0.08);
        padding: 48px 40px;
        text-align: center;
        border: 1px solid #e2e8f0;
    }

    .verify-icon {
        width: 72px;
        height: 72px;
        margin: 0 auto 24px;
        border-radius: 50%;
        background: linear-gradient(135deg, #0E0F12, #C8A24B);
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
    }

    .verify-icon svg { width: 36px; height: 36px; }

    .verify-title {
        font-size: 24px;
        font-weight: 700;
        color: #0f172a;
        margin-bottom: 12px;
    }

    .verify-email {
        color: #0E0F12;
        font-weight: 600;
    }

    .verify-text {
        color: #475569;
        line-height: 1.6;
        font-size: 15px;
        margin-bottom: 24px;
    }

    .verify-alert {
        padding: 12px 16px;
        border-radius: 10px;
        font-size: 14px;
        margin-bottom: 20px;
        text-align: left;
    }

    .verify-alert.success {
        background: #ecfdf5;
        color: #065f46;
        border: 1px solid #a7f3d0;
    }

    .verify-alert.error {
        background: #fef2f2;
        color: #991b1b;
        border: 1px solid #fecaca;
    }

    .verify-actions {
        display: flex;
        flex-direction: column;
        gap: 12px;
        margin-top: 24px;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        padding: 12px 20px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 15px;
        text-decoration: none;
        border: none;
        cursor: pointer;
        transition: all 0.2s;
    }

    .btn-primary {
        background: #0E0F12;
        color: #fff;
    }

    .btn-primary:hover { background: #0f47b8; }

    .btn-ghost {
        background: transparent;
        color: #0E0F12;
        border: 1px solid #cbd5e1;
    }

    .btn-ghost:hover { background: #f1f5f9; }

    .verify-hint {
        margin-top: 20px;
        font-size: 13px;
        color: #64748b;
    }

    .verify-hint a {
        color: #0E0F12;
        text-decoration: none;
        font-weight: 500;
    }

    .verify-hint a:hover { text-decoration: underline; }
</style>

<div class="auth-page">
    <div class="auth-grid-bg"></div>

    <div class="verify-wrap auth-z">
        <div class="verify-card">
            <div class="verify-icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l9 6 9-6M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
            </div>

            <h1 class="verify-title">Vérifiez votre adresse e-mail</h1>

            <p class="verify-text">
                Un lien de confirmation vient d'être envoyé
                @auth('client')
                    à <span class="verify-email">{{ auth('client')->user()->email }}</span>.
                @else
                    à votre adresse e-mail.
                @endauth
                <br>
                Cliquez sur ce lien pour activer votre compte.
            </p>

            @if (session('status'))
                <div class="verify-alert success">{{ session('status') }}</div>
            @endif

            @if (session('error'))
                <div class="verify-alert error">{{ session('error') }}</div>
            @endif

            <div class="verify-actions">
                @if (Route::has('client.verify.resend'))
                    <form method="POST" action="{{ route('client.verify.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-primary" style="width:100%;">
                            Renvoyer l'e-mail de confirmation
                        </button>
                    </form>
                @endif

                @if (Route::has('client.login'))
                    <a href="{{ route('client.login') }}" class="btn btn-ghost">
                        Retour à la connexion
                    </a>
                @endif
            </div>

            <p class="verify-hint">
                Vous n'avez pas reçu l'e-mail ? Pensez à vérifier votre dossier spam ou courrier indésirable.
            </p>
        </div>
    </div>
</div>
@endsection
