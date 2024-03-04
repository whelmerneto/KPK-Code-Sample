<?php

namespace Domain\User\Operations;

use Domain\User\Interfaces\UserSubscriptionRepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

readonly class GetExpiresDateOperation
{
    public function __construct(
        private UserSubscriptionRepositoryInterface $userSubscriptionRepository,
    ) {
    }

    public function execute(string $organization_id, string $user_id): Collection
    {
        return $this->userSubscriptionRepository->getExpiresDate($organization_id, $user_id);
    }
}
