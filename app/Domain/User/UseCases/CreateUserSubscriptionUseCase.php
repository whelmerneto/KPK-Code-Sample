<?php

namespace Domain\User\UseCases;

use Carbon\Carbon;
use Domain\Product\Models\Product;
use Domain\User\Enums\Roles;
use Domain\User\Models\User;
use Domain\User\Models\UserSubscription;

class CreateUserSubscriptionUseCase
{
    public function execute(User $user, Product $product): UserSubscription
    {
        if (! $user->roles()->where('tenant_id', $product->deliverable()->first()->tenant_id)->exists()) {
            $user->roles()->attach([
                Roles::Student->value => ['tenant_id' => $product->deliverable()->first()->tenant_id],
            ]);
        }

        return UserSubscription::create([
            'user_id' => $user->id,
            'package_id' => $product->id,
            'tenant_id' => $product->deliverable()->first()->tenant_id,
            'organization_id' => $product->organization_id,
            'status' => 'active',
            'active' => 1,
            'expiration_date' => $product->lifetime == 1 ? null : now()->addDays($product->period + $product?->trial),
            'payment_last_date' => now(),
            'accession_date' => now(),
        ]);
    }
}
