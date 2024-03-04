<?php

namespace Tests\Unit\Domain\CustomHtml;

use Domain\CustomHtml\Models\CustomHtml;
use Domain\CustomHtml\Operations\UpdateCustomHtmlOperation;
use Domain\CustomHtml\UseCases\UpdateCustomHtmlUseCase;
use Tests\TestCase;

class UpdateCustomHtmlTest extends TestCase
{
    public function test_handle_method_updates_custom_html()
    {
        $customHtml = $this->createCustomHtml();

        $updatedData = [
            'name' => 'Novo Nome',
        ];

        $updateCustomHtmlOperation = $this->mock(UpdateCustomHtmlOperation::class);
        $updateCustomHtmlOperation->shouldReceive('execute')
            ->withArgs([$updatedData, $customHtml->id])
            ->andReturn($customHtml);
        $handler = new UpdateCustomHtmlUseCase($updateCustomHtmlOperation);
        $result = $handler->handle($updatedData, $customHtml->id);
        $this->assertEquals($customHtml->id, $result->id);
        $this->assertEquals('Novo Nome', $result->name);
    }

    private function createCustomHtml(): CustomHtml
    {
        return CustomHtml::factory()->create();
    }
}
