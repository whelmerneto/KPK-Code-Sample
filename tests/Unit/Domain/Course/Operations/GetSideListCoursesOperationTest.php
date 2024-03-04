<?php

namespace Tests\Unit\Domain\Course\Operations;

use Domain\Course\Interfaces\CourseRepositoryInterface;
use Domain\Course\Operation\GetSideListCoursesOperation;
use Illuminate\Database\Eloquent\Collection;
use Tests\TestCase;

class GetSideListCoursesOperationTest extends TestCase
{
    public function testExecuteReturnsExpectedResult()
    {
        $repositoryMock = $this->createMock(CourseRepositoryInterface::class);

        $filters = ['filter1' => 'value1'];
        $columns = ['column1', 'column2'];
        $relations = ['relation1', 'relation2'];

        $expectedResult1 = new Collection([
            [
                'id' => '14a25d8b-3a2a-47a4-b434-b6e0516b7562',
                'title' => 'Como matar deuses 2 - edit',
                'deliverable' => [
                    'released' => true,
                ],
            ],
        ]);
        $expectedResult2 = new Collection([
            [
                'id' => '1a2b3c4d-5e6f-7g8h-9i0j-a1b2c3d4e5f6',
                'title' => 'Another Course',
                'deliverable' => [
                    'released' => true,
                ],
            ],
        ]);
        $expectedResult3 = new Collection([
            [
                'id' => 'aabbccdd-eeff-0011-2233-445566778899',
                'title' => 'Yet Another Course',
                'deliverable' => [
                    'released' => true,
                ],
            ],
        ]);

        $repositoryMock->expects($this->exactly(3))
            ->method('get')
            ->willReturnOnConsecutiveCalls(
                $expectedResult1,
                $expectedResult2,
                $expectedResult3
            );

        $operation = new GetSideListCoursesOperation($repositoryMock);

        $result1 = $operation->execute($filters, $columns, $relations);
        $result2 = $operation->execute($filters, $columns, $relations);
        $result3 = $operation->execute($filters, $columns, $relations);

        $this->assertSame($expectedResult1, $result1);
        $this->assertSame($expectedResult2, $result2);
        $this->assertSame($expectedResult3, $result3);
    }
}
