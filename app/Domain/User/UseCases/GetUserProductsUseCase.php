<?php

namespace Domain\User\UseCases;

use Domain\User\Data\UserProductsDTO;
use Domain\User\Operations\GetUserProductsOperation;

class GetUserProductsUseCase
{
    public function __construct(
        private readonly GetUserProductsOperation $getUserProductsOperation
    ) {
        //
    }

    public function handle(UserProductsDTO $userProductsDTO)
    {
        $relations = [
            'modules' => function ($query) use ($userProductsDTO) {
                $query->select('id', 'course_id')
                    ->with([
                        'lastViewed' => function ($query) use ($userProductsDTO) {
                            $query->select('module_id', 'class_id', 'time', 'to_total', 'updated_at')
                                ->where('user_id', $userProductsDTO->user_id)
                                ->with('lesson:id,title,slug');
                        },
                    ]);
            },
            'course:id,url_cover_vertical,title,slug',
        ];
        $columns = ['package_id', 'course_id'];

        return $this->getUserProductsOperation->execute($userProductsDTO, $columns, $relations);
    }
}
