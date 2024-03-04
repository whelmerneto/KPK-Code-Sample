<?php

namespace App\Api\Dashboard\Sms\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Domain\Organization\Models\Organization;
use Domain\SubscriptionPackage\Models\SubscriptionPackage;
use Domain\User\Models\User;

class SmsSendRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'user_id' => [
                'required',
                Rule::exists(User::class, 'id')
            ],
            'organization_id' => [
                'required',
                Rule::exists(Organization::class, 'id')
            ]
        ];
    }
}