<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableModifyColumnSubtitleNullable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('plataforma')->table('ead_banner_customs', function (Blueprint $table) {
            $table->string('subtitle', 350)->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection('mysql_slave')->table('ead_banner_customs', function (Blueprint $table) {
            $table->string('subtitle', 250)->change();
        });
    }
}
