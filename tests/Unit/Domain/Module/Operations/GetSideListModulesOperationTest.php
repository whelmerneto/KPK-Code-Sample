<?php

namespace Tests\Unit\Domain\Module\Operations;

use Domain\Module\Interfaces\ModuleRepositoryInterface;
use Domain\Module\Operations\GetSideListModulesOperation;
use Illuminate\Database\Eloquent\Collection;
use Tests\TestCase;

class GetSideListModulesOperationTest extends TestCase
{
    public function testExecuteReturnsExpectedResult()
    {
        $repositoryMock = $this->createMock(ModuleRepositoryInterface::class);

        $filters = ['filter1' => 'value1'];
        $columns = ['column1', 'column2'];

        $expectedResult = new Collection(
            [
                'id' => '09523cba-cd39-4ed0-9a13-04765537f7f5',
                'tenant_id' => 127,
                'title' => 'Ares 2',
                'deliverable' => [
                    'released' => true,
                ],
            ]);

        $expectedResult2 = new Collection(
            [
                'id' => '09523cba-cd39-4ed0-9a13-04765537f7f5',
                'tenant_id' => 127,
                'title' => 'Ares 2',
                'deliverable' => [
                    'released' => false,
                ],
            ]);

        $expectedResult3 = new Collection(
            [
                'id' => '09523cba-cd39-4ed0-9a13-04765537f7f5',
                'tenant_id' => 127,
                'title' => 'Ares 2',
                'deliverable' => [
                    'released' => false,
                ],
            ]);

        $repositoryMock->expects($this->exactly(3))
            ->method('get')
            ->with($filters, $columns)
            ->willReturn(
                $expectedResult,
                $expectedResult2,
                $expectedResult3
            );

        $operation = new GetSideListModulesOperation($repositoryMock);

        $result = $operation->execute($filters, $columns);
        $result2 = $operation->execute($filters, $columns);
        $result3 = $operation->execute($filters, $columns);

        $this->assertSame($expectedResult, $result);
        $this->assertSame($expectedResult2, $result2);
        $this->assertSame($expectedResult3, $result3);
    }
}
