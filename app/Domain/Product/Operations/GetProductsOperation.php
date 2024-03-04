<?php

namespace Domain\Product\Operations;

use Domain\Product\Interfaces\SubscriptionRepositoryInterface;

class GetProductsOperation
{
    public function __construct(
        private readonly SubscriptionRepositoryInterface $subscriptionRepository
    ) {
    }

    public function execute(array $filters, array $columns)
    {
        return $this->subscriptionRepository->get(
            filters: $filters,
            columns: $columns
        );
    }
}
