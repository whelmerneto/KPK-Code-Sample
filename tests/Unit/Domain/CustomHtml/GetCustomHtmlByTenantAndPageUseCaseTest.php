<?php

namespace Tests\Unit\Domain\CustomHtml;

use Domain\CustomHtml\Interfaces\CustomHtmlRepositoryInterface;
use Domain\CustomHtml\Models\CustomHtml;
use Domain\CustomHtml\Operations\GetCustomHtmlByTenantAndPageOperation;
use Domain\CustomHtml\UseCases\GetCustomHtmlByTenantAndPageUseCase;
use Tests\TestCase;

class GetCustomHtmlByTenantAndPageUseCaseTest extends TestCase
{
    public function test_get_custom_html_by_tenant_and_page()
    {
        $tenantId = 2852;
        $page = 'class';
        $htmlData = $this->getCustomHtmlDummy($tenantId, $page);
        $this->mock(CustomHtmlRepositoryInterface::class)
            ->shouldReceive('findByTenantIdAndPage')
            ->with($tenantId, $page)
            ->andReturn($htmlData);

        $useCase = $this->getUseCase($htmlData);
        $output = $useCase->handle($tenantId, $page);
        $this->assertEquals($htmlData, $output);
    }

    private function getCustomHtmlDummy(int $tenantId, string $page): ?CustomHtml
    {
        return CustomHtml::factory()->make([
            'tenant_id' => $tenantId,
            'page' => $page,
        ]);
    }

    public function getUseCase(?CustomHtml $html): GetCustomHtmlByTenantAndPageUseCase
    {
        $mocker = $this->mock(CustomHtmlRepositoryInterface::class);
        $mocker->shouldReceive('findByTenantIdAndPage')->andReturn($html);
        $operation = new GetCustomHtmlByTenantAndPageOperation($mocker);

        return new GetCustomHtmlByTenantAndPageUseCase($operation);
    }
}
