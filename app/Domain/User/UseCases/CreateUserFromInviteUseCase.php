<?php

namespace Domain\User\UseCases;

use Domain\Invite\Models\Invite;
use Domain\Invite\Operations\GetInviteValidOperation;
use Domain\User\Data\UserCreatedEventDTO;
use Domain\User\Data\UserCreateDTO;
use Domain\User\Exceptions\UserCannotBeCreatedException;
use Domain\User\Operations\CreateUserOperation;
use Domain\User\Operations\DispatchUserCreatedOperation;

class CreateUserFromInviteUseCase
{
    public function __construct(
        private readonly GetInviteValidOperation $getInviteValidOperation,
        private readonly CreateUserOperation $createUserOperation,
        private readonly DispatchUserCreatedOperation $dispatchUserCreatedOperation
    ) {
    }

    public function handle(UserCreateDTO $dto)
    {
        $invite = $this->getValidInvite($dto);
        $this->validateVoucher($dto, $invite);

        $dto->tenant_id = $invite->tenant_id;
        $dto->remember_token = $dto->password;

        $user = $this->createUserOperation->execute($dto);

        $this->handleUserCreation($user, $invite);

        return $user;
    }

    private function getValidInvite(UserCreateDTO $dto)
    {
        return $this->getInviteValidOperation->execute($dto->tenant_id, $dto->invite_id);
    }

    private function validateVoucher(UserCreateDTO $dto, Invite $invite)
    {
        $verifyVoucherUseCase = new VerifyInviteVoucherUseCase($invite);
        $verifyVoucherUseCase->handle($dto?->voucher);
    }

    private function handleUserCreation($user, $invite)
    {
        if (! $user) {
            throw new UserCannotBeCreatedException();
        }

        if (! $user->invites()->where(['invite_id' => $invite->id])->exists()) {
            $invite->increment_used_quantity();
            $invite->check_used_quantity();
            $user->invites()->attach($invite->id);
        }

        $this->dispatchUserCreatedOperation->execute(
            UserCreatedEventDTO::from([...$user->only('id', 'name', 'email'), 'tenant_id' => $invite->tenant_id, 'invite_id' => $invite->id])
        );
    }
}
