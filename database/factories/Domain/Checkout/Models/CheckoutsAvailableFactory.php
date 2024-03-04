<?php

namespace Database\Factories\Domain\Checkout\Models;

use Domain\Checkout\Models\CheckoutAvailable;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\ApiModel>
 */
class CheckoutsAvailableFactory extends Factory
{
    protected $model = CheckoutAvailable::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->unique()->text(255),
            'url_image' => $this->faker->imageUrl(),
            'manageable' => $this->faker->boolean,
            'recurrent' => $this->faker->boolean,
            'created_at' => now(),
            'updated_at' => now(),
            'deleted_at' => null,
        ];
    }
}
