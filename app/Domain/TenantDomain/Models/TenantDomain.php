<?php

namespace Domain\TenantDomain\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TenantDomain extends Model
{
    use HasFactory;

    protected $connection = 'master';

    protected $table = 'tenant_domains';
}
