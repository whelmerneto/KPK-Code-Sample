<?php

namespace Database\Factories\Domain\Sms\Models;

use Domain\Platform\Models\Organization;
use Domain\Product\Models\Product;
use Domain\Sms\Models\SmsHistory;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class SmsHistoryFactory extends Factory
{
    protected $model = SmsHistory::class;

    public function definition(): array
    {
        return [
            'organization_id' => Organization::factory(),
            'user_id' => User::factory(),
            'product_id' => Product::factory(),
            'phone' => $this->faker->phoneNumber,
            'status' => $this->faker->randomElement(['pending', 'sent', 'failed']),
        ];
    }

    public function pending(): SmsHistoryFactory
    {
        return $this->state(function (array $attributes) {
            return [
                'status' => 'pending',
            ];
        });
    }

    public function sent(): SmsHistoryFactory
    {
        return $this->state(function (array $attributes) {
            return [
                'status' => 'sent',
            ];
        });
    }

    public function failed(): SmsHistoryFactory
    {
        return $this->state(function (array $attributes) {
            return [
                'status' => 'failed',
            ];
        });
    }
}
