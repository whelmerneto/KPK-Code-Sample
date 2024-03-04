<?php

namespace App\Overloads;

use Illuminate\Foundation\Application as ApplicationLaravel;
use RuntimeException;

class Application extends ApplicationLaravel
{
    /**
     * Get the application namespace.
     *
     *
     * @throws RuntimeException
     */
    public function getNamespace(): string
    {

        if (! is_null($this->namespace)) {
            return $this->namespace;
        }

        $composer = json_decode(file_get_contents($this->basePath('composer.json')), true);

        foreach ((array) data_get($composer, 'autoload.psr-4') as $namespace => $path) {
            foreach ((array) $path as $pathChoice) {
                if (realpath($this->path()) === realpath($this->basePath($pathChoice))) {
                    return $this->namespace = $namespace;
                }
            }
        }

        return $this->namespace = 'App\Api';
    }
}
