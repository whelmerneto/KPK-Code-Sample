<?php

namespace Domain\User\Operations;

use Domain\User\Enums\Roles;
use Domain\User\Interfaces\UserRoleRepositoryInterface;

class GetUserRoleOperation
{
    public function handle(UserRoleRepositoryInterface $repository, string $userId)
    {
        return $repository->get([
            'user_id' => $userId,
            'role_id' => Roles::Student
        ]);
    }
}
