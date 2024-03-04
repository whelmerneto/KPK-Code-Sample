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
        Schema::table('community_tenants', function (Blueprint $table) {
            Schema::connection('plataforma')->table('community_tenants', function (Blueprint $table) {
                $table->string('logo_image_path')->nullable(true)->after('order');
            });
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('plataforma')->table('community_tenants', function (Blueprint $table) {
            $table->dropColumn('logo_image_path');
        });
    }
};
