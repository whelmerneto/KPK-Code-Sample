<?php

namespace Domain\SubscriptionPackage\Repositories;

use Domain\SubscriptionPackage\Interfaces\SubscriptionPackageRepositoryInterface;
use Domain\SubscriptionPackage\Models\SubscriptionPackage;
use Support\Repositories\BaseRepository;

class SubscriptionPackageRepository extends BaseRepository implements SubscriptionPackageRepositoryInterface
{
    public function __construct(SubscriptionPackage $model)
    {
        $this->model = $model;
    }
}
