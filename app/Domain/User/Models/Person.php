<?php

namespace Domain\User\Models;

use Domain\User\Enums\DocumentType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Person extends Model
{
    use HasFactory;

    protected $connection = 'plataforma';

    protected $table = 'people';

    protected $fillable = [
        'document_type',
        'document_number',
    ];

    protected $casts = [
        'document_type' => DocumentType::class,
    ];

    public function user(): HasMany
    {
        return $this->hasMany(User::class);
    }
}
