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
        Schema::create('plataforma.class_doubts', function (Blueprint $table) {
            $table->id();
            $table->uuid('user_id');
            $table->uuid('class_id');
            $table->foreign('user_id')->references('id')->on('plataforma.users');
            $table->foreign('class_id')->references('id')->on('plataforma.ead_classes');
            $table->text('student_doubt');
            $table->text('response');
            $table->dateTime('answer_date');
            $table->boolean('doubt_public');
            $table->boolean('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plataforma.class_doubts');
    }
};
