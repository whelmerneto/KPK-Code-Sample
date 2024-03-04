<?php

namespace Tests\Unit\Domain\MultiDescriptionClasses;

use Domain\MultiDescriptionClasses\UseCases\UpdateMultiDescriptionClassesUseCase;
use Mockery;
use Tests\TestCase;

class UpdateMultiDescriptionClassesTest extends TestCase
{

    protected $updateMultiDescriptionClassesUseCase;

    public function setUp(): void
    {
        parent::setUp();

        $this->updateMultiDescriptionClassesUseCase = Mockery::mock(UpdateMultiDescriptionClassesUseCase::class);
    }

    /**
     * @dataProvider multiDescriptionClassesProvider
     */
    public function testCanGetNotification($model_id, $data, $dataResponse)
    {
        $this->updateMultiDescriptionClassesUseCase
            ->shouldReceive('handle')
            ->withArgs([$model_id, $data])
            ->andReturn($dataResponse);

        $response = $this->updateMultiDescriptionClassesUseCase->handle($model_id, $data);
        $this->assertTrue($response);
    }

    public static function multiDescriptionClassesProvider()
    {
        return [
            [
                'model_id' => 1,
                'data' => [
                    'name' => 'Novo Nome',
                ],
                'dataResponse' => true
            ]
        ];
    }

}
