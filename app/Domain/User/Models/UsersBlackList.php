<?php

namespace Domain\User\Models;

use Illuminate\Database\Eloquent\Model;

class UsersBlackList extends Model
{
    protected $connection = 'plataforma';

    protected $table = 'users_blacklist';

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
