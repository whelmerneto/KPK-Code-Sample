<?php

namespace Database\Factories\Domain\Deliverable\Models;

use Domain\Deliverable\Models\DeliverablePlatform;
use Domain\Product\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class DeliverablePlatformFactory extends Factory
{
    protected $model = DeliverablePlatform::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $product = Product::factory()->create();
        return [
            'product_id' => $product->id,
            'tenant_id' => $product->tenant_id,
        ];
    }
}
