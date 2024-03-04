<?php

namespace Domain\User\Operations;

use Domain\Deliverable\Interfaces\DeliverableCourseRepositoryInterface;
use Domain\Deliverable\Models\DeliverableCourse;
use Domain\Module\Interfaces\ModuleRepositoryInterface;
use Domain\User\Data\UserProductsDTO;
use stdClass;

class GetUserProductsOperation
{
    public function __construct(
        private readonly GetUserSubscriptionOperation $getUserSubscriptionOperation,
        private readonly DeliverableCourseRepositoryInterface $deliverableCourseRepositoryInterface,
        private readonly ModuleRepositoryInterface $moduleRepositoryInterface,
        private readonly DeliverableCourse $deliverableCourse
    ) {
        //
    }

    public function execute(UserProductsDTO $userProductsDTO, $columns, $relations)
    {
        $packages_ids = collect($this->getUserSubscriptionOperation->execute($userProductsDTO->user_id, ['package_id']))
            ->pluck('package_id');

        $courses = $this->deliverableCourseRepositoryInterface->get(
            [
                ['tenant_id', $userProductsDTO->tenant_id],
            ],
            $columns,
            $relations
        )->whereIn('package_id', $packages_ids)
            ->filter()
            ->values();

        foreach ($courses as $course) {
            $lastModuleViwed = $course->modules->sortByDesc('lastViewed.updated_at')->first();
            $course->last_viewed_class = $lastModuleViwed;
        }

        $courses = $courses->map(function ($item) {
            $newItem = new stdClass;
            $newItem->course = $item->course;

            if (isset($item->last_viewed_class) && isset($item->last_viewed_class->lastViewed)) {
                $newItem->last_viewed_class = new stdClass;
                $lastViewed = $item->last_viewed_class->lastViewed;
                $newItem->last_viewed_class->time = $lastViewed->time;
                $newItem->last_viewed_class->to_total = $lastViewed->to_total;
                $newItem->last_viewed_class->lesson = $lastViewed->lesson;
            } else {
                $newItem->last_viewed_class = new stdClass;
                $newItem->last_viewed_class = null;
            }

            return $newItem;
        });

        return $courses;
    }
}
