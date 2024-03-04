<?php

namespace Database\Factories\Domain\TenantUser\Models;

use Domain\Platform\Models\Organization;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Database\Eloquent\Factories\Factory;

class TenantUserFactory extends Factory
{
    protected $model = TenantUser::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'organization_id' => Organization::factory(),
            'name' => $this->faker->text(191),
            'description' => $this->faker->text,
            'address' => $this->faker->text,
        ];
    }
}
