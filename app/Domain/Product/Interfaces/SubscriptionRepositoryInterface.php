<?php

namespace Domain\Product\Interfaces;

use Support\Interfaces\BaseRepositoryInterface;

interface SubscriptionRepositoryInterface extends BaseRepositoryInterface
{
    /**
     * Realizar o update da flag de temporizador em múltiplos produtos
     *
     *
     * @return bool
     */
    public function changeTimerProducts(array $products, array $data);
}
