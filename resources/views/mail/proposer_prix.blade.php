<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Votre Offre sur AUTO ENCHERE</title>
</head>
<body style="font-family: Arial, sans-serif; color: #333;">
    <p>Objet : Votre Offre sur AUTO ENCHERE : <strong>{{ $enchere->id }}</strong> - <strong>{{ $enchere->brand?->name }} {{ $enchere->modeleRelation?->name }}</strong> - Merci de votre participation !</p>

    <p>Cher(ère) {{ $client->name }},</p>

    <p>Nous vous remercions sincèrement pour l'intérêt que vous portez au véhicule <strong>Réf. {{ $enchere->id }} / {{ $enchere->brand?->name }} {{ $enchere->modeleRelation?->name }}</strong> et pour votre offre déposée sur la plateforme AUTO ENCHERE.</p>

    <p>Votre offre de <strong>{{ number_format($montant, 0, ',', ' ') }} MAD</strong> a été enregistrée avec succès.</p>

    <h3>🔹 Prochaines étapes : Suivez l'évolution de l'enchère</h3>
    <p>L'enchère pour ce véhicule est en cours et se clôturera le <strong>{{ \Carbon\Carbon::parse($enchere->ends_at)->format('d/m/Y H:i') }}</strong>.</p>

    <p>👉 <a href="{{ route('nadoautoenchere.show', $enchere->id) }}">Cliquez ici pour suivre l'évolution de l'enchère</a></p>

    <h3>ℹ️ Information Importante : En cas d'offre gagnante</h3>
    <p>Si votre offre est la plus élevée à la clôture de l'enchère, notre équipe vous contactera dans les 48 heures suivant la fin de l'enchère pour organiser la finalisation de l'achat.</p>

    <p>Un délai de 48 heures est alloué pour répondre et confirmer votre intention d'achat après notre prise de contact. Au-delà, votre offre sera considérée comme annulée.</p>

    <p>Consultez nos <a href="#">Conditions Générales de Vente</a> pour plus de détails.</p>

    <p>Cordialement,<br>
    <strong>L'équipe AUTO ENCHERE</strong><br>
    <a href="#">www.autoenchere.ma</a><br>
    <a href="mailto:support@autoenchere.ma">support@autoenchere.ma</a></p>
</body>
</html>
