<?php

namespace Tests\Unit\Domain\Community;

use Domain\Community\Interfaces\CommunityTenantRepositoryInterface;
use Domain\Community\Operations\UpdateCommunityTenantLogoOperation;
use Domain\Community\UseCases\UpdateCommunityTenantCoverUseCase;
use Domain\Community\UseCases\UpdateCommunityTenantLogoUseCase;
use Mockery;
use PHPUnit\Framework\TestCase;
use Support\Services\S3Service;

class CommunityTenantTest extends TestCase
{
    private $logoUseCase;
    private $repository;
    private $data;
    private $coverUseCase;
    private int $communityId;
    private int $communityIdFail;

    protected function setUp(): void
    {
        parent::setUp();
        $this->repository = Mockery::mock(CommunityTenantRepositoryInterface::class);
        $this->logoUseCase = Mockery::mock(UpdateCommunityTenantLogoUseCase::class);
        $this->coverUseCase = Mockery::mock(UpdateCommunityTenantCoverUseCase::class);
        $this->data = new \stdClass();
        $this->communityId = 123;
        $this->communityIdFail = 456;
    }

    public function test_if_can_update_logo_image()
    {
        $repository = $this->repository;

        $repository->shouldReceive('getById')
            ->once()
            ->with($this->communityId)
            ->andReturn(['id' => $this->communityId]);

        $useCase = $this->logoUseCase;
        $useCase->shouldReceive('handle')
            ->once()
            ->with($repository, $this->communityId, $this->data)
            ->andReturn(true);

        $this->assertTrue( $useCase == true);
    }

    public function test_if_can_not_update_logo_image()
    {
        $this->expectException(\Exception::class);

        $repository = $this->repository;
        $repository->shouldReceive('getById')
            ->once()
            ->with($this->communityIdFail)
            ->andReturn([]);

        $this->logoUseCase->handle($repository, $this->communityIdFail, $this->data);
    }

    public function test_if_can_update_cover_image()
    {

        $repository = $this->repository;

        $repository->shouldReceive('getById')
            ->once()
            ->with($this->communityId)
            ->andReturn(['id' => $this->communityId]);

        $useCase = $this->coverUseCase;
        $useCase->shouldReceive('handle')
            ->once()
            ->with($repository, $this->communityId, $this->data)
            ->andReturn(true);

        $this->assertTrue( $useCase == true);
    }

    public function test_if_can_not_update_cover_image()
    {
        $this->expectException(\Exception::class);

        $repository = $this->repository;
        $repository->shouldReceive('getById')
            ->once()
            ->with($this->communityId)
            ->andReturn([]);

        $this->coverUseCase->handle($repository, $this->communityId, $this->data);
    }
}
