<?php

namespace Tests\Unit\Domain\PushNotification\UseCase;

use Domain\PushNotification\Interfaces\PushNotificationServiceInterface;
use Domain\PushNotification\UseCases\UpdatePushNotificationUseCase;
use Tests\TestCase;

class UpdatePushNotificationUseCaseTest extends TestCase
{
    public function test_update_push_notification()
    {
        $useCase = $this->getUseCase();
        $res = $useCase->handle(21, [
            'title' => 'Update Push Notification',
            'body' => 'test body',
            'schedule_at' => '2023-09-14 14:49:00',
        ]);
        $this->assertJson($this->getResponse(), $res);
    }

    private function getUseCase()
    {
        /** @var \Mockery\MockInterface|PushNotificationServiceInterface */
        $mocker = $this->mock(PushNotificationServiceInterface::class);
        $mocker->shouldReceive('update')->andReturn($this->getResponse());

        return new UpdatePushNotificationUseCase($mocker);
    }

    private function getResponse()
    {
        return '{
            "id": 21,
            "organization_id": 1,
            "message": "{\"recipients\":[\"94902bbc-45cc-11ee-be56-0242ac120002\"],\"message\":{\"title\":\"Update Push Notification\",\"body\":\"test body\"},\"organization_id\":1,\"schedule_at\":\"2023-09-14 00:00:00\"}",
            "queue": "PushNotification",
            "schedule_at": "2023-09-14 14:49:00",
            "published_at": null,
            "created_at": "2023-09-14T17:49:00.000000Z",
            "updated_at": "2023-09-20T14:42:34.000000Z",
            "title": "Update Push Notification"
        }';
    }
}
