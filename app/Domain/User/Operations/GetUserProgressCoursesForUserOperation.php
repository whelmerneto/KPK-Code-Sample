<?php

namespace Domain\User\Operations;

use Domain\Course\Interfaces\CourseRepositoryInterface;

/**
 * Class GetUserProgressCoursesForUserOperation
 */
readonly class GetUserProgressCoursesForUserOperation
{
    /**
     * Construtor.
     */
    public function __construct(private CourseRepositoryInterface $courseRepositoryInterface)
    {
    }

    public function execute(string $user_id, string $order)
    {
        $done = [];
        $inProgress = [];
        $courses = $this->courseRepositoryInterface->getProgressCoursesByUser($user_id, $order);

        foreach($courses as $c)
        {
            if($c['progress'] == 100)
            {
                $done[] = $c;
            }

            if($c['progress'] < 100 && $c['progress'] > 0)
            {
                $inProgress[] = $c;
            }
        }

        $result['inProgress'] = $inProgress;
        $result['done'] = $done;
        $result['courses'] = $courses;

        return $result;
    }
}
