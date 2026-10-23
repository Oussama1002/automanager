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
    Schema::table('publications', function (Blueprint $table) {
        $table->enum('placement', ['left-banner', 'right-banner', 'center-banner',
        'first-banner',
        'second-banner',
        'third-banner'])->default('center-banner')->after('position');
    });
}

public function down(): void
{
    Schema::table('publications', function (Blueprint $table) {
        $table->dropColumn('placement');
    });
}

};
