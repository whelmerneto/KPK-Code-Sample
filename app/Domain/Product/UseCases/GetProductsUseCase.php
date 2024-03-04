<?php

namespace Domain\Product\UseCases;

use Domain\Product\Operations\GetProductsOperation;

class GetProductsUseCase
{
    public function __construct(private readonly GetProductsOperation $getProductOperation)
    {
    }

    public function handle(array $filters = [])
    {
        return $this->getProductOperation->execute($filters, ['id', 'title', 'description', 'timer']);
    }
}
