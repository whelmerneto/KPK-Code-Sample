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
        Schema::table('sms_history', function (Blueprint $table) {
            $table->foreignId('sms_template_id')->constrained('sms_template')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sms_history', function (Blueprint $table) {
            $table->dropForeign(['sms_template_id']);
        });
    }
};
