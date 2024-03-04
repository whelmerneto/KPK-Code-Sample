<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddingColumnsToPointsRewards extends Migration
{
    public function up(): void
    {
        Schema::connection('plataforma')->table('points_rewards', function (Blueprint $table) {
            $table->enum('reward_type', ['quiz', 'score', 'class'])->default('score')->after('animation');
            $table->char('class_id', 36)->nullable()->after('tenant_id');
            $table->foreign('class_id')->references('id')->on('ead_classes')->onDelete('cascade');
            $table->unsignedBigInteger('quiz_id')->unsigned()->nullable()->after('tenant_id');
            $table->foreign('quiz_id')->references('id')->on('quiz')->onDelete('cascade');
            $table->integer('needed_score')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::connection('plataforma')->table('points_rewards', function (Blueprint $table) {
            $table->dropForeign(['class_id']);
            $table->dropForeign(['quiz_id']);
            $table->dropColumn('reward_type');
            $table->dropColumn('class_id');
            $table->dropColumn('quiz_id');
        });
    }

};
