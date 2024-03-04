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
        Schema::connection('plataforma')->table('user_subscription', function (Blueprint $table) {
            $table->enum('cancellation_method', ['Manual', 'Gerenciador de Assinaturas', 'Webhook'])->nullable()->after('cancel_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('plataforma')->table('user_subscription', function (Blueprint $table) {
            $table->dropColumn('cancellation_method');
        });
    }
};
