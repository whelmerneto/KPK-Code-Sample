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
        Schema::connection('master')->table('template_settings', function (Blueprint $table) {
            $table->boolean('magic_link_enabled')->default(true);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('master')->table('template_settings', function (Blueprint $table) {
            $table->dropColumn('magic_link_enabled');
        });
    }
};
