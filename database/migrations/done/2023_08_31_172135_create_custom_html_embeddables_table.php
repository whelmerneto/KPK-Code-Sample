<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    protected $connection = 'plataforma';

    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('custom_html_embeddables', function (Blueprint $table) {
            $table->id();
            $table->foreignId('custom_html_id')
                ->constrained('custom_htmls')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();

            $table->string('embeddable_id');
            $table->string('embeddable_type');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('custom_html_embeddables');
    }
};
