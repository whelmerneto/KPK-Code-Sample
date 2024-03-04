<?php

namespace Domain\User\Events;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class UserCreatedMailEvent implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, SerializesModels;

    public $connection = 'rabbitmq';

    public $queue = 'email';

    public function __construct(public $data)
    {
    }

    public function handle()
    {
        return $this->data;
    }
}
