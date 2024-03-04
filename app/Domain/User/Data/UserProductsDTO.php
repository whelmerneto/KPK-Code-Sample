<?php

namespace Domain\User\Data;

use Spatie\LaravelData\Data;

class UserProductsDTO extends Data
{
    public function __construct(
        public int $tenant_id,
        public string $user_id
    ) {
        //
    }
}
