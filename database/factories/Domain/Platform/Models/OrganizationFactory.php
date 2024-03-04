<?php

namespace Database\Factories\Domain\Platform\Models;

use Domain\Platform\Models\Organization;
use Illuminate\Database\Eloquent\Factories\Factory;

class OrganizationFactory extends Factory
{
    protected $model = Organization::class;

    public function definition(): array
    {

        return [
            'name' => $this->faker->company,
            'description' => $this->faker->sentence,
            'active' => $this->faker->boolean,
            'accepted_term' => $this->faker->boolean,
        ];
    }

    public function active(): self
    {
        return $this->state(function (array $attributes) {
            return [
                'active' => true,
            ];
        });
    }

    public function inactive(): self
    {
        return $this->state(function (array $attributes) {
            return [
                'active' => false,
            ];
        });
    }
}
