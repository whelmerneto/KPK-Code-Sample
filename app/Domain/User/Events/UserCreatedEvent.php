<?php

namespace Domain\User\Events;

use Domain\User\Data\UserCreatedEventDTO;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UserCreatedEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function __construct(public UserCreatedEventDTO $data)
    {
    }
}
