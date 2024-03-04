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
            $table->timestamp('last_reset_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sms_packages', function ($table) {
            $table->dropColumn('last_reset_at');
        });
    }
};
