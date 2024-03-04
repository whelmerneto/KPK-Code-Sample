<?php

namespace Domain\User\UseCases;

use Domain\Community\Operations\GetCommunityRankingUserInfoOperation;
use Domain\User\Data\UserDTO;
use Domain\User\Operations\GetUserCertificatesOperation;
use Domain\User\Operations\GetUserCoursesOperation;
use Domain\User\Operations\GetUserProgressCoursesOperation;

class GetUserConsumptionReportUseCase
{
    public function __construct(
        private readonly GetUserCertificatesOperation $getUserCertificatesOperation,
        private readonly GetUserCoursesOperation $getUserCoursesOperation,
        private readonly GetCommunityRankingUserInfoOperation $getCommunityRankingUserInfoOperation,
    ) {
        //
    }

    public function handle(UserDTO $userDTO)
    {
      // Indicadores
      $certificates = $this->getUserCertificatesOperation->execute($userDTO->id)->count();
      $coursesFinished = $this->getUserCoursesOperation->execute($userDTO->id, ['finished' => true])->count();
      $coursesInProgress = $this->getUserCoursesOperation->execute($userDTO->id, ['finished' => false])->count();
      $points = $this->getCommunityRankingUserInfoOperation->execute($userDTO->id, $userDTO->tenant_id)->score ?? '0';

      return [
        'indicators' => [
          'certificates' => $certificates,
          'courses'=> [
            'finished' => $coursesFinished,
            'inProgress' => $coursesInProgress
          ],
          'points' => $points
        ] 
      ];
    }
}