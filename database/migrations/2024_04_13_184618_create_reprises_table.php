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
        Schema::create('reprises', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('city');
            $table->string('mark');
            $table->string('modele');
            $table->string('phone');
            $table->string('email');
            $table->string('contacte');
            $table->timestamp('rendezvous');
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
        Schema::dropIfExists('reprises');
    }
};
