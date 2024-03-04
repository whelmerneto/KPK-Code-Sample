<?php

namespace Domain\User\Operations;

use DB;
use Domain\User\Data\UserCreateDTO;
use Domain\User\Exceptions\UserAlreadyExistsException;
use Domain\User\Interfaces\UserRepositoryInterface;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class CreateUserOperation
{
    public function __construct(private readonly UserRepositoryInterface $userRepositoryInterface)
    {
    }

    public function execute(UserCreateDTO $userDto, ?int $roleId = 4): ?Model
    {
        return DB::transaction(function () use ($userDto, $roleId) {
            $exceptParams = ['invite_id', 'has_voucher', 'voucher'];
            $data = $userDto->except(...$exceptParams)->toArray();

            $user = User::firstOrCreate(['email' => $userDto->email], $data);
            $role = $user->roles()->where('tenant_id', '=', $data['tenant_id'])->first();
            if(!$role) {
                $user->roles()->attach([
                    $roleId => [
                        'tenant_id' => $data['tenant_id'],
                        'created_at' => now(),
                        'updated_at' => now(),
                    ],
                ]);
            }
            return $user;
        });
    }
}
