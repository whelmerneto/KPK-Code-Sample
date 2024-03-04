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
        Schema::table('plataforma.class_doubts', function (Blueprint $table) {
            $table->uuid('tenant_id')->after('id');
            $table->string('last_update')->nullable()->after('status');
            $table->text('response')->nullable()->change();
            $table->dateTime('deleted_at')->after('updated_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('plataforma.class_doubts', function (Blueprint $table) {
            $table->dropColumn(['tenant_id', 'last_update', 'deleted_at']);
        });
    }
};
