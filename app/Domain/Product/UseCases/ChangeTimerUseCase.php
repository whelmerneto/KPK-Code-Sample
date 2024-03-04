<?php

namespace Domain\Product\UseCases;

use Domain\Product\Data\ChangeTimerDTO;
use Domain\Product\Operations\ChangeTimerOperation;

class ChangeTimerUseCase
{
    public function __construct(private readonly ChangeTimerOperation $timerOperation)
    {
    }

    public function handle(ChangeTimerDTO $data)
    {
        return $this->timerOperation->execute($data->products, ['timer' => $data->timer]);
    }
}
