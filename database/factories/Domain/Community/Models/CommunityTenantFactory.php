<?php

namespace Database\Factories\Domain\Community\Models;

use Domain\Community\Models\CommunityTenant;
use Illuminate\Database\Eloquent\Factories\Factory;

class CommunityTenantFactory extends Factory
{
    /**
    The name of the factory's corresponding model.*
    @var class-string<\Illuminate\Database\Eloquent\Model>*/
    protected $model = CommunityTenant::class;

    public function definition()
    {
        return [
            'id' => $this->faker->numberBetween(1, 1000),
            'tenant_id' => $this->faker->numberBetween(1, 1000),
            'title' => $this->faker->words(3, true),
            'description' => $this->faker->sentence,
            'links' => '[]',
            'active' => $this->faker->boolean,
            'show_ranking' => $this->faker->boolean,
            'principal' => $this->faker->boolean,
            'show_continue_watching' => $this->faker->boolean,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
