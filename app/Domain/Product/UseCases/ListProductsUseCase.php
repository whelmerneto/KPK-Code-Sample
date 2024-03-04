<?php

namespace Domain\Product\UseCases;

use Domain\Product\Models\Product;
use Illuminate\Support\Facades\DB;

readonly class ListProductsUseCase
{
    public function __construct()
    {
    }

    public function handle(string $orgId, string $search = null)
    {
        $qb = app(Product::class)->newQuery();
        $qb->select('ead_subscription_package.id', 'ead_subscription_package.title', 'ead_subscription_package.type', 'ead_subscription_package.period', 'ead_subscription_package.status', 'ckt.id AS checkout_id', 'ckt.name AS have_checkout', 'ckt.manageable', 'ckt.recurrent', 'ckt.url_image', DB::raw('count(sub.id) as subscriptions'))
            ->leftJoin('checkouts_available as ckt', 'ead_subscription_package.checkout_id', '=', 'ckt.id')
            ->leftJoin('user_subscription as sub', 'ead_subscription_package.id', '=', 'sub.package_id')
            ->where('ead_subscription_package.organization_id', '=', $orgId)
            ->orderByRaw("FIELD(ead_subscription_package.status , 'active', 'inactive', 'cancelled') ASC")
            ->orderBy('ckt.name', 'ASC')
            ->orderBy('ead_subscription_package.title', 'ASC');

        if ($search) {
            $qb->where('title', 'LIKE', '%' . $search . '%');
        }

        return $qb->groupBy('ead_subscription_package.id')->paginate(10);
    }
}
