<?php

namespace Database\Seeders;

use Domain\Deliverable\Models\DeliverablePlatform;
use Domain\Product\Models\Product;
use Illuminate\Database\Seeder;

class DeliverablePlatformSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $product = Product::first();
        DeliverablePlatform::create([
            'product_id' => $product->id,
            'tenant_id' => $product->tenant_id
        ]);
    }
}
