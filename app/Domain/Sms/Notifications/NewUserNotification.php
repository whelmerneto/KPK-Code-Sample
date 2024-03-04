<?php

namespace Domain\Sms\Notifications;

use Domain\Sms\Models\SmsTemplate;
use Domain\TenantDomain\Models\TenantDomain;
use Domain\TenantUser\Models\TenantUser;
use Domain\UrlShortener\Services\UrlShortenerService;
use Domain\User\Models\User;
use Domain\User\Models\UserRole;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;

class NewUserNotification extends Notification
{
    use Queueable;

    private $urlShortenerService;

    /**
     * Create a new notification instance.
     */
    public function __construct(UrlShortenerService $urlShortenerService)
    {
        $this->urlShortenerService = $urlShortenerService;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(User $notifiable): array
    {
        return [SmsChannel::class];
    }

    public function toSms(User $user): string
    {
        $userRole = UserRole::where('user_id', $user->id)->latest()->first();
        $tenant = TenantUser::select('id AS tenant_id', 'address AS domain', 'name', 'organization_id')->where('id', $userRole->tenant_id)->first();

        $senha = $user->remember_token;
        $plataforma = substr($tenant->name, 0, 90);

        $tenantDomain = TenantDomain::select(['domain', 'tenant_id'])->where('tenant_id', $tenant->tenant_id)->first();
        if (! $tenantDomain) {
            $domain = "{$tenant->domain}.themembers.com.br";
        } else {
            $domain = $tenantDomain->domain;
        }

        $domain .= "/login";
        $shortUrl = $this->urlShortenerService->shortenUrl($domain);
        $template = SmsTemplate::where('organization_id', $tenant->organization_id)->where('event_id', config('services.zenvia.event_id_new_user_access_request'))->first();

        if (! $template) {
            $template = SmsTemplate::whereNull('organization_id')->where('event_id', config('services.zenvia.event_id_new_user_access_request'))->first();
        }
        $text = $template->text;

        if ($text !== null) {
            $text = str_replace('$plataforma', $plataforma, $text);
            $text = str_replace('$senha', $senha, $text);
        }

        if ($shortUrl) {
            return "{$text} {$shortUrl}";
        }

        return "{$text} {$domain}";
    }
}
