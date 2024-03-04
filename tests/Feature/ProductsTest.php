<?php

use Domain\Product\Models\Product;
use Illuminate\Pagination\LengthAwarePaginator;

it('should return a list of products', function () {
    $response = $this->get(route('products.index'), [
        'orgId' => '127',
    ])
        ->assertStatus(200)
        ->assertJsonStructure([
            'message',
            'data' => [
                'current_page',
                'data' => [
                    ['id', 'title', 'type', 'period', 'status', 'manageable', 'recurrent', 'url_image', 'subscriptions'],
                ],
                'first_page_url', 'from', 'last_page', 'last_page_url', 'links' => [], 'next_page_url', 'path', 'per_page', 'prev_page_url', 'to', 'total',
            ],
        ]);

    // Verifique se a resposta contém uma instância de LengthAwarePaginator
    $this->assertInstanceOf(LengthAwarePaginator::class, $response->original['data']);

    // Verifique se o número de itens por página corresponde ao tamanho da página padrão (10)
    $this->assertEquals(10, count($response->original['data']));

    // Verifique se os links de paginação estão presentes na resposta
    $this->assertArrayHasKey('links', $response->original['data']->toArray());
});

it('updates an existing product successfully', function () {
    $product = Product::factory()->create();
    $data = ['status' => 'inactive'];
    $this->putJson(route('products.update', $product->id), $data)
        ->assertStatus(200)
        ->assertJsonStructure(['message', 'data']);

    $this->assertDatabaseHas('plataforma.ead_subscription_package', [
        'id' => $product->id,
        'status' => 'inactive',
    ]);
});

it('attempts to update a non-existent product', function () {
    $data = ['status' => 'inactive'];
    $this->putJson(route('products.update', 'invalid-id'), $data)
        ->assertStatus(500)
        ->assertJsonStructure(['message', 'error']);
});

it('tries to update a product with an invalid status', function () {
    $product = Product::factory()->create();
    $data = ['status' => 'invalid'];
    $this->putJson(route('products.update', $product->id), $data)
        ->assertStatus(422)
        ->assertJsonStructure(['message', 'errors' => ['status']]);
});
