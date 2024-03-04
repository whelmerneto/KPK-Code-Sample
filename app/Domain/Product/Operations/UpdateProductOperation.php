<?php

namespace Domain\Product\Operations;

use Domain\Product\Interfaces\SubscriptionRepositoryInterface;

class UpdateProductOperation
{
    public function __construct(
        private SubscriptionRepositoryInterface $subscriptionRepository,
    ) {
    }

    public function execute(string $id, array $data)
    {
        $this->subscriptionRepository->update($id, $data);
    }
}
