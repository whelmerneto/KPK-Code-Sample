<?php

namespace Domain\Sms\UseCases;

use Domain\Organization\Operations\GetOrganizationOperation;
use Domain\Sms\Models\SmsPackage;
use Domain\Sms\Operations\SendSmsOperation;
use Domain\UrlShortener\Services\UrlShortenerService;
use Domain\User\Models\User;
use Domain\User\Operations\GetUserOperation;
use Illuminate\Support\Facades\DB;

class SendSmsUseCase
{
    public function __construct(
        private readonly SendSmsOperation $sendSmsOperation,
        private GetUserOperation $getUserOperation,
        private GetOrganizationOperation $getOrganizationOperation,
        private UrlShortenerService $urlShortenerService
    ) {
    }

    public function handle(string $userId, string $organizationId, string $product_id): bool
    {
        $user = $this->getUserOperation->execute(['id' => $userId]);
        $organization = $this->getOrganizationOperation->execute(['id' => $organizationId]);

        if ($this->checkSmsAvailability($user, $organizationId)) {
            return $this->sendSmsOperation->execute('destino', $organization, $user, $product_id, $this->urlShortenerService);
        }

        return false;
    }

    private function checkSmsAvailability(User $student, string $organizationId): bool
    {
        if ($student->phone !== null && strlen($student->phone) >= 11) {
            $smsPackage = SmsPackage::where('organization_id', $organizationId)
                ->where('used_quantity', '<', DB::raw('contracted_quantity'))
                ->whereNull('cancel_date')
                ->first();

            return $smsPackage !== null;
        }

        return false;
    }
}
