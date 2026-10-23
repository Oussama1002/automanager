@extends('layouts.auth')

@section('content')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<div class="login-container">
    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    @if($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {{-- Stylish Warning --}}
    @if(session('flotte_enchere_blocked'))
        <div class="custom-warning">
            <i class="fa fa-exclamation-triangle"></i>
            <span>{{ session('flotte_enchere_blocked') }}</span>
        </div>
    @endif

    <h2>Connexion Client</h2>
    <form method="POST" action="{{ route('client.login') }}">
        @csrf
        <input type="email" name="email" placeholder="Adresse e-mail" required>
<div class="password-wrapper">
    <input type="password" name="password" id="password" placeholder="Mot de passe" required>
    <span class="toggle-password" onclick="togglePassword()">
        <i class="fa fa-eye" id="eyeIcon"></i>
    </span>
</div>
<script>
function togglePassword() {
    const passwordInput = document.getElementById("password");
    const eyeIcon = document.getElementById("eyeIcon");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
    } else {
        passwordInput.type = "password";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
    }
}
</script>

        <button type="submit">Se connecter</button>

        <div class="register-link">
            Pas encore inscrit ? <a href="{{ route('client.register') }}">Créer un compte</a>
        </div>
    </form>
</div>

<style>
    .password-wrapper {
    position: relative;
    width: 100%;
}

.password-wrapper input {
    width: 100%;
    padding: 12px 40px 12px 12px; /* Add space for eye */
    border: 1px solid #ddd;
    border-radius: 8px;
    outline: none;
    font-size: 15px;
}

.toggle-password {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #888;
    font-size: 18px;
}

    body {
        background: #f4f7fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .login-container {
        max-width: 420px;
        margin: 50px auto;
        background: #fff;
        padding: 35px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        text-align: center;
        animation: fadeIn 0.6s ease-in-out;
    }

    .login-container h2 {
        margin-bottom: 25px;
        color: #333;
        font-weight: bold;
        font-size: 24px;
    }

    .login-container input {
        width: 100%;
        padding: 12px;
        margin: 12px 0;
        border: 1px solid #ddd;
        border-radius: 8px;
        outline: none;
        font-size: 15px;
        transition: all 0.3s ease;
    }

    .login-container input:focus {
        border-color: #007bff;
        box-shadow: 0 0 6px rgba(0,123,255,0.3);
    }

    .login-container button {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        background: linear-gradient(135deg, #007bff, #0056b3);
        border: none;
        color: #fff;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .login-container button:hover {
        background: linear-gradient(135deg, #0056b3, #004080);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .login-container .register-link {
        margin-top: 20px;
        font-size: 14px;
        color: #555;
    }

    .login-container .register-link a {
        color: #007bff;
        font-weight: bold;
        text-decoration: none;
    }

    .login-container .register-link a:hover {
        text-decoration: underline;
    }

    .alert {
        padding: 12px;
        margin-bottom: 20px;
        border-radius: 8px;
        font-size: 14px;
        text-align: left;
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
    }

    .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
    }

    /* Custom Warning Style */
    .custom-warning {
        display: flex;
        align-items: center;
        gap: 10px;
        background: linear-gradient(135deg, #fff3cd, #ffe8a1);
        color: #856404;
        border: 1px solid #ffeeba;
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 10px;
        font-size: 15px;
        font-weight: 500;
        text-align: left;
        animation: fadeIn 0.5s ease-in-out;
    }

    .custom-warning i {
        font-size: 18px;
        color: #ff9800;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
@endsection
