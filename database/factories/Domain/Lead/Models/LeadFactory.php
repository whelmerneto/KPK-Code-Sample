<?php

namespace Database\Factories\Domain\Lead\Models;

use App\ApiModel;
use Domain\Lead\Models\Lead;
use Domain\Product\Models\Product;
use Domain\User\Enums\Roles;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<ApiModel>
 */
class LeadFactory extends Factory
{
    protected $model = Lead::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'product_id' => Product::factory(),
            'role_id' => Roles::Student->value,
            'origin' => $this->faker->randomElement(['WebHook', 'CSV', 'API', 'Manual', 'Staff', 'Integração']),
        ];
    }
}
