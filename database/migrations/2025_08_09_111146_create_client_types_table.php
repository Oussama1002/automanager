<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('client_types', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique(); // e.g. "Retraité"
            $table->decimal('taux_interet', 5, 2); // e.g. 13.50
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('client_types');
    }
};

