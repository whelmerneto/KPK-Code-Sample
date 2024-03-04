<?php

namespace Database\Seeders;

use Domain\User\Enums\Roles;
use Domain\User\Models\User;
use Domain\User\Models\UserRole;
use Illuminate\Database\Seeder;

class UserRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $student = User::where('email', '=', 'aluno@teste.com')->first();
        $admin = User::where('email', '=', 'admin@teste.com')->first();
        UserRole::create([
            'user_id' => $admin->id,
            'tenant_id' => $admin->tenant_id,
            'role_id' => Roles::Admin
        ]);
        UserRole::create([
            'user_id' => $student->id,
            'tenant_id' => $student->tenant_id,
            'role_id' => Roles::Student
        ]);
    }
}
