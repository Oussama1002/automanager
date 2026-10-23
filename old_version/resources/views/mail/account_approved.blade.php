<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Activation de compte</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 20px;">
    <div style="max-width: 600px; margin: auto; background-color: white; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
        <h2 style="color: #003b87;">Bonjour {{ $name }},</h2>

        <p>Votre compte client sur <strong>Nado.ma</strong> a été vérifié et activé par notre équipe.</p>

        <p>Vous pouvez désormais vous connecter et profiter de nos services 🚗</p>

        <br>
        <a href="{{ route('client.login') }}" style="display:inline-block; background-color: #003b87; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">Se connecter</a>

        <br><br>
        <p style="font-size: 12px; color: #999;">Si vous n'êtes pas à l'origine de cette demande, merci de nous contacter immédiatement.</p>

        <p style="margin-top: 30px;">L'équipe Nado.ma</p>
    </div>
</body>
</html>
