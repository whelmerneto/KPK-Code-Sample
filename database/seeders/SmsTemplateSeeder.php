<?php

namespace Database\Seeders;

use Domain\Sms\Models\SmsTemplate;
use Illuminate\Database\Seeder;

class SmsTemplateSeeder extends Seeder
{
    public function run(): void
    {
        SmsTemplate::create([
            'name' => 'Hotmart',
            'text' => 'Acesso a plataforma $plataforma' . PHP_EOL . 'Senha: $senha' . PHP_EOL,
            'event_id' => 4,
        ]);
    }
}
