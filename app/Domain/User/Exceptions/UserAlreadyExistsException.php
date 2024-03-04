<?php

namespace Domain\User\Exceptions;

use Exception;

class UserAlreadyExistsException extends Exception
{
    public function __construct(string $message = 'Já existe um usuário com o email informado', int $code = 400)
    {
        parent::__construct($message, $code);
    }
}
