<?php

namespace Support\Repositories;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Support\Interfaces\BaseRepositoryInterface;

class BaseRepository implements BaseRepositoryInterface
{
    public function __construct(
        protected Model $model
    ) {
    }

    public function create(array $data): ?Model
    {
        return $this->model->create($data);
    }

    public function update(string|int $model_id, array $data): bool
    {
        return $this->model->where('id', $model_id)->update($data);
    }

    public function updateBy(array $filters, array $data): bool
    {
        return $this->model->where($filters)->update($data);
    }

    public function getById(
        string|int $id,
        array $columns = ['*'],
        array $relations = []
    ): ?Model {
        return $this->model->select($columns)
            ->with($relations)
            ->find($id);
    }

    public function get(
        array $filters,
        array $columns = ['*'],
        array $relations = [],
        string $orderBy = null,
        string $sortBy = 'asc',
    ): Collection {
        return $this->model->select($columns)
            ->with($relations)
            ->where($filters)
            ->when($orderBy, fn (Builder $query) => $query->orderBy($orderBy, $sortBy))
            ->get();
    }

    public function getOrWhere(
        array $filters,
        array $columns = ['*'],
        array $relations = [],
    ): ?Model {
        $query = $this->model->query();
        foreach ($filters as $column => $value) {
            $query->orWhere($column, $value);
        }

        return $query->with($relations)->select($columns)->first();
    }

    public function delete(string|int $id): bool
    {
        return $this->model->where('id', $id)->delete();
    }

    public function deleteBy(array $filters): ?bool
    {
        return $this->model->where($filters)?->delete();
    }

    public function createMany(array $data): bool
    {
        $now = now();
        $data = array_map(function ($item) use ($now) {
            $item['created_at'] = $now;
            $item['updated_at'] = $now;

            return $item;
        }, $data);

        return $this->model->insert($data);
    }

    public function findBy(array $filters, array $columns = ['*'], array $relations = []): ?Model
    {
        return $this->model->select($columns)
            ->with($relations)
            ->where($filters)
            ->first();
    }

    public function exists(array $filters): bool
    {
        return $this->model->where($filters)->exists();
    }
}
