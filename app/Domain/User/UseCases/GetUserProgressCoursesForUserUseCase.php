<?php

namespace Domain\User\UseCases;

use Domain\User\Data\UserDTO;
use Domain\User\Operations\GetUserProgressCoursesForUserOperation;

class GetUserProgressCoursesForUserUseCase
{
    public function __construct(
        private readonly GetUserProgressCoursesForUserOperation $getUserProgressCoursesForUserOperation
    ) {
        //
    }

    public function handle(UserDTO $userDTO, $order) 
    {
      return $this->getUserProgressCoursesForUserOperation->execute($userDTO->id, $order);
    }
}