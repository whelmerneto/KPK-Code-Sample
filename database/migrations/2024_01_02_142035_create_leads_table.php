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
        Schema::connection('plataforma')->create('leads', function (Blueprint $table) {
            $table->id();
            $table->string('email');
            $table->foreignUuid('product_id')->constrained('plataforma.ead_subscription_package');
            $table->unsignedInteger('role_id');
            $table->foreign('role_id')->references('id')->on('plataforma.roles');
            $table->enum('origin', ['WebHook', 'CSV', 'API', 'Manual', 'Staff', 'Integração', 'Outros']);
            $table->timestamps();
            $table->timestamp('accession_date')->nullable();
            $table->foreignUuid('user_id')->nullable()->constrained('plataforma.users');
            //Dados para Pré-preencher no Cadastro
            $table->string('name')->nullable();
            $table->string('phone')->nullable();
            $table->string('cpf')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::connection('plataforma')->dropIfExists('leads');
    }
};
