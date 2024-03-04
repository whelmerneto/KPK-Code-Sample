<?php

namespace Domain\User\Enums;

enum Roles: int
{
    case Admin = 2;
    case Student = 4;
    case StudentFree = 5;
    case Diretoria = 7;
    case Suporte = 8;
    case Designer = 9;
}
