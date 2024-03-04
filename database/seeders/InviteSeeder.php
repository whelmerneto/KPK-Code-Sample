<?php

namespace Database\Seeders;

use Domain\Invite\Enums\InviteStatusEnum;
use Domain\Invite\Models\Invite;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Database\Seeder;

class InviteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tenant = TenantUser::first();
        Invite::create(
            [
                'slug_title' => 'convite1',
                'tenant_id' => $tenant->id,
                'title' => 'convite 1',
                'description' => 'Convite ativo com quantidade e data válida',
                'has_voucher' => true,
                'voucher' => 'Voucher1',
                'used_quantity_limit' => 10,
                'used_quantity' => 1,
                'status' => InviteStatusEnum::ACTIVE->value,
                'expired_at' => now()->addYear(),
            ],
            [
                'slug_title' => 'convite2',
                'tenant_id' => $tenant->id,
                'title' => 'convite 2',
                'description' => 'Convite ativo com quantidade e data expirada',
                'has_voucher' => true,
                'voucher' => 'Voucher2',
                'used_quantity_limit' => 10,
                'used_quantity' => 1,
                'status' => InviteStatusEnum::ACTIVE->value,
                'expired_at' => now()->subYear(),
            ],
            [
                'slug_title' => 'convite3',
                'tenant_id' => $tenant->id,
                'title' => 'convite 3',
                'description' => 'Convite ativo sem quantidade e data válida',
                'has_voucher' => true,
                'voucher' => 'Voucher3',
                'used_quantity_limit' => 10,
                'used_quantity' => 10,
                'status' => InviteStatusEnum::ACTIVE->value,
                'expired_at' => now()->subYear(),
            ],
            [
                'slug_title' => 'convite4',
                'tenant_id' => $tenant->id,
                'title' => 'convite 3',
                'description' => 'Convite ativo sem quantidade e data válida',
                'has_voucher' => true,
                'voucher' => 'Voucher4',
                'used_quantity_limit' => 10,
                'used_quantity' => 10,
                'status' => InviteStatusEnum::ACTIVE->value,
                'expired_at' => now()->subYear(),
            ],
        );
    }
}
