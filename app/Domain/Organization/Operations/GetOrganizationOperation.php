<?php

namespace Domain\Organization\Operations;

use Domain\Organization\Models\Organization;
use Illuminate\Database\Eloquent\Model;

/**
 * Class GetOrganizationOperation
 */
readonly class GetOrganizationOperation
{
    public function execute(array $filterParams): ?Organization
    {
        return Organization::where($filterParams)->first();
    }
}
