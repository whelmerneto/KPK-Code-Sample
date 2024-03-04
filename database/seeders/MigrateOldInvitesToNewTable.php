<?php

namespace Database\Seeders;

use Domain\Invite\Models\Invite;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MigrateOldInvitesToNewTable extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Migrar os dados da tabela antiga "registration_links" para a nova tabela "invites"

        // Obtém os Convites da tabela antiga que ainda não foram migrados
        $oldRecords = DB::connection('master')->table('registration_links')
            ->whereNotIn('id', function ($query) {
                $query->select('old_uuid')->from('invites');
            })->get();
        $i = 0;
        $qtdRegistros = count($oldRecords);
        echo "\nIniciando Migração dos registros\n";
        $tempo_inicial = microtime(true);
        foreach ($oldRecords as $oldRecord) {
            // Estimativa de tempo de execução
            $i++;
            if ($i % 10 === 0) {
                echo "\nMigrado {$i} de " . $qtdRegistros . ' registros';
                $tempoExecucao = microtime(true) - $tempo_inicial;
                $tempoExecucaoMinutos = round($tempoExecucao / 60, 0);
                $tempoExecucaoSegundos = round($tempoExecucao % 60, 0);
                echo "\n\tTempo de Execução: " . $tempoExecucaoMinutos . ' minutos e ' . $tempoExecucaoSegundos . ' segundos';
                $tempoEstimado = (microtime(true) - $tempo_inicial) / $i * $qtdRegistros;
                $tempoEstimadoMinutos = round($tempoEstimado / 60, 0);
                $tempoEstimadoSegundos = round($tempoEstimado % 60, 0);
                echo "\n\tTempo Estimado: " . $tempoEstimadoMinutos . ' minutos e ' . $tempoEstimadoSegundos . ' segundos';
            }

            // Verifica se os dados da tabela antiga "registration_links" estão completos
            if (! isset($oldRecord->title)) {
                $oldRecord->title = 'Convite';
            }
            if (! isset($oldRecord->access_limit)) {
                // Valor definido pelo time de CS com base na qtd de uso dos convites atuais
                // (A maior qtd de usos de um convite sem limite definido, e com Status Ativo é de cerca de 1800 usos)
                $oldRecord->access_limit = 2000;
            }
            if (! isset($oldRecord->expired_at)) {
                // Valor definido pelo time de CS
                $oldRecord->expired_at = '2024-12-31 23:59:59';
            }

            $usedQuantityOldRecord = DB::connection('plataforma')->table('users')
                ->where('registration_link_id', $oldRecord->id)->count();

            // Migra os dados da tabela antiga "registration_links" para a nova tabela "invites"
            $invite = Invite::create([
                'old_uuid' => $oldRecord->id,
                'tenant_id' => $oldRecord->tenant_id,
                'title' => $oldRecord->title,
                'slug_title' => $oldRecord->slug_title,
                'description' => $oldRecord->description,
                'has_voucher' => $oldRecord->cupom_status,
                'voucher' => $oldRecord->cupom,
                'used_quantity_limit' => $oldRecord->access_limit,
                'used_quantity' => $usedQuantityOldRecord,
                'expired_at' => $oldRecord->expired_at,
                'created_at' => $oldRecord->created_at,
                'updated_at' => $oldRecord->updated_at,
            ]);

            // Migra os dados da tabela antiga "ead_package_registration_link" para a nova tabela "invites_packages"
            $packages_invites_old = DB::connection('master')->table('ead_package_registration_link')
                ->select('package_id')
                ->where('registration_link_id', $invite->old_uuid)->get();
            DB::connection('master')->table('invites_packages')->insert(
                $packages_invites_old->map(function ($package) use ($invite) {
                    return [
                        'invite_id' => $invite->id,
                        'package_id' => $package->package_id,
                    ];
                })->toArray()
            );

            // Migra os dados da coluna "registration_link_id" da tabela "users" para a nova tabela "invites_user"
            $users_invites_old = DB::connection('plataforma')->table('users')
                ->select('id')
                ->where('registration_link_id', $invite->old_uuid)->get();
            DB::connection('master')->table('invites_user')->insert(
                $users_invites_old->map(function ($user) use ($invite) {
                    return [
                        'invite_id' => $invite->id,
                        'user_id' => $user->id,
                    ];
                })->toArray()
            );
        }
    }
}
