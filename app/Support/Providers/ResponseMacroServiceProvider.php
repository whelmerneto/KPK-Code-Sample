<?php

namespace Support\Providers;

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\ServiceProvider;
use Symfony\Component\HttpFoundation\Response as ResponseEnum;

class ResponseMacroServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {

        // Generates a JSON response for a Bad Request (HTTP 400) with the given message, error description, and status code.
        Response::macro('badRequest', function (string $message, string $error = 'Bad Requests', int $statusCode = ResponseEnum::HTTP_BAD_REQUEST): JsonResponse {
            $response = [
                'message' => $message,
                'error' => $error,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for an Unauthorized request (HTTP 401) with the given message, error description, and status code.
        Response::macro('unauthorized', function (string $message, string $error = 'Não autorizado', int $statusCode = ResponseEnum::HTTP_UNAUTHORIZED): JsonResponse {
            $response = [
                'message' => $message,
                'error' => $error,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for a Forbidden request (HTTP 403) with the given message, error description, and status code.
        Response::macro('forbidden', function (string $message, string $error = 'Ação não permitida', int $statusCode = ResponseEnum::HTTP_FORBIDDEN): JsonResponse {
            $response = [
                'message' => $message,
                'error' => $error,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for a Not Found request (HTTP 404) with the given message, error description, and status code.
        Response::macro('notFound', function (string $message, string $error = 'Não encontrado', int $statusCode = ResponseEnum::HTTP_NOT_FOUND): JsonResponse {
            $response = [
                'message' => $message,
                'error' => $error,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for an Internal Server Error (HTTP 500) with the given message, error description, and status code.
        Response::macro('internalServerError', function (string $message, string $error = 'Erro interno do servidor', int $statusCode = ResponseEnum::HTTP_INTERNAL_SERVER_ERROR): JsonResponse {
            $response = [
                'message' => $message,
                'error' => $error,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for an Unprocessable Entity (HTTP 422) with the given message, error description, and status code.
        Response::macro('unprocessableEntity', function (string $message, string $error = 'Entidade não processável', int $statusCode = ResponseEnum::HTTP_UNPROCESSABLE_ENTITY): JsonResponse {
            $response = [
                'message' => $message,
                'error' => $error,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for a Created request (HTTP 201) with the given data, message, and status code.
        Response::macro('created', function ($data, string $message = 'Recurso criado com sucesso', int $statusCode = ResponseEnum::HTTP_CREATED): JsonResponse {
            $response = [
                'message' => $message,
                'data' => $data,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for an Updated request (HTTP 200) with the given data, message, and status code.
        Response::macro('updated', function ($data, string $message = 'Recurso atualizado com sucesso', int $statusCode = ResponseEnum::HTTP_OK): JsonResponse {
            $response = [
                'message' => $message,
                'data' => $data,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for a Deleted request (HTTP 200) with the given message and status code.
        Response::macro('deleted', function (string $message = 'Recurso deletado com sucesso', int $statusCode = ResponseEnum::HTTP_OK): JsonResponse {
            $response = [
                'message' => $message,
            ];

            return Response::json($response, $statusCode);
        });

        // Generates a JSON response for a successful request (HTTP 200) with the given data, message, and status code.
        Response::macro('success', function ($data, string $message = 'Requisição realizada com sucesso', int $statusCode = ResponseEnum::HTTP_OK): JsonResponse {
            $response = [
                'message' => $message,
                'data' => $data,
            ];

            return Response::json($response, $statusCode);
        });

    }
}
