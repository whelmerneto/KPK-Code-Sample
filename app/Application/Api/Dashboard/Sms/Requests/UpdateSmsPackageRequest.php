<?php

namespace App\Api\Dashboard\Sms\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateSmsPackageRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'contracted_quantity' => 'required|integer',
            'active' => 'required|boolean',
        ];
    }
}
