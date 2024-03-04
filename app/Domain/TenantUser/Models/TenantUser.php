<?php

namespace Domain\TenantUser\Models;

use Domain\Platform\Models\Organization;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TenantUser extends Model
{
    use HasFactory;

    protected $connection = 'master';

    protected $table = 'tenant_users';

    protected $fillable = [
        'organization_id',
        'name',
        'description',
        'address',
        'type',
        'template_id',
        'active',
        'redirect_url',
    ];

    public function organization(): BelongsTo
    {
        return $this->belongsTo(Organization::class, 'organization_id', 'id');
    }
}
