<?php

namespace Domain\User\UseCases;

use Domain\User\Data\UserSubscriptionOrganizationDTO;
use Domain\User\Operations\GetExpiresDateOperation;

class GetExpiresDateUseCase
{
    public function __construct(
        private readonly GetExpiresDateOperation $getExpiresDateOperation
    ) {
        //
    }

    public function handle(UserSubscriptionOrganizationDTO $userSubscriptionDTO)
    {
        return $this->getExpiresDateOperation->execute($userSubscriptionDTO->organization_id, $userSubscriptionDTO->user_id);
    }
}
