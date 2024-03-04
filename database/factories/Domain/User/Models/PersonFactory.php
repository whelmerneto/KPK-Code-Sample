<?php

namespace Database\Factories\Domain\User\Models;

use Domain\User\Models\Person;
use Illuminate\Database\Eloquent\Factories\Factory;

class PersonFactory extends Factory
{
    protected $model = Person::class;

    public function definition(): array
    {
        return [
            'document_type' => 'cpf',
            'document_number' => $this->faker->numerify('###########'),
        ];
    }
}
