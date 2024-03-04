<?php

namespace Support\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class VerifyApiKey
{
    public function handle(Request $request, Closure $next)
    {
        $tmSecret = $request->header('TM_SECRET');
        $apiKey = config('services.api.key');

        if ($apiKey !== $tmSecret) {
            abort(401, 'Unauthorized');
        }

        return $next($request);
    }
}
