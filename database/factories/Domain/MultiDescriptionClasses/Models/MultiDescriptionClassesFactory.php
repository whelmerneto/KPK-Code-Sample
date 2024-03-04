<?php

namespace Database\Factories\Domain\MultiDescriptionClasses\Models;
use Domain\MultiDescriptionClasses\Models\MultiDescriptionClasses;
use Illuminate\Database\Eloquent\Factories\Factory;
class MultiDescriptionClassesFactory extends Factory
{

    protected $model = MultiDescriptionClasses::class;

    public function definition(): array
    {

        return [
            'id' => $this->faker->numberBetween(1, 100),
            'lesson_id' => $this->faker->uuid(),
            'title' => $this->faker->text(),
            'description' => $this->faker->text(),
            'status' => $this->faker->boolean(),
        ];
    }

}
