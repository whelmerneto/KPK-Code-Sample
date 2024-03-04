<?php

namespace Support\Jobs;

use Domain\DashboardData\Models\DashboardData;
use Domain\Statistics\UseCases\GetStatisticsUseCase;
use Domain\TenantUser\Models\TenantUser;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class StatisticsJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct(
        private readonly GetStatisticsUseCase $getStatisticsUseCase
    )
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $tenants = TenantUser::select('id')->get();
        foreach ($tenants as $tenant) {
            $statistics = $this->getStatisticsUseCase->handle($tenant->id);
            DashboardData::updateOrCreate([
                'tenant_id' => $tenant->id
            ], [
                'content' => json_encode($statistics)
            ]);
        }
    }
}
