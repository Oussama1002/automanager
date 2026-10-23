<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Nouvelle offre sur AUTO ENCHERE</title>
</head>
<body style="font-family: Arial, sans-serif; color: #333;">
    <p>Bonjour,</p>

    <p>Une nouvelle offre a été placée sur la plateforme AUTO ENCHERE.</p>

    <h3>Détails de l'offre :</h3>
    <ul>
        <li><strong>Véhicule :</strong> {{ $enchere->brand?->name }} {{ $enchere->modeleRelation?->name }} ({{ $enchere->immat ?? 'N/A' }}) / Client : {{ $enchere->phone ?? 'N/A' }}</li>
        <li><strong>Enchérisseur :</strong> {{ $client->name ?? 'Utilisateur inconnu' }}</li>
        <li><strong>Prix de l'offre :</strong> {{ number_format($montant, 0, ',', ' ') }} MAD</li>
    </ul>

    <p>Pour consulter les détails de l'enchère et gérer les offres, veuillez vous connecter à votre tableau de bord administrateur.</p>

    <p>Cordialement,<br>
    L'équipe <strong>AUTO ENCHERE</strong></p>
</body>
</html>
