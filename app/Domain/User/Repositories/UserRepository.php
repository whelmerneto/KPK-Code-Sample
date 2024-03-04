<?php

namespace Domain\User\Repositories;

use Domain\User\Data\UserCreateDTO;
use Domain\User\Interfaces\UserRepositoryInterface;
use Domain\User\Models\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection as BaseCollection;
use Support\Repositories\BaseRepository;

class UserRepository extends BaseRepository implements UserRepositoryInterface
{
    public function __construct(User $model)
    {
        parent::__construct($model);
    }

    public function isAdmin(string $user_id, int $tenant_id): bool
    {
        return $this->new(['id' => $user_id])->isAdmin($tenant_id);
    }

    public function getFavoriteLessons(string $user_id, int $tenant_id, array $lesson_columns, array $lesson_relations): Collection
    {
        return $this
            ->new(['id' => $user_id])
            ->favoriteLessons()
            ->wherePivot('tenant_id', $tenant_id)
            ->select($lesson_columns)
            ->published()
            ->with($lesson_relations)
            ->get()
            ->map(function ($lesson) {
                $lesson->favorite = true;

                return $lesson;
            });
    }

    public function new(array $columns): User
    {
        return new User($columns);
    }

    public function getStudents(int $tenant_id, ?array $packages_ids, array $columns = ['*'], $relations = []): LengthAwarePaginator
    {
        $query = $this->model->select($columns)->students($tenant_id)->with($relations);
        if ($packages_ids) {
            $query->subscribed($packages_ids, $tenant_id);
        }

        return $query->paginate(10);
    }

    public function isLessonFavorite(string $user_id, string $lesson_id): bool
    {
        return $this->new(['id' => $user_id])->favoriteLessons()->where('class_id', $lesson_id)->exists();
    }

    public function removeLessonFavorite(string $user_id, string $class_id)
    {
        $this->new(['id' => $user_id])->favoriteLessons()->detach($class_id);
    }

    public function addLessonFavorite(string $user_id, string $class_id, int $tenant_id, string $module_id)
    {
        $this->new(['id' => $user_id])->favoriteLessons()->attach($class_id, ['tenant_id' => $tenant_id, 'module_id' => $module_id]);
    }

    public function getCertificates(string $user_id)
    {
        return $this->new(['id' => $user_id])->certificates()->get();
    }

    public function getSubscriptions(string $user_id): Collection
    {
        return $this->model->newInstance(['id' => $user_id])->subscriptions;
    }

    public function attachSubscriptions(string $user_id, BaseCollection $products): void
    {
        $this->model->newInstance(['id' => $user_id])->subscriptions()->insert($products->toArray());
    }

    public function firstOrCreate(array $search, UserCreateDTO $params): ?Model
    {
        return $this->model->firstOrCreate($search, $params->toArray());
    }
}
