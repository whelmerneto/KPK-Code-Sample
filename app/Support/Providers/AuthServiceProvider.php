<?php

namespace Support\Providers;

use Domain\Lead\Models\Lead;
use Domain\Lead\Policies\LeadPolicy;
use Domain\Sms\Models\SmsPackage;
use Domain\Sms\Policies\SmsPackagePolicy;
use Domain\Sms\Models\SmsHistory;
use Domain\Sms\Policies\SmsHistoryPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{

    protected $policies = [
        SmsPackage::class => SmsPackagePolicy::class,
        SmsHistory::class => SmsHistoryPolicy::class,
        Lead::class => LeadPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        //
    }
}
