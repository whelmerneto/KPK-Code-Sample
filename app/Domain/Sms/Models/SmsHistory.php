<?php

namespace Domain\Sms\Models;

use Domain\Platform\Models\Organization;
use Domain\User\Models\User;
use Domain\User\Models\UserSubscription;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SmsHistory extends Model
{
    use HasFactory;

    protected $connection = 'master';

    protected $table = 'sms_histories';

    protected $fillable = [
        'organization_id',
        'user_id',
        'product_id',
        'phone',
        'status',
        'sms_template_id',
    ];

    public function organization(): BelongsTo
    {
        return $this->belongsTo(Organization::class, 'organization_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(UserSubscription::class, 'product_id');
    }
}
