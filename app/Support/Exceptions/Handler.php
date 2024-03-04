<?php

namespace Support\Exceptions;

use Domain\Invite\Exceptions\InviteExpiredException;
use Domain\Invite\Exceptions\InviteInvalidStatusException;
use Domain\Invite\Exceptions\InviteLimitException;
use Domain\Invite\Exceptions\InviteNotFoundException;
use Domain\Invite\Exceptions\InviteWithInvalidVoucherException;
use Domain\User\Exceptions\UserAlreadyExistsException;
use Domain\User\Exceptions\UserBlockedException;
use Domain\User\Exceptions\UserCannotBeCreatedException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @throws Throwable
     */
    public function render($request, Throwable $e)
    {
        $exceptionHandlers = [
            TokenExpiredException::class => ['Expired Token', 401],
            InviteNotFoundException::class => [$e->getMessage(), $e->getCode()],
            UserAlreadyExistsException::class => [$e->getMessage(), $e->getCode()],
            UserBlockedException::class => [$e->getMessage(), $e->getCode()],
            UserCannotBeCreatedException::class => [$e->getMessage(), $e->getCode()],
            InviteExpiredException::class => [$e->getMessage(), $e->getCode()],
            InviteLimitException::class => [$e->getMessage(), $e->getCode()],
            InviteInvalidStatusException::class => [$e->getMessage(), $e->getCode()],
            InviteWithInvalidVoucherException::class => [$e->getMessage(), $e->getCode()],
        ];

        foreach ($exceptionHandlers as $exceptionClass => [$message, $statusCode]) {
            if ($e instanceof $exceptionClass) {
                return response()->json(['error' => $message], $statusCode);
            }
        }

        return parent::render($request, $e);
    }
}
