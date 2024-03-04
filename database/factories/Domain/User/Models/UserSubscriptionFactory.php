<?php

namespace Database\Factories\Domain\User\Models;

use Domain\Platform\Models\Organization;
use Domain\Product\Models\CreditCard;
use Domain\Product\Models\Product;
use Domain\Product\Models\SubAccount;
use Domain\TenantUser\Models\TenantUser;
use Domain\User\Models\User;
use Domain\User\Models\UserSubscription;
use Illuminate\Database\Eloquent\Factories\Factory;

class UserSubscriptionFactory extends Factory
{
    protected $model = UserSubscription::class;

    public function definition(): array
    {
        $active = $this->faker->boolean;
        $product = Product::factory()->create();
        return [
            'organization_id' => $product->organization_id,
            'tenant_id' => $product->tenant_id, // Adjust as needed
            'active' => $active,
            'status' => $active ? 'active' : 'inactive',
            'user_id' => User::factory(),
            'package_id' => $product->id,
            'contract_id' => $this->faker->text(191),
            'credit_brand' => $this->faker->text(191),
            'last_digits' => $this->faker->text(191),
            'contract_invoice' => $this->faker->randomNumber(), // Adjust as needed
            'payment_last_date' => $this->faker->dateTime,
            'expiration_date' => $this->faker->date,
            'cancel_date' => !$active ? $this->faker->date : '',
            'created_at' => now(),
            'updated_at' => now(),
            'accepted_terms' => $this->faker->boolean,
        ];
    }
}
