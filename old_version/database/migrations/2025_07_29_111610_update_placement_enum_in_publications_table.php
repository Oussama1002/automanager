<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement("ALTER TABLE publications MODIFY placement ENUM(
            'left-banner', 
            'right-banner', 
            'center-banner',
            'first-banner',
            'second-banner',
            'third-banner'
        ) DEFAULT 'center-banner'");
    }
    
    public function down(): void
    {
        DB::statement("ALTER TABLE publications MODIFY placement ENUM(
            'left-banner', 
            'right-banner', 
            'center-banner'
        ) DEFAULT 'center-banner'");
    }
};
