<?php

namespace Domain\Product\Operations;

use Domain\Product\Interfaces\SubscriptionRepositoryInterface;

class ChangeTimerOperation
{
    public function __construct(
        private readonly SubscriptionRepositoryInterface $subscriptionRepository
    ) {
    }

    /**
     * @throws RepeatedCommentException
     */
    public function execute(array $products, array $data): void
    {
        $comment = $this->subscriptionRepository->changeTimerProducts($products, $data);
    }
}
