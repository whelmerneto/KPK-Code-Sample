<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableModifyColumnSubtitle extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('plataforma')->table('ead_banner_customs', function (Blueprint $table) {
            $table->string('subtitle', 250)->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection('plataforma')->table('ead_banner_customs', function (Blueprint $table) {
            $table->string('subtitle', 191)->change();
        });
    }
}
