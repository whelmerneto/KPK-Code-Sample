<?php

namespace Domain\User\UseCases;

use Domain\User\Data\UserDTO;
use Domain\User\Operations\GetUserProgressCoursesOperation;

class GetUserProgressCoursesUseCase
{
    public function __construct(
        private readonly GetUserProgressCoursesOperation $getUserProgressCoursesOperation
    ) {
        //
    }

    public function handle(UserDTO $userDTO, $order) 
    {
      return $this->getUserProgressCoursesOperation->execute($userDTO->id, $order);
    }
}