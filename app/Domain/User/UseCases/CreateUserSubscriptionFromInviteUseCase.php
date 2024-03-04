<?php

namespace Domain\User\UseCases;

use Domain\Invite\Models\Invite;
use Domain\Invite\Operations\GetInviteValidOperation;
use Domain\User\Data\UserSubscriptionCreateDTO;
use Domain\User\Operations\CreateUserSubscriptionOperation;

class CreateUserSubscriptionFromInviteUseCase
{
    public function __construct(
        private readonly GetInviteValidOperation $getInviteValidOperation,
        private readonly CreateUserSubscriptionOperation $createUserSubscriptionOperation
    ) {
    }

    public function handle(UserSubscriptionCreateDTO $dto)
    {
        $invite = $this->getInviteValidOperation->execute($dto->tenant_id, $dto->invite_id);
        $this->validateVoucher($dto?->voucher, $invite);

        return $this->createUserSubscriptionOperation->execute($dto, $invite);
    }

    private function validateVoucher(string $voucher = null, Invite $invite)
    {
        $verifyVoucherUseCase = new VerifyInviteVoucherUseCase($invite);
        $verifyVoucherUseCase->handle($voucher);
    }
}
