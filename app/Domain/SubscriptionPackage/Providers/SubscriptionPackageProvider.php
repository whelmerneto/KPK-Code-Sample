<?php

namespace Domain\SubscriptionPackage\Providers;

use Domain\SubscriptionPackage\Interfaces\SubscriptionPackageRepositoryInterface;
use Domain\SubscriptionPackage\Repositories\SubscriptionPackageRepository;
use Illuminate\Support\ServiceProvider;

class SubscriptionPackageProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(SubscriptionPackageRepositoryInterface::class, SubscriptionPackageRepository::class);
    }
    public function boot(): void
    {
        //
    }
}
