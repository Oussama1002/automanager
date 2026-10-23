@extends('layouts.app')

@section('title', 'Reprise de véhicule')

@section('content')
<style>
    .reprise-container {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        gap: 40px;
        margin: 60px auto;
        max-width: 1200px;
        padding: 0 20px;
        flex-wrap: wrap;
    }

    .box {
        width: 400px;
        background-color: #ffd900;
        color: #003b87;
        padding: 30px;
        border-radius: 30px;
        font-size: 16px;
        line-height: 1.5;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .box h3 {
        font-size: 20px;
        margin-bottom: 15px;
    }

    .box.right {
        background-color: #003b87;
        color: white;
    }

    .reprise-btn {
        display: inline-block;
        margin: 40px auto 0;
        background-color: #003b87;
        color: #ffd900;
        font-weight: bold;
        padding: 15px 30px;
        border-radius: 0 30px 0 0;
        font-size: 20px;
        text-decoration: none;
        transition: 0.3s ease;
    }

    .reprise-btn:hover {
        background-color: #002d66;
    }
</style>

<div class="reprise-container">
    <div class="box">
        <h3>Reprise de votre véhicule avec Automanager :<br>Simple, Rapide, Transparent !</h3>
        <p>
            Vous envisagez d’acheter un nouveau véhicule et souhaitez vous séparer de votre voiture actuelle sans traces ?<br>
            Chez Automanager, nous vous facilitons la vie grâce à notre service de reprise simple, rapide et entièrement transparent.<br>
            Oubliez les annonces, les rendez-vous avec des inconnus et les négociations interminables !
        </p>
    </div>

    <div class="box right">
        <h3>Rendez-vous dans notre show-room<br>pour une expertise détaillée</h3>
        <p>
            Un expert Automanager procédera à une inspection approfondie et gratuite de votre véhicule :
            <ul>
                <li>✔️ Vérification technique (moteur, boîte, freins, pneus, etc.)</li>
                <li>✔️ Examen de la carrosserie et de l’intérieur</li>
                <li>✔️ Test routier pour évaluer le comportement du véhicule</li>
                <li>✔️ Vérification des documents (carte grise, carnet d’entretien, contrôle technique, etc.)</li>
            </ul>
            Cette expertise nous permet de confirmer l’état réel de votre véhicule et d’affiner notre offre de reprise.
        </p>
    </div>
</div>

<div style="text-align:center;">
    <a href="{{ route('reprise.form') }}" class="reprise-btn">Reprise ></a>
</div>
@endsection
