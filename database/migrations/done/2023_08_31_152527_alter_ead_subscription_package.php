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
        Schema::connection('plataforma')->table('ead_subscription_package', function (Blueprint $table) {
            $table->after('checkout', function (Blueprint $table) {
                $table->foreignId('checkout_id')
                    ->nullable()
                    ->constrained('checkouts_available');
            });
        });
        DB::connection('plataforma')->statement("ALTER TABLE plataforma.ead_subscription_package MODIFY COLUMN type ENUM('Venda única', 'Recorrente')");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('plataforma')->table('ead_subscription_package', function (Blueprint $table) {
            $table->dropColumn('checkout_id');
        });
        DB::connection('plataforma')->statement('ALTER TABLE ead_subscription_package MODIFY COLUMN type VARCHAR(55)');
    }
};
