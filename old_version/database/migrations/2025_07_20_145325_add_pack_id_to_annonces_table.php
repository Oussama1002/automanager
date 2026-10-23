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
        $table->unsignedBigInteger('pack_id')->nullable()->after('phone');

        $table->foreign('pack_id')->references('id')->on('packs')->onDelete('set null');
    });
}

public function down()
{
    Schema::table('annonces', function (Blueprint $table) {
        $table->dropForeign(['pack_id']);
        $table->dropColumn('pack_id');
    });
}

};
