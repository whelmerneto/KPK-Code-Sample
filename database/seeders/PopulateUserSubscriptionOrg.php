<?php

namespace Database\Seeders;

use Domain\User\Models\UserSubscription;
use Illuminate\Database\Seeder;

class PopulateUserSubscriptionOrg extends Seeder
{
    public function run(): void
    {
        UserSubscription::select([
            'user_subscription.id as sub_id',
            'ead_subscription_package.organization_id as org_id',
        ])
            ->join('ead_subscription_package', 'ead_subscription_package.id', '=', 'user_subscription.package_id')
            ->whereNull('user_subscription.organization_id')
            ->chunk(500, function ($subsWithOrgIds) {
                $updates = [];
                foreach ($subsWithOrgIds as $subscription) {
                    $updates[] = [
                        'id' => $subscription->sub_id,
                        'organization_id' => $subscription->org_id,
                    ];
                }

                if (! empty($updates)) {
                    UserSubscription::upsert($updates, ['id'], ['organization_id']);
                }
            });

    }
}
