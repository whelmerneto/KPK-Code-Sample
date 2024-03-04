<?php

namespace Tests\Unit\Domain\CustomHtml;

use Domain\CustomHtml\Interfaces\CustomHtmlRepositoryInterface;
use Domain\CustomHtml\Models\CustomHtml;
use Domain\CustomHtml\Operations\GetAllCustomHtmlsByTenantOperation;
use Domain\CustomHtml\UseCases\GetAllCustomHtmlsByTenantUseCase;
use Illuminate\Database\Eloquent\Collection;
use Tests\TestCase;

class GetAllCustomHtmByTenantUseCaseTest extends TestCase
{
    public function test_get_all_custom_htmls_for_tenant_with_html()
    {
        $tenantId = 2852;
        $htmlData = $this->getCustomHtmlDummy();
        $this->mock(CustomHtmlRepositoryInterface::class)
            ->shouldReceive('findByTenantId')
            ->andReturn($htmlData);

        $useCase = $this->getUseCase($htmlData);
        $output = $useCase->handle($tenantId);

        $this->assertEquals($htmlData->toArray(), $output->toArray());
    }

    private function getCustomHtmlDummy(): Collection
    {
        return CustomHtml::factory(3)->make(['tenant_id' => 2852]);
    }

    public function getUseCase(Collection $html): GetAllCustomHtmlsByTenantUseCase
    {
        /** @var \Mockery\MockInterface|CustomHtmlRepositoryInterface */
        $mocker = $this->mock(CustomHtmlRepositoryInterface::class);
        $mocker->shouldReceive('findByTenantId')->andReturn($html);
        $operation = new GetAllCustomHtmlsByTenantOperation($mocker);

        return new GetAllCustomHtmlsByTenantUseCase($operation);
    }
}
