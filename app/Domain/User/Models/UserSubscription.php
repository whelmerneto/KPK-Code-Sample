<?php

namespace Domain\User\Models;

use Domain\Platform\Models\Organization;
use Domain\Product\Models\Product;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserSubscription extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $connection = 'plataforma';

    protected $table = 'user_subscription';

    protected $guarded = [];

    protected $fillable = [
        'tenant_id',
        'user_id',
        'organization_id',
        'active',
        'package_id',
        'contract_id',
        'contract_invoice',
        'payment_last_date',
        'expiration_date',
        'accession_date',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function organization(): BelongsTo
    {
        return $this->belongsTo(Organization::class, 'organization_id', 'id');
    }

    public function scopeActive(Builder $query)
    {
        return $query->where('status', 'active');
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'package_id', 'id');
    }

    public function tenant(): BelongsTo
    {
        return $this->belongsTo(TenantUser::class, 'tenant_id', 'id');
    }
}
