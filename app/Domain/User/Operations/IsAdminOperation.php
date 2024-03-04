<?php

namespace Domain\User\Operations;

//Domain\User\Operations\IsAdminOperation.php
use Domain\User\Interfaces\UserRepositoryInterface;

readonly class IsAdminOperation
{
    public function __construct(private UserRepositoryInterface $userRepositoryInterface)
    {
    }

    public function execute(string $user_id, int $tenant_id): bool
    {
        return $this->userRepositoryInterface->isAdmin($user_id, $tenant_id);
    }
}
