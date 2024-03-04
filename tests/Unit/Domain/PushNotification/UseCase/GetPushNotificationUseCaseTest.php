<?php

namespace Tests\Unit\Domain\PushNotification\UseCase;

use Domain\PushNotification\Interfaces\PushNotificationServiceInterface;
use Domain\PushNotification\UseCases\GetPushNotificationUseCase;
use Tests\TestCase;

class GetPushNotificationUseCaseTest extends TestCase
{
    public function test_get_with_success()
    {
        $useCase = $this->getUseCase();
        $res = $useCase->handle(1);
        $this->assertJson($this->getResponse(), $res);
    }

    private function getUseCase()
    {
        /** @var \Mockery\MockInterface|PushNotificationServiceInterface */
        $mocker = $this->mock(PushNotificationServiceInterface::class);
        $mocker->shouldReceive('get')->andReturn($this->getResponse());

        return new GetPushNotificationUseCase($mocker);
    }

    private function getResponse()
    {
        return '{
            "current_page": 1,
            "data": [
                {
                    "id": 21,
                    "organization_id": 1,
                    "message": "{\"recipients\":[\"94902bbc-45cc-11ee-be56-0242ac120002\"],\"message\":{\"title\":\"teste push\",\"body\":\"test body\"},\"organization_id\":1,\"schedule_at\":\"2023-09-14 00:00:00\"}",
                    "queue": "PushNotification",
                    "schedule_at": "2023-09-14 14:49:00",
                    "published_at": "2023-09-14 18:09:46",
                    "created_at": "2023-09-14T17:49:00.000000Z",
                    "updated_at": "2023-09-14T18:09:46.000000Z"
                },
                {
                    "id": 22,
                    "organization_id": 1,
                    "message": "{\"recipients\":[\"94902bbc-45cc-11ee-be56-0242ac120002\"],\"message\":{\"title\":\"teste push\",\"body\":\"test body\"},\"organization_id\":1,\"schedule_at\":\"2023-09-14 00:00:00\"}",
                    "queue": "PushNotification",
                    "schedule_at": "2023-09-14 14:49:34",
                    "published_at": "2023-09-14 18:09:46",
                    "created_at": "2023-09-14T17:49:34.000000Z",
                    "updated_at": "2023-09-14T18:09:46.000000Z"
                }
            ],
            "first_page_url": "http://localhost:8001/api/raw-messages/1?page=1",
            "from": 1,
            "last_page": 4,
            "last_page_url": "http://localhost:8001/api/raw-messages/1?page=4",
            "links": [
                {
                    "url": null,
                    "label": "&laquo; Previous",
                    "active": false
                },
                {
                    "url": "http://localhost:8001/api/raw-messages/1?page=1",
                    "label": "1",
                    "active": true
                },
                {
                    "url": "http://localhost:8001/api/raw-messages/1?page=2",
                    "label": "2",
                    "active": false
                },
                {
                    "url": "http://localhost:8001/api/raw-messages/1?page=3",
                    "label": "3",
                    "active": false
                },
                {
                    "url": "http://localhost:8001/api/raw-messages/1?page=4",
                    "label": "4",
                    "active": false
                },
                {
                    "url": "http://localhost:8001/api/raw-messages/1?page=2",
                    "label": "Next &raquo;",
                    "active": false
                }
            ],
            "next_page_url": "http://localhost:8001/api/raw-messages/1?page=2",
            "path": "http://localhost:8001/api/raw-messages/1",
            "per_page": 2,
            "prev_page_url": null,
            "to": 2,
            "total": 8
        }';
    }
}
