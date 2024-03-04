<?php

namespace App\Console;

use App\Console\Commands\ManageSubscriptions;
use Domain\Sms\Commands\SmsPackageCheck;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /*
     * Não deveria ser necessário fazer isso
     * Mas o Laravel não está encontrando o comando
     * Apesar de definir a pasta de comandos no método commands()
     */
    protected $commands = [
        ManageSubscriptions::class,
        SmsPackageCheck::class,
    ];

    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {

        $schedule->command('invites:expire-command')->daily();
        //run seed PopulateUserSubscriptionOrg every five minutes
        $schedule->command('db:seed --class=PopulateUserSubscriptionOrg')->everyFiveMinutes();
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
