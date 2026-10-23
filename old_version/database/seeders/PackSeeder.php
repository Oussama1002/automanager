<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Pack;

class PackSeeder extends Seeder
{
    public function run()
    {
        Pack::insert([
            [
                'name' => 'Pack 1',
                'description' => 'Annonce gratuite sur Nado.ma',
                'price' => 0,
                'duration_days' => 7,
            ],
            [
                'name' => 'Pack 2',
                'description' => '- 199 DH : 1 semaine sur Nado, Avito, et Moteur.ma',
                'price' => 199,
                'duration_days' => 7,
            ],
            [
                'name' => 'Pack 3',
                'description' => '- 299 DH : 15 jours sur Nado, Avito, et Moteur.ma',
                'price' => 299,
                'duration_days' => 15,
            ],
            [
                'name' => 'Pack 4',
                'description' => '- 499 DH : Showroom (voiture exposée en garage) + 30 jours sur Nado, Avito, et Moteur.ma',
                'price' => 499,
                'duration_days' => 30,
            ],
        ]);
    }
}

