<?php

namespace Database\Seeders;

use Domain\Checkout\Models\CheckoutAvailable;
use Illuminate\Database\Seeder;

class PopulateCheckoutsAvailable extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        CheckoutAvailable::create([
            'name' => 'TMPay',
            'url_image' => '',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Sem checkout',
            'url_image' => '',
            'manageable' => false,
            'recurrent' => false,
        ]);
        CheckoutAvailable::create([
            'name' => 'Hotmart',
            'url_image' => '/images/hotmart.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Guru',
            'url_image' => '/images/logo-guru-quadrado-text.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Eduzz',
            'url_image' => '/images/edduz.png',
            'manageable' => false,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Braip',
            'url_image' => '/images/braip.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Kiwify',
            'url_image' => '/images/kiwify.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Perfectpay',
            'url_image' => '/images/perfectpay.png',
            'manageable' => false,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Greenn',
            'url_image' => '/images/green.webp',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Voomp',
            'url_image' => '/images/voomp.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Doppus',
            'url_image' => '/images/doppus.webp',
            'manageable' => false,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Monetizze',
            'url_image' => '/images/monetizze.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Ticto',
            'url_image' => '/images/ticto.jpg',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Evermart',
            'url_image' => '/images/evermart.png',
            'manageable' => false,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'Yampi',
            'url_image' => '/images/yampi.svg',
            'manageable' => false,
            'recurrent' => false,
        ]);
        CheckoutAvailable::create([
            'name' => 'PayT',
            'url_image' => '/images/payt.png',
            'manageable' => false,
            'recurrent' => false,
        ]);
        CheckoutAvailable::create([
            'name' => 'Appmax',
            'url_image' => '/images/appmax2.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
        CheckoutAvailable::create([
            'name' => 'HeroSpark',
            'url_image' => '/images/logo_herospark.png',
            'manageable' => true,
            'recurrent' => true,
        ]);
    }
}
