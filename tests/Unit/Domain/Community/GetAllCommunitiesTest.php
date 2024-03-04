<?php

namespace Unit\Domain\Community;


use Domain\Community\Interfaces\CommunityTenantRepositoryInterface;
use Domain\Community\Models\CommunityTenant;
use Illuminate\Database\Eloquent\Collection;
use Tests\TestCase;


class GetAllCommunitiesTest extends TestCase
{
    public function test_get_all_communities_dummy()
    {
        $communities = $this->getCustomCommunityDummy();
        $this->assertNotEmpty($communities);

    }

    public function test_get_all_communities_use_case()
    {
        $communityTenantMocker = $this->mock(CommunityTenantRepositoryInterface::class);
        $communityTenantMocker->shouldReceive('getAllCommunities');
        $this->assertNotEmpty($communityTenantMocker);
    }

    private function getCustomCommunityDummy(): Collection
    {
        return CommunityTenant::factory()->count(3)->make();
    }

    public function test_get_all_communities_use_case_with_mock()
    {
        $communityTenantMocker = $this->mock(CommunityTenantRepositoryInterface::class);
        $communityTenantMocker->shouldReceive('getAllCommunities')->andReturn($this->getCustomCommunityDummy());
        $this->assertNotEmpty($communityTenantMocker);
    }


}
