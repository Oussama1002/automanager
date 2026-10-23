<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('annonces', function (Blueprint $table) {
            $table->string('pack')->nullable(); // ou ->default('pack1') si tu veux un pack par défaut
        });
    }
    
    public function down()
    {
        Schema::table('annonces', function (Blueprint $table) {
            $table->dropColumn('pack');
        });
    }
    
    /**
     * Reverse the migrations.
     */
 
};
