<?php

namespace Domain\UrlShortener\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class UrlShortenerService
{
    const PREFIX = 'create/';
    private string $url;
    private string $apiToken;

    public function __construct()
    {
        $this->url = config('services.tiny.base_url');
        $this->apiToken = config('services.tiny.api_token');
    }

    public function shortenUrl(string $url) :string
    {
        $response = Http::withHeaders([
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
        ])
        ->post($this->url . self::PREFIX . '?api_token=' . $this->apiToken, [
            'url' => $url,
            'domain' => 'tinyurl.com',
            'description' => 'string'
        ]);

        if ($response->failed()) {
            $error = $response->json();
            Log::error('Erro ao encurtar URL: ' . json_encode($error));
            return 'https://' . $url;
        }

        return $response->json()['data']['tiny_url'];
    }
}