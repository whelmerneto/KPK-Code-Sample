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
        Schema::create('sms_history', function (Blueprint $table) {
            $table->id();
            $table->foreignId('organization_id')->constrained('master.organizations');
            $table->foreignUuid('user_id')->constrained('plataforma.users');
            $table->foreignUuid('product_id')->nullable()->constrained('plataforma.ead_subscription_package');
            $table->string('phone')->comment('Phone number used at the moment of the send');
            $table->enum('status', ['pending', 'sent', 'failed'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sms_history');
    }
};
