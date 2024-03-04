<?php

use Domain\Platform\Enums\PlatformPageEnum;
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
        Schema::table('custom_htmls', function (Blueprint $table) {
            $table->string('title')->after('tenant_id');
            $table->enum('platform_page', array_map(fn (PlatformPageEnum $item) => $item->value, PlatformPageEnum::cases()))->after('title');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('custom_htmls', function (Blueprint $table) {
            $table->dropColumn('title');
            $table->dropColumn('platform_page');
        });
    }
};
