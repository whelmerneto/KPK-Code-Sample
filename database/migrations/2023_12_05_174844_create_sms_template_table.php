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
        Schema::create('sms_template', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('text', 160);
            $table->foreignId('organization_id')->nullable()->constrained('master.organizations');
            $table->foreignId('event_id')->constrained('mensageria.event');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sms_template');
    }
};
