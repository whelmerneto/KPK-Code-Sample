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
        Schema::connection('plataforma')->table('class_doubts', function (Blueprint $table) {
            $table->text('response')->nullable()->change();
            $table->unsignedBigInteger('tenant_id')->change();
            $table->dateTime('answer_date')->nullable()->change();
            $table->string('last_update')->nullable()->change();
            $table->dateTime('deleted_at')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('plataforma')->table('class_doubts', function (Blueprint $table) {
            $table->text('response')->nullable(false)->change();
            $table->uuid('tenant_id')->change();
            $table->dateTime('answer_date')->nullable(false)->change();
            $table->string('last_update')->nullable(false)->change();
            $table->dateTime('deleted_at')->nullable(false)->change();
        });
    }
};
