<?php

namespace Domain\User\Providers;

use Domain\User\Interfaces\UserBlacklistRepositoryInterface;
use Domain\User\Interfaces\UserRepositoryInterface;
use Domain\User\Interfaces\UserSubscriptionRepositoryInterface;
use Domain\User\Repositories\UserBlacklistRepository;
use Domain\User\Repositories\UserRepository;
use Domain\User\Repositories\UserSubscriptionRepository;
use Illuminate\Support\ServiceProvider;

class UserProvider extends ServiceProvider
{
    public function register(): void
    {

        $this->app->bind(
            UserSubscriptionRepositoryInterface::class,
            UserSubscriptionRepository::class
        );

        $this->app->bind(
            UserRepositoryInterface::class,
            UserRepository::class);

        $this->app->bind(
            UserBlacklistRepositoryInterface::class,
            UserBlacklistRepository::class);

    }

    public function boot(): void
    {
    }
}
