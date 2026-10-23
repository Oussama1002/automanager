<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   // database/migrations/xxxx_xx_xx_add_homepage_fields_to_annonces_table.php
public function up()
{
    Schema::table('annonces', function (Blueprint $table) {
        $table->boolean('show_in_homepage')->default(false);
        $table->integer('homepage_position')->nullable(); // 1, 2, 3 for ordering
    });
}

public function down()
{
    Schema::table('annonces', function (Blueprint $table) {
        $table->dropColumn(['show_in_homepage', 'homepage_position']);
    });
}

};
