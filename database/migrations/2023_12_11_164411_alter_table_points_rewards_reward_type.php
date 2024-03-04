<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        DB::statement("ALTER TABLE plataforma.points_rewards MODIFY reward_type ENUM('quiz', 'score', 'lesson') DEFAULT 'score'");
    }

    public function down()
    {
        DB::statement("ALTER TABLE plataforma.points_rewards MODIFY reward_type ENUM('quiz', 'score', 'lesson')");
    }
};
