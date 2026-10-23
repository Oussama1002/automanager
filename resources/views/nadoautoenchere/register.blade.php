@extends('layouts.auth')

@section('content')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<div class="register-page">
    <div class="register-container">
        <div class="form-header">
            <h2><i class="fa-solid fa-gavel" style="color:#C8A24B"></i> Rejoindre les enchères AUTOMANAGER</h2>
            <p>Créez votre compte <strong>Flotte &amp; Enchère</strong> pour participer aux ventes aux enchères.</p>
        </div>

        <form method="POST" action="{{ route("client.register") }}" class="register-form" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="type" value="flotte&enchere">
            <input type="hidden" name="profile" value="{{ $profile }}">

            <div class="form-group">
                <i class="fa-solid fa-user form-icon" aria-hidden="true"></i>
                <input type="text" name="name" placeholder="Nom complet" value="{{ old("name") }}" required>
            </div>

            @if($profile !== "particulier")
            <div class="form-group">
                <i class="fa-solid fa-building form-icon" aria-hidden="true"></i>
                <input type="text" name="company" placeholder="Nom de l'entreprise" value="{{ old("company") }}">
            </div>
            @endif

            <div class="form-group">
                <i class="fa-solid fa-envelope form-icon" aria-hidden="true"></i>
                <input type="email" name="email" placeholder="Adresse e-mail" value="{{ old("email") }}" required>
            </div>

            <div class="form-group">
                <i class="fa-solid fa-phone form-icon" aria-hidden="true"></i>
                <input type="number" name="phone" placeholder="Téléphone" value="{{ old("phone") }}" required>
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

            <button type="submit" class="btn-register">Créer mon compte enchères</button>

            <div class="register-link">
                Déjà inscrit ? <a href="{{ route("nadoautoenchere.login") }}">Se connecter</a>
            </div>
        </form>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.toggle-password').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const input = document.querySelector(this.getAttribute('data-target'));
            if (!input) return;
            const icon = this.querySelector('i');
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        });
    });
});
</script>

<style>
.register-page { min-height: 100vh; display: flex; justify-content: center; align-items: center; background: linear-gradient(135deg, #C8A24B, #0E0F12); padding: 20px; }
.register-container { background: #fff; padding: 40px 35px; border-radius: 16px; box-shadow: 0 15px 35px rgba(0,0,0,0.15); width: 100%; max-width: 460px; animation: fadeInUp 0.7s ease; }
.form-header { text-align: center; margin-bottom: 25px; }
.form-header h2 { font-size: 24px; font-weight: 700; color: #222; display: flex; gap: 10px; align-items: center; justify-content: center; }
.form-header p { color: #555; font-size: 14px; margin-top: 6px; }
.form-group { margin-bottom: 18px; position: relative; }
.form-icon { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #C8A24B; font-size: 16px; }
.register-form input, .register-form select {
    width: 100%;
    padding: 14px 16px;
    padding-left: 44px;
    border-radius: 10px;
    border: 1px solid #ddd;
    font-size: 15px;
    background: #f9f9f9;
    transition: all 0.3s ease;
}
.form-group label { display: inline-flex; align-items: center; gap: 8px; cursor: pointer; font-size: 14px; }
.register-form input:focus { border-color: #C8A24B; background: #fff; box-shadow: 0 0 8px rgba(200,162,75,0.3); outline: none; }
.btn-register { width: 100%; padding: 14px; border-radius: 10px; border: none; background: linear-gradient(135deg, #C8A24B, #ff8a3d); color: #fff; font-size: 16px; font-weight: 700; cursor: pointer; transition: all 0.3s ease; margin-top: 10px; }
.btn-register:hover { transform: translateY(-2px); box-shadow: 0 6px 15px rgba(200,162,75,0.4); }
.error-box { background: #ffe5e5; color: #b30000; padding: 12px; border-radius: 8px; margin-bottom: 15px; font-size: 13px; }
.register-link { margin-top: 20px; text-align: center; font-size: 14px; color: #444; }
.register-link a { color: #C8A24B; font-weight: 600; text-decoration: none; }
.register-link a:hover { text-decoration: underline; }
.password-group input { padding-right: 44px; }
.toggle-password {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    width: 36px;
    height: 36px;
    border-radius: 10px;
    background: transparent;
    border: none;
    cursor: pointer;
    font-size: 16px;
    color: #C8A24B;
    display: inline-flex;
    align-items: center;
    justify-content: center;
}
.toggle-password:hover { background: rgba(200,162,75,0.08); }
@keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
</style>
@endsection
