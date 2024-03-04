<?php

namespace Domain\Product\Data;

use Spatie\LaravelData\Data;

class ChangeTimerDTO extends Data
{
    public function __construct(
        public array $products,
        public bool $timer
    ) {
    }
}
