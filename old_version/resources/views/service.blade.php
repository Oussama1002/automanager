@extends('layouts.app')

@section('content')
<div class="bg-white py-12 px-4 sm:px-10 text-gray-800">

    {{-- Intro Section --}}
    <div class="max-w-6xl mx-auto mb-16">
        <h2 class="text-2xl sm:text-3xl font-bold text-center mb-6">
            À Propos de <span class="text-yellow-500">NADO.ma</span> et <span class="text-yellow-500">AUTO ENCHÈRE</span> : Votre Partenaire Automobile de Confiance
        </h2>
        <div class="flex flex-col md:flex-row items-center gap-6">
            <img src="{{ asset('images/service-header.png') }}" alt="voiture clavier" class="w-full md:w-1/2 rounded shadow">
            <p class="text-lg leading-relaxed md:w-1/2">
                Bienvenue sur <strong>NADO.ma</strong>, la plateforme digitale d'<strong>AUTO ENCHÈRE</strong>, votre spécialiste de l'automobile avec des dizaines d'années d'expérience. Depuis plus de 20 ans, nous accompagnons les clients à travers l’expérience d'achat, de vente et d'enchères de véhicules en toute simplicité, transparence et confiance.<br><br>
                Notre équipe met un point d’honneur à vous offrir un accès privilégié à un large choix de véhicules d’occasion et neufs, en alliant expertise technique et accompagnement complet à chaque étape.
            </p>
        </div>
    </div>

    {{-- Pourquoi choisir AUTO ENCHÈRE --}}
    <div class="bg-gray-50 py-16">
        <h3 class="text-2xl sm:text-3xl font-bold text-center text-gray-900 mb-8">
            Pourquoi choisir <span class="text-yellow-500">AUTO ENCHÈRE</span>
        </h3>

        <div class="max-w-3xl mx-auto text-center bg-blue-700 text-white p-6 rounded-md shadow-md mb-12">
            <p class="text-lg">
                Notre équipe expérimentée excelle dans la vente de voitures aux enchères numériques ainsi
                que dans l’accompagnement du marché, fournissant des décisions éclairées et des résultats optimaux.
            </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto px-4 text-center">
            <div class="bg-yellow-400 p-6 rounded-xl shadow-lg">
                <img src="{{ asset('icons/expertise.png') }}" alt="expertise" class="w-12 h-12 mx-auto mb-4">
                <h4 class="font-bold text-lg mb-2">Une expertise éprouvée</h4>
                <p>Des années d'expérience pour vous guider dans l'achat de votre véhicule en toute confiance.</p>
            </div>

            <div class="bg-yellow-400 p-6 rounded-xl shadow-lg">
                <img src="{{ asset('icons/solutions.png') }}" alt="solutions" class="w-12 h-12 mx-auto mb-4">
                <h4 class="font-bold text-lg mb-2">Solutions personnalisées</h4>
                <p>Des services adaptés à vos besoins, que vous soyez particulier ou professionnel.</p>
            </div>

            <div class="bg-yellow-400 p-6 rounded-xl shadow-lg">
                <img src="{{ asset('icons/partenariat.png') }}" alt="partenariats" class="w-12 h-12 mx-auto mb-4">
                <h4 class="font-bold text-lg mb-2">Partenariats transparents</h4>
                <p>Une collaboration basée sur la confiance et la transparence, du premier contact à la livraison.</p>
            </div>
        </div>
    </div>

    {{-- Nos Engagements --}}
    <div class="text-center mt-20 max-w-6xl mx-auto">
        <h3 class="text-2xl sm:text-3xl font-bold text-gray-900 mb-6">
            Nos Engagements : <span class="text-yellow-500">Expertise, Transparence et Confiance</span>
        </h3>
        <p class="text-lg leading-relaxed mb-10 px-4 md:px-0">
            Chez AUTO ENCHÈRE, la confiance est au cœur de notre métier. Nous nous engageons sur une conformité rigoureuse et un accompagnement optimal. Chaque véhicule proposé par NADO.ma est contrôlé, préparé et évalué pour assurer une expérience fiable et sans surprises. Nous assurons le lien entre les vendeurs et acheteurs dans le respect des meilleures pratiques.
        </p>
        <img src="{{ asset('images/blue-car.png') }}" alt="voiture bleue" class="w-full max-w-md mx-auto rounded shadow-md">
    </div>
</div>
@endsection
