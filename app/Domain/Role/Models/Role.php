<?php

namespace Domain\Role\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $connection = 'plataforma';

    protected $guarded = [];
}
