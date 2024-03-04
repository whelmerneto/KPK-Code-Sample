<?php

namespace Domain\User\Events;

use Domain\User\Data\UserInviteSubscribedEventDTO;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UserInviteSubscribedEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function __construct(public UserInviteSubscribedEventDTO $data)
    {
    }
}
