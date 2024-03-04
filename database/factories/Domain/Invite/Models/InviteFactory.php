<?php

namespace Database\Factories\Domain\Invite\Models;

use Domain\Invite\Enums\InviteStatusEnum;
use Domain\Invite\Models\Invite;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Model;
use Str;

/**
 * @extends Factory<Invite>
 */
class InviteFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var class-string<Model>
     */
    protected $model = Invite::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $title = $this->faker->sentence();
        return [
            'slug_title' => Str::slug($title),
            'tenant_id' => TenantUser::factory(),
            'title' => $title,
            'description' => $this->faker->sentence(),
            'has_voucher' => $this->faker->boolean(),
            'voucher' => $this->faker->sentence(1),
            'used_quantity_limit' => 100,
            'used_quantity' => 1,
            'status' => $this->faker->randomElement(InviteStatusEnum::cases())->value,
            'expired_at' => $this->faker->dateTime(),
        ];
    }
}
