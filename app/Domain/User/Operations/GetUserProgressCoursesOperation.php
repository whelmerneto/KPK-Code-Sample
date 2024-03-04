<?php

namespace Domain\User\Operations;

use Domain\Course\Interfaces\CourseRepositoryInterface;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Model;

/**
 * Class GetUserOperation
 */
readonly class GetUserProgressCoursesOperation
{
    /**
     * Construtor.
     */
    public function __construct(private CourseRepositoryInterface $courseRepositoryInterface)
    {
    }

    public function execute(string $user_id, string $order)
    {
        return $this->courseRepositoryInterface->getProgressCoursesByUser($user_id, $order);
    }
}
