<?php

namespace Domain\Product\UseCases;

use Domain\Product\Operations\UpdateProductOperation;

readonly class UpdateProductUseCase
{
    public function __construct(private UpdateProductOperation $updateProductOperation)
    {
    }

    public function handle(string $id, array $data)
    {
        $this->updateProductOperation->execute($id, $data);
    }
}
