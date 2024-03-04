<?php

namespace Domain\User\Data;

use Illuminate\Support\Optional;
use Spatie\LaravelData\Data;

class UserCreatedEventDTO extends Data
{
    public function __construct(
        public string $id,
        public string $name,
        public string $email,
        public int $tenant_id,
        public string|Optional $invite_id
    ) {
    }
}
