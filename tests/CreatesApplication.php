<?php

namespace Tests;

use Illuminate\Contracts\Console\Kernel;
use Illuminate\Foundation\Application;

trait CreatesApplication
{
    /**
     * Creates the application.
     */
    public function createApplication(): Application
    {
        $app = require __DIR__.'/../bootstrap/app.php';

        $app->make(Kernel::class)->bootstrap();

        if ($app->env !== 'testing') {
            throw new TestCannotBeExecutedException('Só é possivel executar os testes no ambiente de Teste.');
        }

        return $app;
    }
}
