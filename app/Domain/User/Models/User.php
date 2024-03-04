<?php

namespace Domain\User\Models;

use Domain\Certificate\Models\Certificate;
use Domain\Community\Models\CommunityUserInfo;
use Domain\Invite\Models\Invite;
use Domain\Lesson\Models\Lesson;
use Domain\Platform\Models\Platform;
use Domain\Role\Models\Role;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory;
    use HasUuids;
    use Notifiable;

    protected $connection = 'plataforma';

    protected $table = 'users';

    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }

    public function isAdmin(int $tenant_id): bool
    {
        return $this->roles()
            ->wherePivot('tenant_id', $tenant_id)
            ->select('slug')
            ->first()
                ?->slug != 'student';
    }

    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(Role::class, 'plataforma.users_roles');
    }

    public function favoriteLessons(): BelongsToMany
    {
        return $this->belongsToMany(
            Lesson::class,
            'plataforma.ead_my_list',
            'user_id',
            'class_id'
        );
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [
            'email' => $this->email,
        ];
    }

    public function firstSubscription(): HasOne
    {
        return $this->hasOne(UserSubscription::class)->limit(1);
    }

    public function communityInfo(): HasOne
    {
        return $this->hasOne(CommunityUserInfo::class);
    }

    public function scopeStudents(Builder $query, int $tenant_id): Builder
    {
        return $query->whereHas('roles', fn ($query) => $query->where('slug', 'student')->where('tenant_id', $tenant_id));
    }

    public function subscriptions(): HasMany
    {
        return $this->hasMany(UserSubscription::class, 'user_id', 'id');
    }

    public function scopeSubscribed(Builder $query, array $package_id, int $tenant_id): Builder
    {
        return $query->whereHas('subscriptions', fn ($query) => $query->whereIn('package_id', $package_id)->where('tenant_id', $tenant_id));
    }

    public function platform(): BelongsTo
    {
        return $this->belongsTo(Platform::class, 'tenant_id');
    }

    public function certificates(): BelongsToMany
    {
        return $this->belongsToMany(Certificate::class, 'ead_certificates_users', 'user_id', 'certificate_id');
    }

    public function invites(): BelongsToMany
    {
        return $this->belongsToMany(Invite::class, 'invites_user');

    }

    public function person(): BelongsTo
    {
        return $this->belongsTo(Person::class);
    }

    public function tenant(): BelongsTo
    {
        return $this->belongsTo(TenantUser::class, 'tenant_id', 'id');
    }

    protected function phoneNumberToZenvia(): Attribute
    {
        if (! array_key_exists('phone', $this->attributes)) {
            return Attribute::make(
                get: fn () => null,
            );
        }

        $phone = $this->attributes['phone'];

        if (strlen($phone) == 11) {
            $phone = '55' . $phone;
        }

        return Attribute::make(
            get: fn () => $phone,
        );
    }
}
