<?php

namespace App\Api\Dashboard\Sms\Controllers;

use Support\Http\Controllers\Controller;
use Domain\Sms\UseCases\SendSmsUseCase;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Api\Dashboard\Sms\Requests\SmsSendRequest;
use Domain\User\Models\UserSubscription;
use Domain\SubscriptionPackage\Models\SubscriptionPackage;

class SmsSendController extends Controller
{
    public function __construct(private SendSmsUseCase $sendSmsUseCase)
    {
    }

    public function sendSms(SmsSendRequest $request): JsonResponse // incluir form request
    {
        $userId = $request->user_id;
        $organizationId = $request->organization_id;
        $subscription = UserSubscription::where('user_id', $userId)->latest()->first();

        $smsSent = $this->sendSmsUseCase->handle($userId, $organizationId, $subscription->package_id);

        if ($smsSent) {
            return response()->json([
                "success" => true,
                "msg" => "Sms enviado com sucesso"
            ], 200);
        }

        return response()->json([
            "success" => false,
            "msg" => "Falha ao enviar SMS."
        ], 400);
    }
}
