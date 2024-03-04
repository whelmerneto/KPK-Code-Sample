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
        Schema::connection('plataforma')->create('checkouts_available', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('url_image');
            $table->boolean('manageable');
            $table->boolean('recurrent');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('plataforma')->dropIfExists('checkouts_available');
    }
};
