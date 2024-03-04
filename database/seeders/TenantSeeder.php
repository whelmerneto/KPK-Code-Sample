<?php

namespace Database\Seeders;

use Domain\Platform\Models\Organization;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Database\Seeder;

class TenantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $organization = Organization::first();
        TenantUser::create([
            'organization_id' => $organization->id,
            'name' => 'Themembers',
            'description' => 'Themembers',
            'active' => true,
        ]);
    }
}
