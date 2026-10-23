<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('financements', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('phone');
            $table->string('city');
            $table->string('mark');
            $table->string('modele');
            $table->integer('year');
            $table->string('situationprof');
            $table->string('revenusmensuels');
            $table->string('creditsencours');
            $table->string('duree');
            $table->string('prixcar');
            $table->string('montant');
            $table->string('mensualites');
            $table->string('creditsdh');
            $table->string('email');
            $table->date('rendezvous');
            $table->string('cin');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('financements');
    }
};
