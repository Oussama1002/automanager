<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('entretiens', function (Blueprint $table) {
            $table->id();
            $table->foreignId('annonce_id')->constrained()->onDelete('cascade');
            $table->date('date')->nullable();
            $table->string('revision')->nullable();
            $table->string('entretien')->nullable();
            $table->string('reparation')->nullable();
            $table->string('carrosserie')->nullable();
            $table->string('professionnels')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('entretiens');
    }
};
