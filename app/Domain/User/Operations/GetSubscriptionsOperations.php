<?php

namespace Domain\User\Operations;

use Domain\Platform\Operations\GetPlatformOperation;
use Domain\User\Interfaces\UserSubscriptionRepositoryInterface;
use Spatie\LaravelData\DataCollection;

class GetSubscriptionsOperations
{

    public function __construct(
        private readonly UserSubscriptionRepositoryInterface $userSubscriptionRepository,
        private readonly GetPlatformOperation $getPlatformOperation
    ) {
    }
    public function execute(string $user_id, int $tenant_id, array $columns = ['*']): DataCollection
    {
        $org_id = $this->getPlatformOperation->execute($tenant_id, ['organization_id'])?->organization_id;
        return $this->userSubscriptionRepository->getByUser($user_id, $org_id, $columns);
    }
}
