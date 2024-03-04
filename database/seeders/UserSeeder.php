<?php

namespace Database\Seeders;

use Domain\Invite\Enums\InviteStatusEnum;
use Domain\TenantUser\Models\TenantUser;
use Domain\User\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tenantId = TenantUser::first()->id;
        User::create([
            'name' => 'Usuário admin',
            'email' => 'admin@teste.com',
            'email_verified_at' => now(),
            'password' => bcrypt('password'), // You can change the default password here
            'remember_token' => Str::random(10),
            'document' => rand(10000, 99999),
            'person_type' => 'fisica',
            'tenant_id' => $tenantId,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        User::create([
            'name' => 'Usuário aluno',
            'email' => 'aluno@teste.com',
            'email_verified_at' => now(),
            'password' => bcrypt('password'), // You can change the default password here
            'remember_token' => Str::random(10),
            'document' => rand(10000, 99999),
            'person_type' => 'fisica',
            'tenant_id' => $tenantId,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
