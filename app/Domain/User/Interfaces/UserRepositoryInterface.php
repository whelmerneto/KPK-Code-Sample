<?php

namespace Domain\User\Interfaces;

use Domain\User\Data\UserCreateDTO;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection as BaseCollection;
use Support\Interfaces\BaseRepositoryInterface;

interface UserRepositoryInterface extends BaseRepositoryInterface
{
    public function isAdmin(string $user_id, int $tenant_id): bool;

    public function getFavoriteLessons(string $user_id, int $tenant_id, array $lesson_columns, array $lesson_relations): Collection;

    public function isLessonFavorite(string $user_id, string $lesson_id): bool;

    public function getStudents(int $tenant_id, ?array $packages_ids, array $columns = ['*'], array $relations = []): LengthAwarePaginator;

    public function removeLessonFavorite(string $user_id, string $class_id);

    public function addLessonFavorite(string $user_id, string $class_id, int $tenant_id, string $module_id);

    public function getCertificates(string $user_id);

    public function attachSubscriptions(string $user_id, BaseCollection $produts): void;

    public function getSubscriptions(string $user_id): Collection;

    public function firstOrCreate(array $search, UserCreateDTO $params): ?Model;
}
