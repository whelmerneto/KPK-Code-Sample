<?php

namespace Domain\User\Operations;

use Domain\User\Interfaces\UserRepositoryInterface;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Model;

/**
 * Class GetUserOperation
 */
readonly class GetUserOperation
{
    /**
     * Construtor.
     */
    public function __construct(private UserRepositoryInterface $user_repository)
    {
    }

    /**
     * Realiza operação de buscar o usuário.
     *
     * @return Model|null
     */
    public function execute(array $filter_params): ?User
    {
        return $this->user_repository->getOrWhere($filter_params);
    }
}
