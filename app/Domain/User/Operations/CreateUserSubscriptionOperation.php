<?php

namespace Domain\User\Operations;

use DB;
use Domain\Invite\Models\Invite;
use Domain\User\Data\UserInviteSubscribedEventDTO;
use Domain\User\Data\UserSubscriptionCreateDTO;
use Domain\User\Events\UserInviteSubscribedEvent;
use Domain\User\Interfaces\UserRepositoryInterface;
use Domain\User\Models\User;

class CreateUserSubscriptionOperation
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository
    ) {
    }

    public function execute(UserSubscriptionCreateDTO $dto, Invite $invite, int $roleId = 4)
    {
        return DB::transaction(function () use ($dto, $invite, $roleId) {
            $user = $this->getUserById($dto->user_id);

            $this->attachUserRoleIfNeeded($user, $roleId);

            $this->incrementUsedQuantityAndAttachInvite($invite, $user);

            $this->dispatchUserCreatedEvent($user, $invite);

            return $user;
        });
    }

    private function getUserById(string $userId): User
    {
        return $this->userRepository->getById($userId);
    }

    private function attachUserRoleIfNeeded($user, int $roleId)
    {
        $existingRole = $user->roles()->where('tenant_id', $user->tenant_id)->first();

        if (! $existingRole) {
            $user->roles()->attach([
                $roleId => ['tenant_id' => $user->tenant_id],
            ]);
        }
    }

    private function incrementUsedQuantityAndAttachInvite(Invite $invite, $user)
    {
        if (! $user->invites()->where(['invite_id' => $invite->id])->exists()) {
            $invite->increment_used_quantity();
            $user->invites()->attach($invite->id);
        }
    }

    private function dispatchUserCreatedEvent(User $user, Invite $invite)
    {
        UserInviteSubscribedEvent::dispatch(
            UserInviteSubscribedEventDTO::from(['user_id' => $user->id, 'invite_id' => $invite->id])
        );
    }
}
