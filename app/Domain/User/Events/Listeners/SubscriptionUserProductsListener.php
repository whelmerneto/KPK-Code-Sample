<?php

namespace Domain\User\Events\Listeners;

use Domain\User\Data\UserInviteSubscribedEventDTO;
use Domain\User\Events\UserInviteSubscribedEvent;
use Domain\User\Operations\SubscriptionUserProductsOperation;

readonly class SubscriptionUserProductsListener
{
    /**
     * Create the event listener.
     */
    public function __construct(private readonly SubscriptionUserProductsOperation $subscriptionUserProductsOperation)
    {
    }

    /**
     * Handle the event.
     */
    public function handle(UserInviteSubscribedEvent $event): void
    {
        $user = UserInviteSubscribedEventDTO::from($event->data);
        $this->subscriptionUserProductsOperation->execute($user);
    }
}
