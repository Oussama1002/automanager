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
        Schema::create('ventes', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('phone');
            $table->string('city');
            $table->string('mark');
            $table->string('modele');
            $table->integer('year');
            $table->integer('km');
            $table->string('carburant');
            $table->string('box');
            $table->string('etat');
            $table->string('type');
            $table->string('origine');
            $table->string('jeveux');
            $table->string('mode');
            $table->string('img_avant');
            $table->string('img_derriere');
            $table->string('img_cartegrise');
            $table->date('rendezvous');
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
        Schema::dropIfExists('ventes');
    }
};
