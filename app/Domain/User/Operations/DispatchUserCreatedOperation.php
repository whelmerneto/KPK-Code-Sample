<?php

namespace Domain\User\Operations;

use Domain\User\Data\UserCreatedEventDTO;
use Domain\User\Data\UserInviteSubscribedEventDTO;
use Domain\User\Events\UserCreatedEvent;
use Domain\User\Events\UserInviteSubscribedEvent;

readonly class DispatchUserCreatedOperation
{
    public function execute(UserCreatedEventDTO $user)
    {
        UserCreatedEvent::dispatch($user);
        UserInviteSubscribedEvent::dispatch(
            UserInviteSubscribedEventDTO::from(['user_id' => $user->id, 'invite_id' => $user->invite_id])
        );
    }
}
