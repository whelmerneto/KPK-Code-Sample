<?php

namespace Domain\SubscriptionPackage\Models;

use Illuminate\Database\Eloquent\Model;

class SubscriptionPackage extends Model
{
    protected $connection = 'plataforma';
    protected $table = 'ead_subscription_package';
}
