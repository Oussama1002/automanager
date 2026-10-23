@extends('layouts.auth')

@section('content')
<style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; background: #f8fafc; }

    .vw-page {
        min-height: 100vh;
        min-height: 100dvh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 24px 16px;
        background: #f8fafc;
        position: relative;
    }

    /* Grid bg */
    .vw-grid {
        position: fixed; inset: 0;
        opacity: 0.03; pointer-events: none;
        background-image: linear-gradient(#0E0F12 1px, transparent 1px), linear-gradient(90deg, #0E0F12 1px, transparent 1px);
        background-size: 32px 32px;
    }

    .vw-card {
        position: relative; z-index: 1;
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 1.5rem;
        padding: 36px 28px;
        width: 100%;
        max-width: 420px;
        box-shadow: 0 8px 32px -8px rgba(148,163,184,0.2);
        text-align: center;
    }
    @media (min-width: 640px) { .vw-card { padding: 48px 40px; } }

    .vw-icon {
        width: 72px; height: 72px;
        background: rgba(20,89,221,0.08);
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        margin: 0 auto 24px;
        color: #0E0F12;
    }

    .vw-card h1 {
        font-size: 22px; font-weight: 900; color: #0f172a;
        letter-spacing: -0.03em; margin-bottom: 8px;
    }
    .vw-card p { font-size: 14px; color: #64748b; font-weight: 500; line-height: 1.6; }

    .vw-alerts { margin: 20px 0 0; }
    .vw-alert {
        padding: 12px 16px; border-radius: 10px;
        font-size: 13px; font-weight: 600; margin-bottom: 10px; text-align: left;
    }
    .vw-alert.success { background: #dcfce7; color: #15803d; }
    .vw-alert.warning { background: #fef9c3; color: #854d0e; }
    .vw-alert.error   { background: #fee2e2; color: #b91c1c; }

    .vw-form { margin-top: 28px; display: flex; flex-direction: column; gap: 16px; }

    .vw-otp-label {
        font-size: 11px; font-weight: 800; color: #334155;
        text-transform: uppercase; letter-spacing: 0.08em;
        display: block; text-align: left; margin-bottom: 8px;
    }

    /* 6-digit OTP input boxes */
    .vw-otp-boxes {
        display: flex; gap: 8px; justify-content: center;
    }
    .vw-otp-box {
        width: 48px; height: 56px;
        border: 1.5px solid #e2e8f0;
        border-radius: 10px;
        font-size: 22px; font-weight: 900; color: #0f172a;
        text-align: center;
        background: #f8fafc;
        outline: none;
        transition: border-color 0.15s, box-shadow 0.15s;
        caret-color: #0E0F12;
    }
    .vw-otp-box:focus {
        border-color: #0E0F12;
        background: #fff;
        box-shadow: 0 0 0 3px rgba(20,89,221,0.15);
    }
    @media (max-width: 360px) {
        .vw-otp-box { width: 40px; height: 48px; font-size: 18px; gap: 6px; }
    }

    /* Hidden real input */
    #otpInput { display: none; }

    .vw-btn-submit {
        width: 100%; padding: 16px;
        background: #0E0F12; color: #fff;
        border: none; border-radius: 10px;
        font-size: 14px; font-weight: 700; text-transform: uppercase;
        letter-spacing: 0.08em; cursor: pointer;
        transition: background 0.15s, transform 0.1s;
        box-shadow: 0 6px 16px -4px rgba(20,89,221,0.3);
        min-height: 48px; font-family: inherit;
    }
    .vw-btn-submit:hover { background: #0d47b4; }
    .vw-btn-submit:active { transform: scale(0.98); }
    .vw-btn-submit:disabled { opacity: 0.5; cursor: not-allowed; }

    .vw-resend {
        margin-top: 4px; font-size: 13px; color: #64748b;
        display: flex; align-items: center; justify-content: center; gap: 6px;
    }
    .vw-resend-btn {
        background: none; border: none; cursor: pointer;
        color: #0E0F12; font-weight: 700; font-size: 13px;
        font-family: inherit; padding: 0; transition: color 0.15s;
    }
    .vw-resend-btn:hover { color: #0d47b4; }
    .vw-resend-btn:disabled { color: #94a3b8; cursor: not-allowed; }

    .vw-back {
        display: inline-flex; align-items: center; gap: 6px;
        margin-top: 20px; color: #94a3b8; font-size: 13px; font-weight: 600;
        text-decoration: none; transition: color 0.15s;
    }
    .vw-back:hover { color: #475569; }

    /* Timer */
    .vw-timer { font-size: 12px; color: #94a3b8; font-weight: 600; }
    #countdown { color: #0E0F12; font-weight: 800; }
</style>

<div class="vw-page">
    <div class="vw-grid"></div>

    <div class="vw-card">
        <div class="vw-icon">
            <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 9.81a19.79 19.79 0 01-3.07-8.64A2 2 0 012 1h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L6.09 8.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 16z"/>
            </svg>
        </div>

        <h1>Vérifiez votre WhatsApp</h1>
        <p>Nous avons envoyé un code à 6 chiffres sur votre numéro WhatsApp.<br>Entrez-le ci-dessous pour activer votre compte.</p>

        {{-- Alerts --}}
        <div class="vw-alerts">
            @if(session('otp_sent'))
                <div class="vw-alert success">{{ session('otp_sent') }}</div>
            @endif
            @if(session('otp_resent'))
                <div class="vw-alert success">{{ session('otp_resent') }}</div>
            @endif
            @if(session('otp_warning'))
                <div class="vw-alert warning">⚠ {{ session('otp_warning') }}</div>
            @endif
            @if($errors->any())
                <div class="vw-alert error">{{ $errors->first() }}</div>
            @endif
        </div>

        {{-- OTP form --}}
        <form class="vw-form" method="POST" action="{{ route('client.verify.whatsapp.submit') }}" id="otpForm">
            @csrf
            <div>
                <span class="vw-otp-label">Code de vérification</span>
                <div class="vw-otp-boxes" id="otpBoxes">
                    <input type="text" class="vw-otp-box" maxlength="1" inputmode="numeric" pattern="[0-9]" autocomplete="one-time-code">
                    <input type="text" class="vw-otp-box" maxlength="1" inputmode="numeric" pattern="[0-9]">
                    <input type="text" class="vw-otp-box" maxlength="1" inputmode="numeric" pattern="[0-9]">
                    <input type="text" class="vw-otp-box" maxlength="1" inputmode="numeric" pattern="[0-9]">
                    <input type="text" class="vw-otp-box" maxlength="1" inputmode="numeric" pattern="[0-9]">
                    <input type="text" class="vw-otp-box" maxlength="1" inputmode="numeric" pattern="[0-9]">
                </div>
                <input type="hidden" name="otp" id="otpInput">
            </div>

            <button type="submit" class="vw-btn-submit" id="submitBtn" disabled>Vérifier mon compte</button>
        </form>

        {{-- Resend --}}
        <form method="POST" action="{{ route('client.verify.whatsapp.resend') }}" id="resendForm">
            @csrf
        </form>
        <div class="vw-resend" style="margin-top:16px;">
            <span>Pas reçu ?</span>
            <button type="button" class="vw-resend-btn" id="resendBtn" disabled onclick="document.getElementById('resendForm').submit()">
                Renvoyer
            </button>
            <span class="vw-timer">(<span id="countdown">60</span>s)</span>
        </div>

        <a href="{{ route('client.login') }}" class="vw-back">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                <line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/>
            </svg>
            Retour à la connexion
        </a>
    </div>
</div>

<script>
(function () {
    var boxes   = Array.from(document.querySelectorAll('.vw-otp-box'));
    var hidden  = document.getElementById('otpInput');
    var submit  = document.getElementById('submitBtn');
    var resend  = document.getElementById('resendBtn');
    var counter = document.getElementById('countdown');

    // Sync hidden input and enable submit when all 6 digits entered
    function syncOtp() {
        var val = boxes.map(function(b){ return b.value; }).join('');
        hidden.value = val;
        submit.disabled = val.length < 6 || !/^[0-9]{6}$/.test(val);
    }

    boxes.forEach(function (box, i) {
        box.addEventListener('input', function (e) {
            // Allow only digits
            this.value = this.value.replace(/\D/g, '').slice(-1);
            if (this.value && i < boxes.length - 1) boxes[i + 1].focus();
            syncOtp();
        });

        box.addEventListener('keydown', function (e) {
            if (e.key === 'Backspace' && !this.value && i > 0) {
                boxes[i - 1].value = '';
                boxes[i - 1].focus();
                syncOtp();
            }
        });

        box.addEventListener('paste', function (e) {
            e.preventDefault();
            var pasted = (e.clipboardData || window.clipboardData).getData('text').replace(/\D/g,'').slice(0,6);
            pasted.split('').forEach(function(ch, j){ if (boxes[j]) boxes[j].value = ch; });
            if (boxes[Math.min(pasted.length, 5)]) boxes[Math.min(pasted.length, 5)].focus();
            syncOtp();
        });
    });

    // Countdown timer for resend
    var secs = 60;
    var timer = setInterval(function () {
        secs--;
        counter.textContent = secs;
        if (secs <= 0) {
            clearInterval(timer);
            resend.disabled = false;
            counter.parentElement.style.display = 'none';
        }
    }, 1000);

    // Focus first box on load
    if (boxes[0]) boxes[0].focus();
})();
</script>
@endsection
