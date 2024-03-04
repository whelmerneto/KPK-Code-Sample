<?php

namespace Tests\Unit\Domain\CustomHtml;

use Domain\Community\Models\CommunityTenant;
use Domain\CustomHtml\Data\CreateCustomHtmlDto;
use Domain\CustomHtml\Interfaces\CustomHtmlRepositoryInterface;
use Domain\CustomHtml\Models\CustomHtml;
use Domain\CustomHtml\Operations\CreateCustomHtmlOperation;
use Domain\CustomHtml\UseCases\CreateCustomHtmlUseCase;
use Illuminate\Database\Eloquent\Model;
use Tests\TestCase;

class CreateCustomHtmlTest extends TestCase
{
    public function test_create_custom_html()
    {
        $customHtml = $this->getCustomHtmlDummy();
        $dto = CreateCustomHtmlDto::from($customHtml->toArray());

        $useCase = $this->getUseCase($customHtml);
        $result = $useCase->handle($dto);

        $this->assertEquals($customHtml, $result);
    }

    private function getCustomHtmlDummy(): Model
    {
        $community = CommunityTenant::factory()->make();

        return CustomHtml::factory()->make([
            'embeddable_id' => $community->id,
            'embeddable_type' => CommunityTenant::class,
        ]);
    }

    private function getUseCase($customHtml)
    {
        /** @var \Mockery\MockInterface|CustomHtmlRepositoryInterface */
        $mocker = $this->mock(CustomHtmlRepositoryInterface::class);
        $mocker->shouldReceive('create')->andReturn($customHtml);
        $operation = new CreateCustomHtmlOperation($mocker);

        return new CreateCustomHtmlUseCase($operation);
    }
}
