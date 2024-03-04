<?php
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Domain\Checkout\UseCases\GetCheckoutsAvailableUseCase;
use Tests\TestCase;

it('returns data from cache or DB', function () {
    // Define a chave de cache esperada
    $cacheKey = 'checkoutsAvailable';

    // Define os dados de exemplo para retornar do cache ou DB
    $expectedData = [
        ['id' => 1, 'name' => 'Item 1', 'url_image' => 'image1.jpg', 'manageable' => true, 'recurrent' => false],
        ['id' => 2, 'name' => 'Item 2', 'url_image' => 'image2.jpg', 'manageable' => false, 'recurrent' => true],
    ];

    // Configura um mock para Cache com os dados esperados
    Cache::shouldReceive('remember')
        ->withArgs([$cacheKey, 60 * 60 * 24, \Closure::class])
        ->andReturnUsing(function ($key, $seconds, $callback) use ($expectedData) {
            // Chama o callback para simular a busca de dados do DB
            return $callback();
        });

    // Configura um mock para DB com os dados esperados
    DB::shouldReceive('connection')
        ->with('plataforma')
        ->andReturnSelf();
    DB::shouldReceive('table')
        ->with('checkouts_available')
        ->andReturnSelf();
    DB::shouldReceive('select')
        ->with('name', 'url_image', 'manageable', 'recurrent')
        ->andReturnSelf();
    DB::shouldReceive('get')
        ->andReturn($expectedData);

    // Chama o método handle da UseCase
    $result = (new GetCheckoutsAvailableUseCase())->handle();

    // Verifica se os dados retornados correspondem aos dados esperados
    expect($result)->toBe($expectedData);
});