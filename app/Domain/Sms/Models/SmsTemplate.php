<?php

namespace Domain\Sms\Models;

use Domain\Platform\Models\Organization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SmsTemplate extends Model
{
    protected $connection = 'master';

    protected $table = 'sms_template';

    protected $fillable = [
        'name',
        'text',
        'organization_id',
        'event_id',
    ];

    public function organization(): BelongsTo
    {
        return $this->belongsTo(Organization::class, 'organization_id');
    }
}
