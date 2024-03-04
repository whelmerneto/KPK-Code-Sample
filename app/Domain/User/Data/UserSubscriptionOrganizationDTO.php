<?php

namespace Domain\User\Data;

use Spatie\LaravelData\Data;
use Spatie\LaravelData\Optional;

class UserSubscriptionOrganizationDTO extends Data
{
    public function __construct(
        public string|Optional $user_id,
        public string $organization_id,
    ) {
    }
}
