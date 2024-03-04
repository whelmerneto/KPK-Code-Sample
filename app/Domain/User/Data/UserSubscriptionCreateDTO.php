<?php

namespace Domain\User\Data;

use Spatie\LaravelData\Data;

class UserSubscriptionCreateDTO extends Data
{
    public function __construct(
        public string $user_id,
        public string $invite_id,
        public ?string $has_voucher,
        public ?string $voucher,
        public int $tenant_id,
    ) {

    }
}
