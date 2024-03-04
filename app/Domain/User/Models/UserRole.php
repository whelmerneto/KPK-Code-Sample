<?php

namespace Domain\User\Models;

use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    protected $connection = 'plataforma';

    protected $table = 'users_roles';

}
