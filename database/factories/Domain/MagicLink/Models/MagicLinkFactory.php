<?php

namespace Database\Factories\Domain\MagicLink\Models;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Domain\MagicLink\Models\MagicLink;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\ApiModel>
 */
class MagicLinkFactory extends Factory
{
    protected $model = MagicLink::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'token_id' => $this->faker->uuid(),
        ];
    }
}
