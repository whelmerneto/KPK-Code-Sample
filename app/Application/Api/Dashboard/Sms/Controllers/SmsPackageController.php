<?php

namespace App\Api\Dashboard\Sms\Controllers;

use App\Api\Dashboard\Sms\Requests\UpdateSmsPackageRequest;
use Domain\Sms\Models\SmsPackage;
use Illuminate\Http\JsonResponse;
use Support\Http\Controllers\Controller;

class SmsPackageController extends Controller
{
    public function getSmsByOrgId(int $orgId): JsonResponse
    {
        $smsPackages = SmsPackage::whereOrganizationId($orgId)->firstOrFail();
        if (! auth('superadmin')->user()) {
            $this->authorize('view', $smsPackages);
        }

        return response()->success($smsPackages);
    }

    public function create(UpdateSmsPackageRequest $request, int $orgId): JsonResponse
    {
        $sms = SmsPackage::updateOrCreate(
            ['organization_id' => $orgId],
            [
                'contracted_quantity' => $request->input('contracted_quantity'),
                'cancel_date' => $request->input('active') ? null : now(),
            ]
        );

        return response()->success($sms);
    }
}
