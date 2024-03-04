<?php

namespace Domain\User\Repositories;

use Domain\User\Interfaces\UserBlacklistRepositoryInterface;
use Domain\User\Models\UsersBlackList;
use Support\Repositories\BaseRepository;

class UserBlacklistRepository extends BaseRepository implements UserBlacklistRepositoryInterface
{
    public function __construct(UsersBlackList $model)
    {
        parent::__construct($model);
    }
}
