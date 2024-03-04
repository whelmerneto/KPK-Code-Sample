<?php

namespace Domain\User\Interfaces;

use Illuminate\Database\Eloquent\Collection;
use Spatie\LaravelData\DataCollection;

interface UserSubscriptionRepositoryInterface
{
    public function getUsersByProduct(string $product_id): Collection;

    public function getByUser(string $user_id, int $org_id, array $columns = ['*']): DataCollection;

    public function getExpiresDate(string $organization_id, string $user_id): Collection;
}
