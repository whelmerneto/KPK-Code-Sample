<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::connection('plataforma')->table('reward_deliverable_products', function (Blueprint $table) {
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::connection('plataforma')->table('reward_deliverable_products', function (Blueprint $table) {
            $table->dropTimestamps();
        });
    }
};
