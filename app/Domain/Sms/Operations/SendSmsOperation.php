<?php

namespace Domain\Sms\Operations;

use Domain\Organization\Models\Organization;
use Domain\Sms\Models\SmsHistory;
use Domain\Sms\Models\SmsPackage;
use Domain\Sms\Models\SmsTemplate;
use Domain\Sms\Notifications\NewUserNotification;
use Domain\UrlShortener\Services\UrlShortenerService;
use Domain\User\Models\User;
use Illuminate\Support\Facades\Notification;

readonly class SendSmsOperation
{
    public function execute(string $destino, Organization $organization, User $user, string $productId, UrlShortenerService $urlShortenerService): bool
    {
        Notification::send($user, new NewUserNotification($urlShortenerService));
        $this->updateSmsHistory($organization, $user, $productId);
        $this->incrementUsedSms($organization->id);

        return true;
    }

    private function updateSmsHistory(Organization $organization, User $user, string $productId): void
    {
        $template = $this->getSmsTemplate($organization->id);

        SmsHistory::create([
            'organization_id' => $organization->id,
            'user_id' => $user->id,
            'product_id' => $productId,
            'phone' => $user->phone,
            'status' => 'sent',
            'sms_template_id' => $template->id,
        ]);
    }

    private function getSmsTemplate(int $organization_id): ?SmsTemplate
    {
        $template = SmsTemplate::where('organization_id', $organization_id)->where('event_id', config('services.zenvia.event_id_new_user_access_request'))->first();

        if (! $template) {
            $template = SmsTemplate::whereNull('organization_id')->where('event_id', config('services.zenvia.event_id_new_user_access_request'))->first();
        }

        return $template;
    }

    private function incrementUsedSms(int $organizationId): void
    {
        $smsPackage = SmsPackage::where('organization_id', $organizationId)->first();
        $smsPackage->increment('used_quantity');
    }
}
