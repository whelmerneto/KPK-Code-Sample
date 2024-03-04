<?php

namespace Database\Seeders;

use Domain\Deliverable\Models\DeliverablePlatform;
use Illuminate\Database\Seeder;

class BaseTestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->call([
            OrganizationSeeder::class,
            TenantSeeder::class,
            UserSeeder::class,
            UserRoleSeeder::class,
            PopulateCheckoutsAvailable::class,
            ProductSeeder::class,
            DeliverablePlatformSeeder::class,
            UserSubscriptionSeeder::class,
        ]);
    }
}
