<?php

use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('sms_packages', function ($table) {
            $table->dropColumn('last_reset_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sms_packages', function ($table) {
            $table->datetime('last_reset_at')->default(now());
        });
    }
};
