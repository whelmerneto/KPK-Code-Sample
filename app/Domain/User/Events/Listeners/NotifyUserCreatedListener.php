<?php

namespace Domain\User\Events\Listeners;

use Domain\User\Data\UserCreatedEventDTO;
use Domain\User\Events\UserCreatedEvent;
use Domain\User\Events\UserCreatedMailEvent;
use Log;

class NotifyUserCreatedListener
{
    public function handle(UserCreatedEvent $event): void
    {
        $user = UserCreatedEventDTO::from($event->data);
        $params = [
            'event_id' => 4,
            'user_id' => $user->id,
            'tenant_id' => $user->tenant_id,
        ];
        //TODO: verificar essa implementacao para quando eventos forem disparados não precisar de try catch
        try {
            UserCreatedMailEvent::dispatch($params);
        } catch (\Exception $e) {
            Log::error('[user][created][mail] o usuario não teve seu email disparado.', [
                'user' => $user->toArray(),
                'error' => $e->getMessage(),
            ]);
        }
    }
}
