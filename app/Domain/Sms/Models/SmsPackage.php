<?php

namespace Domain\Sms\Models;

use Domain\Platform\Models\Organization;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class SmsPackage extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'organization_id',
        'used_quantity',
        'contracted_quantity',
        'last_reset_at',
        'cancel_date',
    ];

    protected $hidden = [
        'deleted_at',
    ];

    protected $attributes = [
        'used_quantity' => 0,
    ];

    public function organization(): BelongsTo
    {
        return $this->belongsTo(Organization::class, 'organization_id');
    }
}
