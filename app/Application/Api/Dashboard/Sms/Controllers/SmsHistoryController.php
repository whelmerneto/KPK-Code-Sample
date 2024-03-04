<?php

namespace App\Api\Dashboard\Sms\Controllers;

use Domain\Sms\Models\SmsHistory;
use Illuminate\Http\JsonResponse;
use Support\Http\Controllers\Controller;

class SmsHistoryController extends Controller
{
    public function index(int $orgId): JsonResponse
    {
        if (! auth('superadmin')->user()) {
            $this->authorize('viewAny', [SmsHistory::class, $orgId]);
        }

        $smsHistories = SmsHistory::whereOrganizationId($orgId)->with('user:id,name')->paginate(request()->query('per_page', 10));

        return response()->success($smsHistories);
    }
}
