<?php

namespace Support\Repositories;

use Illuminate\Database\Query\Builder;
use Illuminate\Support\Facades\DB;

/**
 * Classe responspável para lidar com builders.
 */
abstract class BaseRepositoryQueryBuilder
{
    /**
     * A const connection é utilizada para definir qual conexão será utilizada pelo Repository.
     * Pode ser sobrescrita na classe filha.
     *
     * @var string
     */
    protected const connection = 'master';

    /**
     * A const table é utilizada para definir qual tabela será utilizada pelo Repository.
     * Pode ser sobrescrita na classe filha.
     *
     * @var string
     */
    protected const table = '';

    /**
     * Retorna uma instância do QueryBuilder do Laravel.
     * Utiliza a const connection e a const table para definir a conexão e a tabela.
     */
    final protected function getDB(): Builder
    {
        return DB::connection(static::connection)->table(static::table);
    }
}
