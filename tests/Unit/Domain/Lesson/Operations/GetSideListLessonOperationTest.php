<?php

namespace Tests\Unit\Domain\Lesson\Operations;

use Domain\Lesson\Interfaces\LessonRepositoryInterface;
use Domain\Lesson\Operations\GetSideListLessonsOperation;
use Illuminate\Database\Eloquent\Collection;
use Tests\TestCase;

class GetSideListLessonOperationTest extends TestCase
{
    public function testExecuteReturnsExpectedResult()
    {
        $repositoryMock = $this->createMock(LessonRepositoryInterface::class);

        $filters = ['filter1' => 'value1'];
        $columns = ['column1', 'column2'];
        $relations = ['relation1', 'relation2'];

        $expectedResult = new Collection([
            'id' => '45e84923-0bb4-4417-a083-900533204c96',
            'title' => 'teste de aula',
            'module_id' => '09523cba-cd39-4ed0-9a13-04765537f7f5',
            'slug' => 'teste-de-aula',
            'deliverable' => [
                'released' => true,
            ],
            'user_history' => [
                [
                    'class_id' => '45d3fed1-ef14-499f-8e8a-e1cef0be5475',
                    'rate_up' => null,
                    'finished' => 1,
                ],
            ],
        ]);
        $expectedResult2 = new Collection([
            'id' => '45e84923-0bb4-4417-a083-900533204c96',
            'title' => 'teste de aula 2',
            'module_id' => '09523cba-cd39-4ed0-9a13-009988990080',
            'slug' => 'teste-de-aula',
            'deliverable' => [
                'released' => true,
            ],
            'user_history' => [
                [
                    'class_id' => '45d3fed1-ef14-499f-8e8a-998877665544',
                    'rate_up' => null,
                    'finished' => 1,
                ],
            ],
        ]);
        $expectedResult3 = new Collection([
            'id' => '45e84923-0bb4-4417-a083-900533204c96',
            'title' => 'teste de aula 3',
            'module_id' => '09523cba-cd39-4ed0-9a13-009988998877',
            'slug' => 'teste-de-aula',
            'deliverable' => [
                'released' => true,
            ],
            'user_history' => [
                [
                    'class_id' => '45d3fed1-ef14-499f-8e8a-ddgg6655hh88',
                    'rate_up' => null,
                    'finished' => 1,
                ],
            ],
        ]);

        $repositoryMock->expects($this->exactly(3))
            ->method('get')
            ->with($filters, $columns, $relations)
            ->willReturn(
                $expectedResult,
                $expectedResult2,
                $expectedResult3);

        $operation = new GetSideListLessonsOperation($repositoryMock);

        $result = $operation->execute($filters, $columns, $relations);
        $result2 = $operation->execute($filters, $columns, $relations);
        $result3 = $operation->execute($filters, $columns, $relations);

        $this->assertSame($expectedResult, $result);
        $this->assertSame($expectedResult2, $result2);
        $this->assertSame($expectedResult3, $result3);
    }
}
