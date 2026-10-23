@extends('layouts.auth')

@section('content')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<div class="register-page">
    <div class="register-container">
        <div class="form-header">
            <h2><i class="fa-solid fa-rocket" style="color:#FFD700"></i> Bienvenue sur Nado</h2>
            <p>Créez un compte pour commencer à publier vos annonces</p>
        </div>

        <form method="POST" action="{{ route('client.register') }}" class="register-form" enctype="multipart/form-data">
            @csrf

            <div class="form-group">
                <label class="sr-only" for="clientType">Type de client</label>
                <select name="type" id="clientType" required>
                    <option value="" disabled selected>Type de client</option>
                    <option value="particulier">Particulier</option>
                    <option value="pro">Professionnel</option>
                    <option value="flotte&enchere">Flotte & Enchere</option>
                </select>
            </div>

            <div class="form-group">
                <i class="fa-solid fa-user form-icon" aria-hidden="true"></i>
                <input type="text" name="name" placeholder="Nom complet" required>
            </div>

            {{-- Entreprise fields (shown only for Pro & Flotte) --}}
            <div class="form-group entreprise-field">
                <i class="fa-solid fa-building form-icon" aria-hidden="true"></i>
                <input type="text" name="company" placeholder="Nom de l’entreprise">
            </div>

            <div class="form-group">
                <i class="fa-solid fa-envelope form-icon" aria-hidden="true"></i>
                <input type="email" name="email" placeholder="Adresse e-mail" required>
            </div>

            <div class="form-group">
                <i class="fa-solid fa-phone form-icon" aria-hidden="true"></i>
                <input type="number" name="phone" placeholder="Téléphone" required>
            </div>

            {{-- Logo entreprise (Pro & Flotte) --}}
            <div class="form-group entreprise-field">
                <label for="logo" id="logoLabel"><i class="fa-solid fa-image form-icon-inline" aria-hidden="true"></i> Logo de l’entreprise</label>
                <input type="file" name="logo" id="logo" accept="image/*">
            </div>

            {{-- Logo particulier (hidden by default) --}}
            <div class="form-group particulier-field" style="display:none;">
                <label for="logo_particulier"><i class="fa-solid fa-image form-icon-inline" aria-hidden="true"></i> Logo de profil</label>
                <input type="file" name="logo" id="logo_particulier" accept="image/*">
            </div>

            <div class="form-group password-group">
                <i class="fa-solid fa-lock form-icon" aria-hidden="true"></i>
                <input type="password" name="password" id="password" placeholder="Mot de passe" required>
                <button type="button" class="toggle-password" data-target="#password" aria-label="Afficher / Masquer le mot de passe">
                    <i class="fa-solid fa-eye"></i>
                </button>
            </div>

            <div class="form-group password-group">
                <i class="fa-solid fa-key form-icon" aria-hidden="true"></i>
                <input type="password" name="password_confirmation" id="password_confirmation" placeholder="Confirmer le mot de passe" required>
                <button type="button" class="toggle-password" data-target="#password_confirmation" aria-label="Afficher / Masquer la confirmation">
                    <i class="fa-solid fa-eye"></i>
                </button>
            </div>

            @if ($errors->any())
                <div class="error-box">
                    @foreach ($errors->all() as $error)
                        <div>{{ $error }}</div>
                    @endforeach
                </div>
            @endif

            <button type="submit" class="btn-register">S'inscrire</button>

            <div class="register-link">
                Déjà inscrit ? <a href="{{ route('client.login') }}">Se connecter</a>
            </div>
        </form>
    </div>
</div>

<!-- Scripts -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    // Type selection behaviour (particulier vs pro)
    const clientType = document.getElementById('clientType');
    const entrepriseFields = document.querySelectorAll('.entreprise-field');
    const particulierField = document.querySelector('.particulier-field');

    function updateFieldsByType() {
        const type = clientType.value;
        if (type === 'particulier') {
            entrepriseFields.forEach(el => el.style.display = 'none');
            particulierField.style.display = 'block';
        } else {
            entrepriseFields.forEach(el => el.style.display = 'block');
            particulierField.style.display = 'none';
        }
    }

    if (clientType) {
        clientType.addEventListener('change', updateFieldsByType);
        // If there's a preselected value (e.g. after validation error), update on load
        updateFieldsByType();
    }

    // Toggle password visibility for any .toggle-password button
    document.querySelectorAll('.toggle-password').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const targetSelector = this.getAttribute('data-target');
            const input = document.querySelector(targetSelector);
            if (!input) return;
            if (input.type === 'password') {
                input.type = 'text';
                this.querySelector('i').classList.remove('fa-eye');
                this.querySelector('i').classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                this.querySelector('i').classList.remove('fa-eye-slash');
                this.querySelector('i').classList.add('fa-eye');
            }
        });
    });
});
</script>

<style>
/* Background gradient */
.register-page {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    padding: 20px;
}

/* Container */
.register-container {
    background: #fff;
    padding: 40px 35px;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    width: 100%;
    max-width: 450px;
    animation: fadeInUp 0.7s ease;
}

/* Header */
.form-header {
    text-align: center;
    margin-bottom: 25px;
}

.form-header h2 {
    font-size: 26px;
    font-weight: 700;
    color: #222;
    display: flex;
    gap: 10px;
    align-items: center;
    justify-content: center;
}

/* Inputs */
.form-group {
    margin-bottom: 18px;
    position: relative;
}

/* left-aligned icon (yellow) */
.form-icon {
    position: absolute;
    left: 12px;
    top: 50%;
    transform: translateY(-50%);
    color: #FFD700; /* yellow */
    font-size: 16px;
}

/* inline label icon for file labels */
.form-icon-inline {
    margin-right: 8px;
    color: #FFD700;
}

/* make room for icon on the left */
.register-form input,
.register-form select {
    width: 77%;
    padding: 14px 16px;
    padding-left: 44px; /* space for left icon */
    border-radius: 10px;
    border: 1px solid #ddd;
    font-size: 15px;
    background: #f9f9f9;
    transition: all 0.3s ease;
}

/* file inputs and labels should not have huge left padding */
.form-group label {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    font-size: 14px;
}

/* focus style */
.register-form input:focus,
.register-form select:focus {
    border-color: #0072ff;
    background: #fff;
    box-shadow: 0 0 8px rgba(0,114,255,0.3);
    outline: none;
}

/* Button */
.btn-register {
    width: 91%;
    padding: 14px;
    border-radius: 10px;
    border: none;
    background: linear-gradient(135deg, #0072ff, #00c6ff);
    color: #fff;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 10px;
}

.btn-register:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0,114,255,0.4);
}

/* Errors */
.error-box {
    background: #ffe5e5;
    color: #b30000;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 15px;
    font-size: 13px;
}

/* Register link */
.register-link {
    margin-top: 20px;
    text-align: center;
    font-size: 14px;
    color: #444;
}

.register-link a {
    color: #0072ff;
    font-weight: 600;
    text-decoration: none;
}

.register-link a:hover {
    text-decoration: underline;
}

/* Password toggle button (right side) */
.password-group {
    display: flex;
    align-items: center;
    gap: 8px;
}

.password-group input {
    flex: 1;
    padding-right: 44px; /* space for the eye button if needed */
}

/* Eye toggle button */
.toggle-password {
    position: relative;
    background: transparent;
    border: none;
    cursor: pointer;
    font-size: 16px;
    padding: 8px;
    color: #FFD700; /* yellow */
    display: inline-flex;
    align-items: center;
    justify-content: center;
}

/* visually hidden class for accessibility (if needed) */
.sr-only {
    position: absolute !important;
    height: 1px; width: 1px;
    overflow: hidden;
    clip: rect(1px, 1px, 1px, 1px);
    white-space: nowrap;
}

/* Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
@endsection
