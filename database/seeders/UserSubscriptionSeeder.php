<?php

namespace Database\Seeders;

use Domain\Product\Models\Product;
use Domain\User\Models\User;
use Domain\User\Models\UserSubscription;
use Illuminate\Database\Seeder;

class UserSubscriptionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::where('email', '=', 'aluno@teste.com')->first();
        $product = Product::first();
        UserSubscription::create([
            'tenant_id' => $user->tenant_id,
            'user_id' => $user->id,
            'organization_id' => $user->tenant()->first()->organization_id,
            'active' => true,
            'package_id' => $product->id,
            'contract_id' => 9999,
            'contract_invoice' => 9999,
            'payment_last_date' => now()->subDay(15),
            'expiration_date' => now()->addDay(15),
            'accession_date' => now()->subMonth(2),
        ]);
    }
}
