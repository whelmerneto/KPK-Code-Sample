<?php

namespace Domain\User\Operations;

use Domain\User\Interfaces\UserBlacklistRepositoryInterface;
use Domain\User\Models\UsersBlackList;

readonly class VerifyUserBlacklistOperation
{
    public function __construct(
        private UserBlacklistRepositoryInterface $userBlacklistRepository
    ) {
    }

    /** @noinspection PhpIncompatibleReturnTypeInspection */
    public function execute(string $user_id, int $tenant_id, array $columns = ['*']): ?UsersBlackList
    {
        $filters = [
            ['user_id', $user_id],
            ['tenant_id', $tenant_id]];

        return $this->userBlacklistRepository->findBy($filters, $columns);
    }
}
