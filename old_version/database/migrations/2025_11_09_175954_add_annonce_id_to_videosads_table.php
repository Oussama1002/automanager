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
    Schema::table('videosads', function (Blueprint $table) {
        $table->unsignedBigInteger('annonce_id')->nullable()->after('id');
        $table->foreign('annonce_id')->references('id')->on('annonces')->onDelete('cascade');
    });
}



    /**

     * Reverse the migrations.

     */

    public function down(): void

    {

        Schema::table('videosads', function (Blueprint $table) {

            //

        });

    }

};

