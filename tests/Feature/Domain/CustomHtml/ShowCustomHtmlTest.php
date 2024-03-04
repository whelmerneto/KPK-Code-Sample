<?php

namespace Tests\Feature\Domain\CustomHtml;

use Domain\CustomHtml\Models\CustomHtml;
use Domain\Lesson\Models\Lesson;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ShowCustomHtmlTest extends TestCase
{
    use RefreshDatabase;
    use WithFaker;

    /**
     * @test
     */
    public function it_gets_correct_custom_html_for_a_given_resource_page()
    {
        $html = CustomHtml::factory()->create();
        $lesson = Lesson::factory()->create();

        $lesson->customHtmls()->attach($html->id);

        $response = $this->get(route('custom-html.show', ['page' => 'lesson', 'resource_id' => $lesson->id, 'tenant_id' => 127]));

        $response->assertOk();
        self::assertEqualsCanonicalizing([$html->toArray()], $response->json('data'));
    }

    /**
     * @test
     */
    public function it_gets_nothing_when_resource_does_not_have_any_custom_html()
    {
        $lesson = Lesson::factory()->create();

        $response = $this->get(route('custom-html.show', ['page' => 'lesson', 'resource_id' => $lesson->id, 'tenant_id' => 127]));

        $response->assertOk();
        self::assertEmpty($response->json('data'));
    }

    /**
     * @test
     */
    public function it_gets_correct_custom_html_for_a_given_generic_page()
    {
        $html = CustomHtml::factory()->create([
            'page' => 'homepage',
        ]);
        $response = $this->get(route('custom-html.show', ['page' => 'homepage', 'tenant_id' => 127]));

        $response->assertOk();
        self::assertEqualsCanonicalizing([$html->toArray()], $response->json('data'));
    }

    /**
     * @test
     */
    public function it_gets_nothing_when_there_is_no_custom_html_for_a_given_generic_page()
    {
        $response = $this->get(route('custom-html.show', ['page' => 'homepage', 'tenant_id' => 127]));

        $response->assertOk();
        self::assertEmpty($response->json('data'));
    }
}
