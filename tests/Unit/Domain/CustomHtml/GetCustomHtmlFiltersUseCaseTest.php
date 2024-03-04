<?php

namespace Tests\Unit\Domain\CustomHtml;

use Domain\Community\Models\CommunityTenant;
use Domain\CustomHtml\Interfaces\CustomHtmlRepositoryInterface;
use Domain\CustomHtml\Models\CustomHtml;
use Domain\CustomHtml\Operations\GetCustomHtmlFiltersOperation;
use Domain\CustomHtml\UseCases\GetCustomHtmlFiltersUseCase;
use Tests\TestCase;

class GetCustomHtmlFiltersUseCaseTest extends TestCase
{
    public function test_get_custom_html_community_filter()
    {
        $tentantID = 1;
        $page = 'community';
        $community = CommunityTenant::factory(1)->make();
        $relation = ['communities' => $community];
        $data = $this->dummyData($page, $relation);
        /** @var \Mockery\MockInterface|CustomHtmlRepositoryInterface */
        $repository = $this->mock(CustomHtmlRepositoryInterface::class);
        $repository->shouldReceive('get')
            ->andReturn($data);

        $operation = new GetCustomHtmlFiltersOperation($repository);
        $useCase = new GetCustomHtmlFiltersUseCase($operation);
        $output = $useCase->handle($tentantID, $page);

        $this->assertEquals($data, $output);
        $this->assertArrayHasKey('communities', $output->toArray()[0]);
    }

    private function dummyData($page, $relation)
    {

        return CustomHtml::factory(2)->make([
            'page' => $page,
            'platform_page' => $page,
            ...$relation,
        ]);
    }
}
