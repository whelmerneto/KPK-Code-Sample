<?php

namespace Domain\User\Enums;

enum DocumentType: string
{
    case Cpf = 'cpf';
    case International = 'international';

}
