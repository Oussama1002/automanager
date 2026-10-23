<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
       Schema::create('nado_auto_encheres_bid', function (Blueprint $table) {
    $table->id();
    $table->unsignedBigInteger('enchere_id');
    $table->unsignedBigInteger('client_id');
    $table->decimal('proposition', 10, 2);
    $table->timestamps();

    // Correct foreign keys
    $table->foreign('enchere_id')
          ->references('id')
          ->on('nado_auto_encheres') // plural
          ->onDelete('cascade');

    $table->foreign('client_id')
          ->references('id')
          ->on('clients')
          ->onDelete('cascade');
});

    }

    public function down(): void
    {
        Schema::dropIfExists('nado_auto_encheres_bid');
    }
};
