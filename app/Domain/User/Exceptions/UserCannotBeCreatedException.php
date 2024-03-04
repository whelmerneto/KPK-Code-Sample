<?php

namespace Domain\User\Exceptions;

use Exception;

class UserCannotBeCreatedException extends Exception
{
    public function __construct(string $message = 'Não foi possivel criar um usuário', int $code = 500)
    {
        parent::__construct($message, $code);
    }
}
