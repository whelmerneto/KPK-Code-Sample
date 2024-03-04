<?php

namespace Domain\User\Operations;

use Domain\User\Interfaces\UserRepositoryInterface;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Model;

/**
 * Class GetUserOperation
 */
readonly class GetUserCertificatesOperation
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
    public function execute(string $user_id)
    {
        return $this->user_repository->getCertificates($user_id);
    }
}
