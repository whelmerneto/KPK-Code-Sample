<?php

namespace Tests\Unit\Domain\MultiDescriptionClasses;

use Domain\MultiDescriptionClasses\UseCases\DeleteMultiDescriptionClassesUseCase;
use Mockery;
use Tests\TestCase;

class DeleteMultiDescriptionClassesTest extends TestCase
{
    protected $deleteMultiDescriptionClassesUseCase;

    public function setUp(): void
    {
        parent::setUp();

        $this->deleteMultiDescriptionClassesUseCase = Mockery::mock(DeleteMultiDescriptionClassesUseCase::class);
    }

    /**
     * @dataProvider multiDescriptionClassesProvider
     */
    public function testCanDeleteItem($model_id, $data, $dataResponse)
    {
        $this->deleteMultiDescriptionClassesUseCase
            ->shouldReceive('handle')
            ->withArgs([$model_id, $data])
            ->andReturn($dataResponse);

        $response = $this->deleteMultiDescriptionClassesUseCase->handle($model_id, $data);
        $this->assertTrue($response);
    }

    public static function multiDescriptionClassesProvider()
    {
        return [
            [
                'model_id' => 1,
                'data' => [
                    'id' => 1,
                ],
                'dataResponse' => true
            ]
        ];
    }
}
