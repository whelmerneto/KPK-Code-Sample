<?php

namespace Domain\User\Operations;

use Domain\Course\Interfaces\CourseRepositoryInterface;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Model;

/**
 * Class GetUserOperation
 */
readonly class GetUserCoursesOperation
{
    /**
     * Construtor.
     */
    public function __construct(private CourseRepositoryInterface $courseRepositoryInterface)
    {
    }

    /**
     * Realiza operação de buscar o usuário.
     *
     * @return Model|null
     */
    public function execute(string $user_id, array $filters)
    {
        return $this->courseRepositoryInterface->getCoursesByUser($user_id, $filters);
    }
}
