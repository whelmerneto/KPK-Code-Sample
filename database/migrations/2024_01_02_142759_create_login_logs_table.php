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
        Schema::connection('master')->create('login_logs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tenant_id');
            $table->uuid('user_id');
            $table->string('browser')->nullable();
            $table->string('ip')->nullable();
            $table->string('os')->nullable();
            $table->foreign('tenant_id')->references('id')->on('tenant_users');
            $table->foreign('user_id')->references('id')->on('plataforma.users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('master')->dropIfExists('login_logs');
    }
};
