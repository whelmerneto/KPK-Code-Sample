<?php

namespace Domain\User\Operations;

use Carbon\Carbon;
use Domain\Invite\Repositories\InviteRepository;
use Domain\User\Data\UserInviteSubscribedEventDTO;
use Domain\User\Repositories\UserRepository;

readonly class SubscriptionUserProductsOperation
{
    public function __construct(
        private readonly UserRepository $userRepository,
        private readonly InviteRepository $inviteRepository
    ) {
    }

    public function execute(UserInviteSubscribedEventDTO $dto)
    {
        $products = $this->inviteRepository->getProducts($dto->invite_id, ['package_id', 'id']);
        $productsAlreadySubscribed = $this->userRepository->getSubscriptions($dto->user_id)->pluck('package_id')->toArray();

        $subscriptionsToAttach = $products->filter(function ($product) use ($productsAlreadySubscribed) {
            return ! in_array($product->id, $productsAlreadySubscribed);
        });

        $subscriptionData = $subscriptionsToAttach->map(function ($product) use ($dto) {
            $expirationDate = $product->lifetime == 1 ? null : Carbon::now()->addDays($product->period + ($product->trial ?? 0));

            return [
                'tenant_id' => $product->tenant_id,
                'organization_id' => $product->organization_id,
                'user_id' => $dto->user_id,
                'active' => 1,
                'package_id' => $product->id,
                'contract_id' => '00',
                'contract_invoice' => 000,
                'payment_last_date' => Carbon::now(),
                'expiration_date' => $expirationDate,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ];
        });

        $this->userRepository->attachSubscriptions($dto->user_id, $subscriptionData);
    }
}
