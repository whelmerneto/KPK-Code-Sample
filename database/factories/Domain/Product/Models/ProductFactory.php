<?php

namespace Database\Factories\Domain\Product\Models;

use Domain\Platform\Models\Organization;
use Domain\Product\Models\Product;
use Domain\TenantUser\Models\TenantUser;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'organization_id' => Organization::factory(),
            'title' => $this->faker->text(191),
            'description' => $this->faker->text,
            'type' => $this->faker->randomElement(['Venda única', 'Recorrente']),
            'checkout' => 'external',
            'sales_page_url' => $this->faker->url,
            'period' => $this->faker->numberBetween(1, 365),
            'value' => $this->faker->randomFloat(2, 10, 1000),
            'trial' => $this->faker->numberBetween(0, 30),
            'product_id' => $this->faker->text(191),
            'support_email' => $this->faker->email,
            'image_url' => $this->faker->imageUrl(),
            'timer' => $this->faker->boolean,
            'salesInSite' => $this->faker->numberBetween(0, 1000),
            'typePaymentPlan' => $this->faker->text(191),
            'sugestionPurchaseIdPlan' => $this->faker->text(191),
            'plan_iugu_id' => $this->faker->text(191),
            'form_of_payment' => $this->faker->text(191),
            'qtd_parcelas' => $this->faker->numberBetween(1, 12),
            'pix' => $this->faker->boolean,
            'lifetime' => $this->faker->boolean,
            'boleto' => $this->faker->boolean,
            'reimbursement' => $this->faker->numberBetween(0, 1000),
            'limit_cobrancas' => $this->faker->numberBetween(0, 1000),
            'status' => $this->faker->text(191),
            'checkout_name' => $this->faker->text(191),
            'external_checkout_product' => $this->faker->text(191),
            'upsell' => $this->faker->text(191),
            'upsell_url' => $this->faker->url,
            'pixel_tiktok_event_when_generate_bank_slip' => $this->faker->boolean,
            'pixel_tiktok_custom_conversion_value' => $this->faker->numberBetween(0, 1000),
            'pixel_facebook_event_when_generate_bank_slip' => $this->faker->boolean,
            'pixel_facebook_custom_conversion_value' => $this->faker->numberBetween(0, 1000),
            'solicitation_date' => $this->faker->dateTime,
            'interval_type' => $this->faker->text(191),
            'interval' => $this->faker->numberBetween(1, 30),
            'user_id' => User::factory(),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
