<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
        'scheme' => 'https',
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],
    'mensageria' => [
        'base_url' => env('MENSAGERIA_BASE_URL', 'http://localhost:8001/api/'),
    ],

    'caddy' => [
        'host' => env('CADDY_HOST'),
        'port' => env('CADDY_PORT'),
        'dns' => env('APP_DNS'),
    ],

    'discord' => [
        'webhook_subscriptions_expired_csv_url' => env('DISCORD_WEBHOOK_SUBSCRIPTIONS_EXPIRED_CSV_URL', null),
        'webhook_error_url' => env('DISCORD_WEBHOOK_ERROR_URL', null),
        'webhook_sms_package_csv_url' => env('DISCORD_WEBHOOK_SMS_PACKAGE_CSV_URL', null),
    ],

    'zenvia' => [
        'base_url' => env('ZENVIA_URL', 'https://api.zenvia.com/v2/channels/'),
        'from' => env('ZENVIA_FROM', 'david3'),
        'pretend' => env('ZENVIA_PRETEND', false),
        'conta' => env('ZENVIA_CONTA', 'david@themembers.com.br'),
        'senha' => env('ZENVIA_SENHA', 'Prospect@01'),
        'x_api_token' => env('X_API_TOKEN', 'BCRV1oISeFydHr2Ddc7FeBHBLjrfPGRhuZts'),
        'event_id_new_user_access_request' => env('EVENT_ID_NEW_USER_ACCESS_REQUEST', 4),
    ],

    'tiny' => [
        'base_url' => env('TINY_URL', 'https://api.tinyurl.com/'),
        'api_token' => env('TINY_API_KEY', 'D6liRzndbuKWSUKuiGUoTSzv2Oe8SdO6fAtuxTLxNvvumZsTW4cSthYToAoz'),
    ],

    'api' => [
        'key' => env('TM_SECRET'),
    ],
];
