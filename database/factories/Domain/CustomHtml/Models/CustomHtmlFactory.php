<?php

namespace Database\Factories\Domain\CustomHtml\Models;

use Domain\CustomHtml\Models\CustomHtml;
use Domain\Platform\Models\Platform;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\Domain\CustomHtml\Models\CustomHtml>
 **/
class CustomHtmlFactory extends Factory
{
    /**
    The name of the factory's corresponding model.*
    @var class-string<\Illuminate\Database\Eloquent\Model>*/
    protected $model = CustomHtml::class;

    public function definition(): array
    {
        $tenant = Platform::inRandomOrder()->first();

        return [
            'id' => $this->faker->numberBetween(1, 100),
            'tenant_id' => $tenant->id,
            'page' => $this->faker->randomElement(['lesson', 'community', 'homepage']),
            'html' => $this->faker->text,
            'created_at' => $this->faker->dateTime,
            'updated_at' => $this->faker->dateTime,
        ];
    }
}
