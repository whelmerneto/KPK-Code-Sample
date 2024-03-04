<?php

namespace Tests\Unit\Domain\Community;

use Domain\Community\UseCases\GetCommunityByIdUseCase;
use Exception;
use Mockery;
use PHPUnit\Framework\TestCase;

class CommunityTest extends TestCase
{

    public array $responseData;
    private $useCase;

    public function setUp(): void
    {
        parent::setUp();

        $this->useCase = Mockery::mock(GetCommunityByIdUseCase::class);

        $this->responseData = [
            "id" => 12,
            "tenant_id" => 17,
            "title" => "Sexta Feira",
            "description" => "Teste",
            "links" => "[]",
            "active" => 1,
            "show_ranking" => 1,
            "principal" => 1,
            "show_continue_watching" => 1,
            "background_color" => "/images/d_backgrounds/Azul-Claro.png",
            "shadow_color" => null,
            "primary_text_color" => "#000000",
            "secondary_text_color" => "#000000",
            "font_family" => null,
            "sales_url" => null,
            "button_sales_text" => null,
            "order" => 3,
            "logo_image_path" => "https://d2ik51dz9s180r.cloudfront.net/images/89IzkY44ycgsqz9uBBHHM2iUkBcK0zlhiOrHXpXD.png",
            "cover_image_path" => "https://d2ik51dz9s180r.cloudfront.net/images/vH0qrFsxTuc5yK17kdprrohgZM4QCbt4MSzMiLrC.png",
            "created_at" => "2023-09-29T19:43:48.000000Z",
            "updated_at" => "2023-10-06T23:57:03.000000Z",
            "hasPublicMod" => 0
        ];
    }

    public function test_if_can_get_community()
    {
        $response = $this->useCase
            ->shouldReceive('handle')
            ->once()
            ->with(12, 17, ['userId' => 'dsaghdsahjkd-jdkshdhsad'])
            ->andReturn($this->responseData);

        $this->assertNotEmpty($response);

    }

    public function test_if_user_not_have_access()
    {
        $this->useCase->shouldReceive('handle')
            ->once()
            ->with(12, 1000, ['userId' => 'jdkshdhsad-opksaospa'])
            ->andReturn([
                'message' => 'O usuário não tem acesso',
                'blocked' => true
            ]);

        $this->assertTrue('blocked' == true);

    }

}
