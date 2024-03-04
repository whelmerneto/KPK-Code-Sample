<?php

namespace Database\Factories\Domain\User\Models;

use Domain\TenantUser\Models\TenantUser;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    protected $model = User::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $tenant = TenantUser::first();
        return [
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'email_verified_at' => now(),
            'password' => bcrypt('password'), // You can change the default password here
            'remember_token' => Str::random(10),
            'document' => rand(10000, 99999),
            'person_type' => 'fisica',
            'tenant_id' => $tenant->id,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
