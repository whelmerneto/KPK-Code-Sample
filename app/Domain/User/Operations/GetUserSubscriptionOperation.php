<?php

namespace Domain\User\Operations;

use Domain\Platform\Operations\GetPlatformOperation;
use Domain\User\Interfaces\UserSubscriptionRepositoryInterface;
use Illuminate\Database\Eloquent\Collection;
use Spatie\LaravelData\DataCollection;

readonly class GetUserSubscriptionOperation
{
    public function __construct(
        private UserSubscriptionRepositoryInterface $userSubscriptionRepository,
        private GetPlatformOperation $getPlatformOperation
    ) {
    }

    public function execute(string $user_id, int $tenant_id, array $columns = ['*']): DataCollection
    {
        $org_id = $this->getPlatformOperation->execute($tenant_id, ['organization_id'])?->organization_id;

        return $this->userSubscriptionRepository->getByUser($user_id, $org_id, $columns);
    }
}
