<?php

use Domain\Product\UseCases\ListProductsUseCase;
use Illuminate\Support\Facades\DB;

it('returns data from DB', function () {
    // Define os dados de exemplo para retornar ou DB
    $expectedData = [
        ['id' => 1, 'title' => 'Item 1', 'type' => 'Venda única', 'period' => '180'],
        ['id' => 2, 'title' => 'Item 2', 'type' => 'Recorrente', 'period' => '360'],
    ];

    // Configura um mock para DB com os dados esperados
    DB::shouldReceive('connection')
        ->with('plataforma')
        ->andReturnSelf();
    DB::shouldReceive('table')
        ->with('ead_subscription_package')
        ->andReturnSelf();
    DB::shouldReceive('select')
        ->with('id', 'title', 'period', 'status')
        ->andReturnSelf();
    DB::shouldReceive('get')
        ->andReturn($expectedData);

    $orgId = '1533';

    // Chama o método handle da UseCase
    $result = (new ListProductsUseCase())->handle($orgId);

    // Verifica se os dados retornados correspondem aos dados esperados
    expect($result)->toBe($expectedData);
});
