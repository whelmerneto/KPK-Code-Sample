<?php
//
//namespace Tests\Unit\Domain\Deliverable\Operation;
//
//use Domain\Deliverable\Data\RuleDTO;
//use Domain\Deliverable\Operations\CheckRuleOperation;
//use Domain\Deliverable\Operations\DeliverableRuleCache\GetDeliverableCourseRuleCacheOperation;
//use Domain\Deliverable\Operations\DeliverableRuleCache\GetDeliverableLessonRuleCacheOperation;
//use Domain\Deliverable\Operations\DeliverableRuleCache\GetDeliverableModuleRuleCacheOperation;
//use Domain\User\Data\UserSubscriptionDTO;
//use PHPUnit\Framework\MockObject\Exception;
//use PHPUnit\Framework\MockObject\MockObject;
//use Spatie\LaravelData\DataCollection;
//use Tests\TestCase;
//
////use PHPUnit\Framework\TestCase;
//
//class CheckRuleOperationTest extends TestCase
//{
//    private readonly CheckRuleOperation $check_rule_operation;
//
//    private MockObject $course_cache_operation;
//
//    private MockObject $module_cache_operation;
//
//    private MockObject $lesson_cache_operation;
//
//    /**
//     * @throws Exception
//     */
//    protected function setUp(): void
//    {
//        $this->course_cache_operation = $this->createMock(GetDeliverableCourseRuleCacheOperation::class);
//        $this->module_cache_operation = $this->createMock(GetDeliverableModuleRuleCacheOperation::class);
//        $this->lesson_cache_operation = $this->createMock(GetDeliverableLessonRuleCacheOperation::class);
//
//        $this->check_rule_operation = new CheckRuleOperation(
//            deliverableCourseOperation: $this->course_cache_operation,
//            deliverableModuleOperation: $this->module_cache_operation,
//            deliverableLessonOperation: $this->lesson_cache_operation
//        );
//        parent::setUp();
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_released_rule_course(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->course_cache_operation->expects($this->exactly(2))
//            ->method('handle')
//            ->with('some-package-id', 'some-course-id')
//            ->willReturn(
//                ['released' => false, 'rule' => 'some-rule'],
//                ['released' => true]
//            );
//
//        $result = $this->check_rule_operation->execute(
//            course_id: 'some-course-id',
//            user_subscriptions: $dummy_collection
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => true]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_released_rule_module(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->module_cache_operation->expects($this->exactly(2))
//            ->method('handle')
//            ->with('some-package-id', 'marvelous-course-id', 'bionic-module-id')
//            ->willReturn(
//                ['released' => false, 'rule' => 'some-rule'],
//                ['released' => true]
//            );
//        $result = $this->check_rule_operation->execute(
//            course_id: 'marvelous-course-id',
//            user_subscriptions: $dummy_collection,
//            module_id: 'bionic-module-id'
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => true]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_released_rule_lesson(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//
//        $this->lesson_cache_operation->expects($this->exactly(2))
//            ->method('handle')
//            ->with(
//                'some-package-id',
//                'amazing-lesson-id',
//                'incredible-course-id',
//                'fabulous-module-id',
//            )
//            ->willReturn(
//                ['released' => false, 'rule' => 'some-rule'],
//                ['released' => true]
//            );
//
//        $result = $this->check_rule_operation->execute(
//            course_id: 'incredible-course-id',
//            user_subscriptions: $dummy_collection,
//            module_id: 'fabulous-module-id',
//            lesson_id: 'amazing-lesson-id'
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => true]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_blocked_rule_course(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->course_cache_operation->expects($this->exactly($dummy_collection->count()))
//            ->method('handle')
//            ->with('some-package-id', 'some-course-id')
//            ->willReturn(
//                ['released' => false, 'rule' => ['name' => 'blocked']],
//            );
//
//        $result = $this->check_rule_operation->execute(
//            course_id: 'some-course-id',
//            user_subscriptions: $dummy_collection
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => false, 'rule' => ['name' => 'blocked']]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_blocked_rule_module(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->module_cache_operation->expects($this->exactly($dummy_collection->count()))
//            ->method('handle')
//            ->with('some-package-id', 'marvelous-course-id', 'bionic-module-id')
//            ->willReturn(
//                ['released' => false, 'rule' => ['name' => 'blocked']],
//            );
//        $result = $this->check_rule_operation->execute(
//            course_id: 'marvelous-course-id',
//            user_subscriptions: $dummy_collection,
//            module_id: 'bionic-module-id'
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => false, 'rule' => ['name' => 'blocked']]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_blocked_rule_lesson(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//
//        $this->lesson_cache_operation->expects($this->exactly($dummy_collection->count()))
//            ->method('handle')
//            ->with(
//                'some-package-id',
//                'amazing-lesson-id',
//                'incredible-course-id',
//                'fabulous-module-id',
//            )
//            ->willReturn(
//                ['released' => false, 'rule' => ['name' => 'blocked']],
//            );
//
//        $result = $this->check_rule_operation->execute(
//            course_id: 'incredible-course-id',
//            user_subscriptions: $dummy_collection,
//            module_id: 'fabulous-module-id',
//            lesson_id: 'amazing-lesson-id'
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => false, 'rule' => ['name' => 'blocked']]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_blocked_wait_days_rule_course(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->travelTo('2023-01-03 00:00:00');
//
//        $this->course_cache_operation->expects($this->exactly($dummy_collection->count()))
//            ->method('handle')
//            ->willReturnOnConsecutiveCalls(
//                ['released' => false, 'rule' => ['name' => 'blocked']],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 2000]],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 6]],
//                ['released' => false, 'rule' => ['name' => 'release_date', 'value' => '2024-02-02 00:00:00']],
//            );
//        $result = $this->check_rule_operation->execute(
//            course_id: 'some-course-id',
//            user_subscriptions: $dummy_collection
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 4]]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_released_wait_days_rule_module(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->travelTo('2023-01-05 00:00:00');
//
//        $this->module_cache_operation->expects($this->exactly($dummy_collection->count()))
//            ->method('handle')
//            ->willReturnOnConsecutiveCalls(
//                ['released' => false, 'rule' => ['name' => 'blocked']],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 2000]],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 2]],
//                ['released' => false, 'rule' => ['name' => 'release_date', 'value' => '2024-02-02 00:00:00']],
//            );
//
//        $result = $this->check_rule_operation->execute(
//            course_id: 'some-course-id',
//            user_subscriptions: $dummy_collection,
//            module_id: 'esoteric-art-ninth-form'
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => true]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_blocked_release_date_rule_lesson(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->travelTo('2023-01-05 00:00:00');
//
//        $this->lesson_cache_operation->expects($this->exactly($dummy_collection->count()))
//            ->method('handle')
//            ->willReturnOnConsecutiveCalls(
//                ['released' => false, 'rule' => ['name' => 'blocked']],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 2000]],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 7]],
//                ['released' => false, 'rule' => ['name' => 'release_date', 'value' => '2023-01-06 00:00:00']],
//            );
//
//        $result = $this->check_rule_operation->execute(
//            course_id: 'incredible-course-id',
//            user_subscriptions: $dummy_collection,
//            module_id: 'fabulous-module-id',
//            lesson_id: 'amazing-lesson-id'
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => false, 'rule' => ['name' => 'release_date', 'value' => '2023-01-06 00:00:00']]), $result);
//    }
//
//    /**
//     * @test
//     */
//    public function it_returns_correct_released_release_date_rule_course(): void
//    {
//        $dummy_collection = $this->dummyCollection();
//        $this->travelTo('2023-01-05 00:00:00');
//
//        $this->course_cache_operation->expects($this->exactly($dummy_collection->count()))
//            ->method('handle')
//            ->willReturnOnConsecutiveCalls(
//                ['released' => false, 'rule' => ['name' => 'blocked']],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 2000]],
//                ['released' => false, 'rule' => ['name' => 'wait_days', 'value' => 7]],
//                ['released' => false, 'rule' => ['name' => 'release_date', 'value' => '2023-01-04 00:00:00']],
//            );
//        $result = $this->check_rule_operation->execute(
//            course_id: 'some-course-id',
//            user_subscriptions: $dummy_collection
//        );
//
//        $this->assertEquals(RuleDTO::from(['released' => true]), $result);
//    }
//
//    private function dummyCollection(): DataCollection
//    {
//        return UserSubscriptionDTO::collection([
//            UserSubscriptionDTO::from([
//                'user_id' => 'some-user-id',
//                'package_id' => 'some-package-id',
//                'active' => true,
//                'created_at' => '2021-01-01 00:00:00',
//            ]),
//
//            UserSubscriptionDTO::from([
//                'user_id' => 'some-user-id-2',
//                'package_id' => 'some-package-id',
//                'active' => false,
//                'created_at' => '2022-01-01 00:00:00',
//            ]),
//
//            UserSubscriptionDTO::from([
//                'user_id' => 'some-user-id-3',
//                'package_id' => 'some-package-id',
//                'active' => true,
//                'created_at' => '2023-01-01 00:00:00',
//            ]),
//
//            UserSubscriptionDTO::from([
//                'user_id' => 'some-user-id-4',
//                'package_id' => 'some-package-id',
//                'active' => false,
//                'created_at' => '2024-01-01 00:00:00',
//            ]),
//        ]);
//    }
//}
