<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('financement_settings', function (Blueprint $table) {
            $table->id();
            $table->string('key')->unique();
            $table->string('value');
            $table->timestamps();
        });

        // Optional: seed default values on migration
        DB::table('financement_settings')->insert([
            ['key' => 'frais_dossier', 'value' => '4375'],
            ['key' => 'assurance_annuelle', 'value' => '235'],
            ['key' => 'taux_interet_default', 'value' => '13'],
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('financement_settings');
    }
};
