<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PlanSeeder extends Seeder
{
    use App\Models\Plan;

public function run()
{
    Plan::create([
        'name' => 'Pack Distance',
        'price' => 199,
        'features' => [
            "Service à distance",
            "1 fois/J renouvellement pendant 10J",
            "Publication sur (nado.ma-avito.ma-moteur.ma)",
            "Annonce normale",
            "Appel direct",
            "Vos coordonnées visibles",
            "Assistance"
        ]
    ]);

    Plan::create([
        'name' => 'Pack Express',
        'price' => 299,
        'features' => [
            "Service de mobilité",
            "2 fois/J renouvellement pendant 15J",
            "Publication sur (nado.ma-avito.ma-moteur.ma)",
            "Vidéo YouTube présentation de voiture",
            "Contrôle général",
            "Expertise",
            "Rendez-vous",
            "Accompagnement"
        ]
    ]);

    Plan::create([
        'name' => 'Pack Showroom',
        'price' => 499,
        'features' => [
            "Service local Personnalisé",
            "3 fois/J renouvellement pendant 30J",
            "Publication sur (nado.ma-avito.ma-moteur.ma)",
            "Signature Nado.ma",
            "Badge de garantie",
            "Reels professionnel",
            "Vidéo YouTube professionnel",
            "Contrôle général",
            "Expertise",
            "Entretien esthétique auto",
            "Annonce personnalisée",
            "Exposition au showroom 1 semaine",
            "Rendez-vous",
            "Accompagnement"
        ]
    ]);
}

}
