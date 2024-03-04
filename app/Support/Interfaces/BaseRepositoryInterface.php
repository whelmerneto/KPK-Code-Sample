<?php

namespace Support\Interfaces;

use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Interface BaseRepositoryInterface.
 */
interface BaseRepositoryInterface
{
    /**
     * Insere os dados da entidade com os dados informados.
     *
     * @throws Exception
     */
    public function create(array $data): ?Model;

    /**
     * Atualiza os dados da entidade com os dados informados.
     */
    public function update(string|int $model_id, array $data): bool;

    /**
     *  Atualiza os dados da entidade com os dados informados com base nos filtros.
     *
     * @param  array  $filters [['column','value'], ['column','value']]
     */
    public function updateBy(array $filters, array $data): bool;

    /**
     * Lista os dados pelo ‘id’ informado
     *
     * @throws Exception
     */
    public function getById(
        string|int $id,
        array $columns = ['*'],
        array $relations = []
    ): ?Model;

    /**
     * Lista os dados pelos filtros informados
     *
     * @param  array  $filters [['column','value'], ['column','value']]
     */
    public function get(
        array $filters,
        array $columns = ['*'],
        array $relations = [],
        string $orderBy = null,
        string $sortBy = 'asc',
    ): Collection;

    /**
     * @param  array  $filters [['column' => 'value'], ['column' => 'value']]
     */
    public function getOrWhere(
        array $filters,
        array $columns = ['*'],
        array $relations = [],
    ): ?Model;

    /**
     * Remove o registro pelo ID informado
     */
    public function delete(string|int $id): bool;

    /**
     * Deleta os registros com base nos filtros informados
     *
     * @param  array  $filters [['column','value'], ['column','value']]
     */
    public function deleteBy(array $filters): ?bool;

    /**
     *  Cria vários registros com base nos dados informados
     */
    public function createMany(array $data): bool;

    /**
     * Busca o primeiro registro com base nos filtros informados
     *
     * @param  array  $filters [['column','value'], ['column','value']]
     */
    public function findBy(array $filters, array $columns = ['*'], array $relations = []): ?Model;

    public function exists(array $filters): bool;
}
