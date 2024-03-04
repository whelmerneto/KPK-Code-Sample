<?php

namespace Tests\Unit\Domain\PushNotification\UseCase;

use Domain\PushNotification\Interfaces\PushNotificationServiceInterface;
use Domain\PushNotification\UseCases\DeletePushNotificationUseCase;
use Tests\TestCase;

class DeletePushNotificationUseCaseTest extends TestCase
{
    public function test_update_push_notification()
    {
        $useCase = $this->getUseCase();
        $res = $useCase->handle(21);
        $this->assertJson(true, $res);
    }

    private function getUseCase()
    {
        /** @var \Mockery\MockInterface|PushNotificationServiceInterface */
        $mocker = $this->mock(PushNotificationServiceInterface::class);
        $mocker->shouldReceive('delete')->andReturn(true);

        return new DeletePushNotificationUseCase($mocker);
    }
}
