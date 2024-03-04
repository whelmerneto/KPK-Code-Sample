<?php

namespace Tests\Unit\Domain\MultiDescriptionClasses;

use Domain\MultiDescriptionClasses\UseCases\UpdateStatusMultiDescriptionClassesUseCase;
use Mockery;
use Tests\TestCase;

class UpdateStatusMultiDescriptionClassesTest extends TestCase
{
    protected $updateStatusMultiDescriptionClassesUseCase;

    public function setUp(): void
    {
        parent::setUp();

        $this->updateStatusMultiDescriptionClassesUseCase = Mockery::mock(UpdateStatusMultiDescriptionClassesUseCase::class);
    }

    /**
     * @dataProvider multiDescriptionClassesProvider
     */
    public function testCanUpdateMultiDescriptionClasses($model_id, $data, $dataResponse)
    {
        $this->updateStatusMultiDescriptionClassesUseCase
            ->shouldReceive('handle')
            ->withArgs([$model_id, $data])
            ->andReturn($dataResponse);

        $response = $this->updateStatusMultiDescriptionClassesUseCase->handle($model_id, $data);
        $this->assertTrue($response);
    }

    public static function multiDescriptionClassesProvider()
    {
        return [
            [
                'model_id' => 1,
                'data' => [
                    'id' => 1,
                    'status' => 1
                ],
                'dataResponse' => true
            ]
        ];
    }

}
