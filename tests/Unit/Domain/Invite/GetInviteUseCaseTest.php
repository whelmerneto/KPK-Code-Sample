<?php

namespace Tests\Unit\Domain\Invite;

use Domain\Invite\Enums\InviteStatusEnum;
use Domain\Invite\Interfaces\InviteRepositoryInterface;
use Domain\Invite\Models\Invite;
use Domain\Invite\Operations\GetInviteOperation;
use Domain\Invite\UseCases\GetInviteUseCase;
use Tests\TestCase;

class GetInviteUseCaseTest extends TestCase
{
    public function test_get_invite_limit_access_fully()
    {

        $id = 1;
        $dummy = [
            'used_quantity' => 10,
            'used_quantity_limit' => 10,
        ];
        $invite = $this->getInviteDummy($dummy);
        $useCase = $this->getUseCase($invite);

        $output = $useCase->handle($id);

        $this->assertEquals($output->status, InviteStatusEnum::UNAVAILABLE->value);

    }

    public function test_get_invite_canceled()
    {

        $id = 1;

        $dummy = [
            'status' => InviteStatusEnum::CANCELED->value,
        ];
        $invite = $this->getInviteDummy($dummy);
        $useCase = $this->getUseCase($invite);
        $output = $useCase->handle($id);
        $this->assertEquals($output->status, InviteStatusEnum::CANCELED->value);
    }

    public function test_get_invite_expired()
    {
        $id = 1;

        $dummy = [
            'expired_at' => '2022-05-18T19:36:44.000000Z',
        ];
        $invite = $this->getInviteDummy($dummy);
        $useCase = $this->getUseCase($invite);
        $output = $useCase->handle($id);
        $this->assertEquals($output->status, InviteStatusEnum::EXPIRED->value);
    }

    public function test_get_invite_with_success()
    {
        $id = 1;
        $invite = $this->getInviteDummy();
        $useCase = $this->getUseCase($invite);
        $output = $useCase->handle($id);
        $this->assertEquals($invite->title, $output->title);
        $this->assertEquals($invite->status, InviteStatusEnum::ACTIVE->value);
    }

    private function getInviteDummy(array $params = []): Invite
    {

        $dummy = [
            'id' => 1,
            'tenant_id' => 1381,
            'title' => 'Rafael Soto',
            'description' => null,
            'status' => InviteStatusEnum::ACTIVE->value,
            'has_voucher' => 0,
            'voucher' => null,
            'used_quantity_limit' => 100,
            'expired_at' => null,
            'created_at' => '2022-05-18T19:36:44.000000Z',
            'updated_at' => '2022-05-18T19:36:44.000000Z',
            'used_quantity' => 1,
        ];

        $invite = Invite::factory()->make(array_merge($dummy, $params));
        $invite->updateStatus();

        return $invite;
    }

    private function getUseCase(Invite $invite): GetInviteUseCase
    {
        /** @var \Mockery\MockInterface|InviteRepositoryInterface */
        $mocker = $this->mock(InviteRepositoryInterface::class);
        $mocker->shouldReceive('getById')->andReturn($invite);

        $operation = new GetInviteOperation($mocker);

        return new GetInviteUseCase($operation);
    }
}
