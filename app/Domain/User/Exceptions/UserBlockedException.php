<?php

namespace Domain\User\Exceptions;

use Exception;

class UserBlockedException extends Exception
{
    public function __construct(string $message = '', int $code = 401)
    {
        parent::__construct($message, $code);
    }
}
