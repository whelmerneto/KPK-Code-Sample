<?php

namespace Domain\User\Data;

use Spatie\LaravelData\Data;

class UserCreateDTO extends Data
{
    public function __construct(
        public string $email,
        public string $name,
        public string $phone,
        public string $password,
        public string $remember_token,
        public string $invite_id,
        public ?string $has_voucher,
        public ?string $voucher,
        public ?string $tenant_id
    ) {
    }
}
