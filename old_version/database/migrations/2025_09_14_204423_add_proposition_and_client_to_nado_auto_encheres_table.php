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
    Schema::table('nado_auto_encheres', function (Blueprint $table) {
        $table->unsignedBigInteger('client_id')->nullable()->after('id');
        $table->string('proposition')->nullable()->after('client_id');

        $table->foreign('client_id')->references('id')->on('clients')->onDelete('set null');
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('nado_auto_encheres', function (Blueprint $table) {
            //
        });
    }
};
