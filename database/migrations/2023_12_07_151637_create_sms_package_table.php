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
        Schema::create('sms_packages', function (Blueprint $table) {
            $table->id();
            $table->foreignId('organization_id')->constrained('master.organizations');
            $table->unsignedInteger('contracted_quantity');
            $table->unsignedInteger('used_quantity');
            $table->timestamp('last_reset_at')->default(now());
            $table->timestamp('cancel_date')->nullable()->comment('Populated on the cancellation date of the package');
            $table->softDeletes()->comment('The SmsResetUsedQuantity command checks if the cancel_date is populated at the reset date, then the deleted_at is populated');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sms_packages');
    }
};
