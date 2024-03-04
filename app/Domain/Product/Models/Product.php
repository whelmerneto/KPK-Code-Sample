<?php

namespace Domain\Product\Models;

use Domain\Deliverable\Models\DeliverablePlatform;
use Domain\Gamification\Models\GamificationReward;
use Domain\Invite\Models\Invite;
use Domain\User\Models\UserSubscription;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    use HasFactory;
    use HasUuids;

    protected $connection = 'plataforma';

    protected $table = 'ead_subscription_package';

    protected $guarded = [];

    protected $hidden = ['pivot'];

    public function userSubscription(): HasMany
    {
        return $this->hasMany(UserSubscription::class, 'package_id', 'id');
    }

    public function rewards(): BelongsToMany
    {
        return $this->belongsToMany(GamificationReward::class, 'points_rewards_permissions_plans', 'plan_id', 'reward_id');
    }

    public function invites(): BelongsToMany
    {
        return $this->belongsToMany(Invite::class, 'master.invites_packages', 'package_id', 'invite_id');
    }

    public function checkout(): BelongsTo
    {
        return $this->belongsTo(CheckoutsAvailable::class, 'checkout_id', 'id');
    }

    public function deliverable(): HasMany
    {
        return $this->hasMany(DeliverablePlatform::class, 'product_id', 'id');
    }
}
