<?php

namespace Tests\Unit\Domain\PlatformNotification;

use Domain\PlatformNotification\UseCases\GetPlataformNotificationUseCase;
use Domain\PlatformNotification\UseCases\UpdatePlatformNotificationUseCase;
use Mockery;
use Mockery\Mock;
use tests\TestCase;

class PlatformNotificationTest extends TestCase
{

    protected $getPlatformNotificationUseCase;
    protected $updatePlatformNotificationUseCase;

    public function setUp(): void
    {
        parent::setUp();

        $this->getPlatformNotificationUseCase = Mockery::mock(GetPlataformNotificationUseCase::class);
        $this->updatePlatformNotificationUseCase = Mockery::mock(UpdatePlatformNotificationUseCase::class);

    }

    /**
     * @dataProvider notificationProvider
     */
    public function test_if_can_get_notification($tenantId, $paginateData, $userId, $dataResponse)
    {
        $response = $this->getPlatformNotificationUseCase
            ->shouldReceive('handle')->withArgs([$paginateData, $tenantId, $userId])
            ->andReturn($dataResponse);
        $this->assertNotEmpty($response);
    }

    /**
     * @dataProvider notificationProvider
     */
    public function test_if_can_update_notification($tenantId, $paginateData, $userId, $updateData)
    {
        $reponse = $this->updatePlatformNotificationUseCase
            ->shouldReceive('handle')
            ->withArgs($updateData)
            ->andReturn('Dados atualizados');

        $this->assertNotEmpty($reponse);
    }

    public static function notificationProvider()
    {
        return [
            [
                'tenantId' => 127,
                'paginateData' => [
                    'page' => 1,
                    'paginate' => 3
                ],
                'userId' => 'fe6e6f74-b16e-410c-b999-525872049e9a',
                'updateData' => [
                    'read' => true,
                    'ids' => [1,2,4,5,6,7]
                ],
                'dataResponse' => [
                    [
                        "id" => 1,
                        "read" => 1,
                        "type" => "doubt",
                        "lesson_id" => "00646d6d-4452-4973-80e0-3a40f67c149b",
                        "lesson_title" => "aula 01",
                        "response" => "Resposta do admin 8...",
                        "created_at" => "2023-11-30 17:57:42",
                        "response_owner" => "Zagreus Barros"
                    ],
                    [
                        "id" => 2,
                        "read" => 1,
                        "type" => "doubt",
                        "lesson_id" => "00646d6d-4452-4973-80e0-3a40f67c149b",
                        "lesson_title" => "aula 01",
                        "response" => "Resposta do admin 8...",
                        "created_at" => "2023-11-30 17:57:42",
                        "response_owner" => "Zagreus Barros"
                    ],
                    [
                        "id" => 3,
                        "read" => 1,
                        "type" => "doubt",
                        "lesson_id" => "00646d6d-4452-4973-80e0-3a40f67c149b",
                        "lesson_title" => "aula 01",
                        "response" => "Resposta do admin 8...",
                        "created_at" => "2023-11-30 17:57:42",
                        "response_owner" => "Zagreus Barros"
                    ]
                ],
            ]
        ];
    }
}
