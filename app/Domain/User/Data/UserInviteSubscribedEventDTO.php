<?php

namespace Domain\User\Data;

use Spatie\LaravelData\Data;

class UserInviteSubscribedEventDTO extends Data
{
    public function __construct(
        public string $user_id,
        public string $invite_id
    ) {
    }
}
