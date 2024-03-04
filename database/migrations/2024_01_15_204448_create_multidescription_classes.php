<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up()
    {
        Schema::connection('plataforma')->create('multidescription_classes', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('lesson_id')->references('id')->on('ead_classes')->onDelete('cascade');
            $table->string('title');
            $table->text('description');
            $table->boolean('status')->default(false);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::connection('plataforma')->dropIfExists('multidescription_classes');
    }
};
