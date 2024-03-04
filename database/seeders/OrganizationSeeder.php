<?php

namespace Database\Seeders;

use Domain\Platform\Models\Organization;
use Domain\User\Models\User;
use Illuminate\Database\Seeder;

class OrganizationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::first();
        Organization::create([
            'owner_id' => $user->id,
            'name' => 'Organização Teste',
            'active' => true,
            'accepted_term' => true,
        ]);
    }
}
