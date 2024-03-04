<?php

namespace Domain\User\Repositories;

use Domain\User\Data\UserSubscriptionDTO;
use Domain\User\Interfaces\UserSubscriptionRepositoryInterface;
use Domain\User\Models\UserSubscription;
use Illuminate\Database\Eloquent\Collection;
use Spatie\LaravelData\DataCollection;
use Support\Repositories\BaseRepository;

class UserSubscriptionRepository extends BaseRepository implements UserSubscriptionRepositoryInterface
{
    public function __construct(
        UserSubscription $model
    ) {
        parent::__construct($model);
    }

    public function getByUser(string $user_id, int $org_id, array $columns = ['*']): DataCollection
    {
        $filters = [
            ['user_id', $user_id],
            ['organization_id', $org_id],
        ];

        return UserSubscriptionDTO::collection($this->model->select($columns)
            ->where($filters)
            ->active()
            ->get());
    }

    public function getUsersByProduct(string $product_id, array $columns = ['*'], array $relations = []): Collection
    {
        return $this->model->select($columns)
            ->where('package_id', $product_id)
            ->active()
            ->with($relations)
            ->get();
    }

    public function getExpiresDate(string $organization_id, string $user_id): Collection
    {
        return $this->model->select(['id', 'user_id', 'package_id', 'expiration_date'])
            ->with('product:id,title')
            ->whereHas('product', function ($query) use ($organization_id) {
                $query->where('organization_id', $organization_id)
                    ->where('timer', '1');
            })
            ->where('user_id', $user_id)
            ->orderBy('expiration_date', 'ASC')
            ->active()
            ->get();
    }
}
