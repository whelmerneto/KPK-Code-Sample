<?php

use Domain\MagicLink\Models\MagicLink;
use Domain\User\Models\User;

// tentativa de criar link com tenant válido
it('attempts to create a link with a valid tenant', function () {
    $user = User::factory()->create();
    $response = $this->get(route('magic-links.generate'), [
        'user_id' => $user->id,
        'tenant_id' => $user->tenant_id
    ])
    ->assertStatus(200)
    ->assertJsonStructure([
        'url',
    ]);
});

// tentativa de criar link com tenant inválido
it('attempts to create a link with a invalid tenant', function () {
    $user = User::factory()->create();
    $response = $this->get(route('magic-links.generate'), [
        'user_id' => $user->id,
        'tenant_id' => 'invalid'
    ])
    ->assertStatus(401);
});

// tentativa de validação de token já utilizado
// tentativa de validação de assinatura inválida
// tentativa de validação de data expirada
