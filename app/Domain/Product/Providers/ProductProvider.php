<?php

namespace Domain\Product\Providers;

use Domain\Product\Interfaces\SubscriptionRepositoryInterface;
use Domain\Product\Repositories\SubscriptionRepository;
use Illuminate\Support\ServiceProvider;

class ProductProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->bind(SubscriptionRepositoryInterface::class, SubscriptionRepository::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
