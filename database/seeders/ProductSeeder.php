<?php

namespace Database\Seeders;

use Domain\Platform\Models\Organization;
use Domain\Product\Models\Product;
use Domain\TenantUser\Models\TenantUser;
use Domain\User\Models\User;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tenant = TenantUser::first();
        $admin = User::where('email', '=', 'admin@teste.com')->first();
        Product::create([
            'tenant_id' => $tenant->id,
            'organization_id' => $tenant->organization_id,
            'title' => 'Novo produto',
            'description' => 'Tempora atque voluptate dignissimos officiis sequi.',
            'type' => 'Venda única',
            'checkout' => 'external',
            'checkout_id' => 3,
            'period' => 30,
            'product_id' => 12345667,
            'pix' => false,
            'lifetime' => false,
            'boleto' => false,
            'status' => 'active',
            'external_checkout_product' => 'hotmart01.11',
            'user_id' => $admin->id,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
