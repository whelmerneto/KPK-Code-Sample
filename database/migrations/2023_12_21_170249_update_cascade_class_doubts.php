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
        Schema::table('plataforma.class_doubts', function (Blueprint $table) {
            // Adiciona a opção onDelete('cascade') nas chaves estrangeiras
            $table->dropForeign('plataforma_class_doubts_user_id_foreign');
            $table->dropForeign('plataforma_class_doubts_class_id_foreign');
            $table->foreign('user_id')->references('id')->on('plataforma.users')->onDelete('cascade');
            $table->foreign('class_id')->references('id')->on('plataforma.ead_classes')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Não é necessário alterações na reversão da migration neste caso
    }
};
