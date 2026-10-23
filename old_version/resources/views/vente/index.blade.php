@extends('layouts.app')

@section('title', 'Vente de véhicule')

@section('content')
<style>
    .vente-container {
        text-align: center;
        margin: 50px auto;
        max-width: 800px;
    }

    .vente-container h3 {
        color: #003b87;
        font-size: 22px;
        margin-bottom: 20px;
    }

    .vente-container p {
        font-size: 16px;
        line-height: 1.6;
        color: #333;
        margin-bottom: 20px;
    }

    .vente-btn {
        background-color: #003b87;
        color: yellow;
        padding: 15px 30px;
        text-decoration: none;
        font-weight: bold;
        border-radius: 8px;
        display: inline-block;
        margin-top: 20px;
    }

    .vente-advantages {
        text-align: left;
        margin-top: 40px;
        color: #444;
        font-size: 14px;
        line-height: 1.6;
    }
</style>

<div class="vente-container">
    <h3>Je vends ma voiture : quelle est la procédure ?</h3>

    <p>
        Le marché automobile actuel est dynamique et changeant, influencé par divers facteurs. Vendre sa voiture avec Nado.ma présente des avantages considérables en termes de sécurité et de rapidité.
        <br><br>🔍 Évaluation en ligne gratuite<br>
        La première étape pour vendre un véhicule est d’estimer sa valeur actuelle. Pour connaître la cote de votre véhicule, optez pour notre outil de cotation. Il vous suffit de fournir les détails de votre véhicule.
        <br><br>🅰️ Rendez-vous en agence nado.ma<br>
        Exposer votre véhicule vous fait bénéficier de : évaluation détaillée et transparente, préparation de votre véhicule et une visibilité optimale.
        <br><br>💶 Paiement sécurisé et rapide<br>
        Le paiement est effectué directement chez nado.ma pour assurer une transaction rapide et fiable. Vendez votre voiture simplement !
    </p>

    <a href="{{ route('vente.form') }}" class="vente-btn">Vendre ma voiture ></a>

    <div class="vente-advantages">
        <h4>Les Avantages du Dépôt-Vente AUTO ENCHÈRE :</h4>
        <ul>
            <li>Gain de Temps et Zéro Contrainte : Nous nous occupons de tout, vous n’avez qu’à déposer votre véhicule.</li>
            <li>Sécurité Optimale : Plus de rendez-vous avec des inconnus ou de risques liés aux paiements.</li>
            <li>Meilleur Prix de Vente : Grâce à notre réseau, nous vous aidons à vendre au juste prix du marché.</li>
            <li>Visibilité Accrue : Diffusion professionnelle et ciblée de votre annonce.</li>
            <li>Expertise Professionnelle : 20 ans d’expérience pour une vente réussie.</li>
        </ul>
    </div>
</div>
@endsection
