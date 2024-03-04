<?php

namespace Domain\User\Repositories;

use Domain\User\Interfaces\UserRoleRepositoryInterface;
use Domain\User\Models\UserRole;
use Support\Repositories\BaseRepository;

class UserRoleRepository extends BaseRepository implements UserRoleRepositoryInterface
{
    public function __construct(UserRole $model)
    {
        $this->model = $model;
    }
}
