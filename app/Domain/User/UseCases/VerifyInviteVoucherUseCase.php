<?php

namespace Domain\User\UseCases;

use Domain\Invite\Exceptions\InviteWithInvalidVoucherException;
use Domain\Invite\Models\Invite;

class VerifyInviteVoucherUseCase
{
    public function __construct(private readonly Invite $invite)
    {
    }

    public function handle(string $voucher = null)
    {
        if ($this->invite->has_voucher && ($voucher !== $this->invite->voucher)) {
            throw new InviteWithInvalidVoucherException();
        }
    }
}
