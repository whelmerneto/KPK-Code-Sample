<?php

namespace Database\Seeders;

use Domain\Deliverable\Models\DeliverablePlatform;
use Domain\Product\Models\Product;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TestInviteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $deliverable = DeliverablePlatform::factory()->count(1)->create();

        $this->call([
            TenantSeeder::class,
            InviteSeeder::class,
        ]);
    }
}
