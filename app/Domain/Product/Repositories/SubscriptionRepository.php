<?php

namespace Domain\Product\Repositories;

use Domain\Product\Interfaces\SubscriptionRepositoryInterface;
use Domain\Product\Models\Product;
use Domain\User\Models\UserSubscription;
use Support\Repositories\BaseRepository;

class SubscriptionRepository extends BaseRepository implements SubscriptionRepositoryInterface
{
    public function __construct(Product $model)
    {
        parent::__construct($model);
    }

    public function changeTimerProducts(array $products, array $data)
    {
        $products = collect($products)->pluck('id')->all();

        return Product::whereIn('id', $products)->update($data);
    }

    public function update(string|int $id, array $data): bool
    {
        $product = Product::findOrFail($id);

        if(isset($data['status']) && $data['status'] == 'cancelled') {
            UserSubscription::where('package_id', '=', $product->id)->delete();
            $data['product_id'] = $product->product_id . '-old';
        }

        return $product->update($data);
    }
}
