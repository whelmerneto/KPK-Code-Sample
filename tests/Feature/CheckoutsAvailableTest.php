<?php

use Tests\TestCase;
use Domain\Checkout\Models\CheckoutAvailable;

it('should return a list of available checkouts', function () {
    $this->get(route('checkoutsAvailable.index'))
        ->assertStatus(200)
        ->assertJsonStructure([
            'message',
            'data' => [
                ['id', 'name', 'url_image', 'manageable', 'recurrent']
            ],
        ]);
 });