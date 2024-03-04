<?php

namespace Tests\Unit\Domain\CustomHtml;

use Domain\CustomHtml\Models\CustomHtml;
use Tests\TestCase;

class DeleteCustomHtmlTest extends TestCase
{
    public function testDeleteCustomHtml()
    {
        $customHtml = CustomHtml::create();

        $response = $this->delete("/api/custom-html/{$customHtml->html_id}");

        $response->assertStatus(200);

        $this->assertEquals($response, 200);
    }
}
