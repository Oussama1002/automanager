<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('discussion_messages', function (Blueprint $table) {
            if (!Schema::hasColumn('discussion_messages', 'type')) {
                $table->string('type')->default('text')->after('message');
            }
            if (!Schema::hasColumn('discussion_messages', 'attachment')) {
                $table->string('attachment')->nullable()->after('type');
            }
        });
    }
    public function down(): void {
        Schema::table('discussion_messages', function (Blueprint $table) {
            $table->dropColumn(['type', 'attachment']);
        });
    }
};
