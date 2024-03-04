<?php

namespace Support\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;

class EnsureTenantIdMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $validator = Validator::make(['Tenant-ID' => $request->header('tenant-id')], [
            'Tenant-ID' => ['required', 'int', 'exists:master.tenant_users,id'],
        ], [
            'Tenant-ID.required' => 'Tenant-ID vazio.',
            'Tenant-ID.integer' => 'O campo Tenant-ID deve ser um número inteiro.',
            'Tenant-ID.exists' => 'Tenant-ID não encontrado.',
        ]);
        if ($validator->fails()) {
            return response($validator->errors(), Response::HTTP_BAD_REQUEST);
        }

        $tenantID = $request->header('Tenant-ID');

        $request->merge(['tenant_id' => $tenantID]);

        return $next($request);
    }
}
