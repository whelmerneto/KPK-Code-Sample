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
        Schema::connection('master')->table('app_subscriptions', function (Blueprint $table) {
            $table->boolean('added_manually')->after('pay_status')->default(false);
            $table->string('checkout_name')->after('pay_status')->default("Não Informado.");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('master')->table('app_subscriptions', function (Blueprint $table) {
            $table->dropColumn('added_manually');
            $table->dropColumn('checkout_name');
        });
    }
};
