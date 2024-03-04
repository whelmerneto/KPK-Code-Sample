<?php

namespace Domain\Sms\Notifications;

use Domain\User\Models\User;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Http;

class SmsChannel
{
    private const PREFIX = 'sms/messages';

    private string $url;

    public function __construct()
    {
        $this->url = config('services.zenvia.base_url') . self::PREFIX;
    }

    /**
     * Send the given notification.
     */
    public function send(User $notifiable, Notification $notification): void
    {
        $message = $notification->toSms($notifiable);

        $response = Http::withHeaders([
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
            'X-API-TOKEN' => config('services.zenvia.x_api_token'),
        ])
            ->post($this->url, [
                'from' => config('services.zenvia.from'),
                'to' => $notifiable->phone_number_to_zenvia,
                'contents' => [
                    [
                        'type' => 'text',
                        'text' => $message,
                        'encodingStrategy' => 'AUTO',
                    ],
                ],
            ]);
    }
}
