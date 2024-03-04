<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Domain\User\Models\UserSubscription;

class AccessionDateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
     public function run()
    {
        UserSubscription::whereNotNull('payment_last_date')->update(['accession_date' => \DB::raw('payment_last_date')]);
    }
}
