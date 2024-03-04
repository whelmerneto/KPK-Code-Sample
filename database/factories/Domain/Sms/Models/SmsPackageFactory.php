<?php

namespace Database\Factories\Domain\Sms\Models;

use Domain\Platform\Models\Organization;
use Domain\Sms\Models\SmsPackage;
use Illuminate\Database\Eloquent\Factories\Factory;

class SmsPackageFactory extends Factory
{
    protected $model = SmsPackage::class;

    public function definition(): array
    {
        // Created_at is the same as last_reset_at
        // date between now and 60 days ago
        $created_at = $this->faker->dateTimeBetween('-60 days', 'now');

        return [
            'organization_id' => Organization::factory(),
            'used_quantity' => $this->faker->randomNumber(2),
            'contracted_quantity' => $this->faker->randomNumber(3),
            'last_reset_at' => $created_at,
            'created_at' => $created_at,
            'updated_at' => $created_at,
        ];
    }

    public function deleted(): self
    {
        return $this->canceled()->state(function (array $attributes) {
            return [
                'deleted_at' => $this->faker->dateTimeBetween($attributes['cancel_date'], 'now'),
            ];
        });
    }

    public function canceled(): self
    {
        return $this->state(function (array $attributes) {
            return [
                'cancel_date' => $this->faker->dateTimeBetween($attributes['created_at'], 'now'),
            ];
        });
    }
}
