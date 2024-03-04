<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRewardDeliverableProducts extends Migration
{
    public function up(): void
    {
        Schema::connection('plataforma')->create('reward_deliverable_products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('reward_id');
            $table->foreign('reward_id')->references('id')->on('points_rewards')->onDelete('cascade');
            $table->char('product_id', 36);
            $table->foreign('product_id')->references('id')->on('ead_subscription_package')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::connection('plataforma')->table('reward_deliverable_products', function (Blueprint $table) {
            $table->dropForeign(['reward_id']);
            $table->dropForeign(['product_id']);
        });
    }
}
