<?php

namespace Domain\User\Data;

use Carbon\Carbon;
use DateTime;
use Spatie\LaravelData\Data;
use Spatie\LaravelData\Optional;

class UserDTO extends Data
{
    public function __construct(
        public string|Optional $id,
        public int|Optional $tenant_id,
        public string|Optional $registration_link_id,
        public string|Optional $name,
        public string|Optional $email,
        public string|Optional $cupom,
        public string|Optional $last_name,
        public string|Optional $description,
        public string|Optional $photo_url,
        public string|Optional $document,
        public int|Optional $person_type,
        public string|Optional $cpf_cnpj,
        public string|Optional $resp_cpf,
        public string|Optional $company_name,
        public string|Optional $correntista,
        public string|Optional $business_type,
        public string|Optional $bank,
        public string|Optional $bank_ag,
        public string|Optional $bank_cc,
        public int|Optional $account_type,
        public string|Optional $genre,
        public DateTime|Optional $birth,
        public string|Optional $phone,
        public int|Optional $auth,
        public string|Optional $status,
        public DateTime|Optional $email_verified_at,
        public string|Optional $reference_id,
        public string|Optional $password,
        public DateTime|Optional $last_login_at,
        public string|Optional $last_login_ip,
        public string|Optional $remember_token,
        public string|Optional $storage_use,
        public int|Optional $storage_limit,
        public string|Optional $website,
        public string|Optional $tiktok,
        public string|Optional $youtube,
        public string|Optional $linkedIn,
        public string|Optional $instagram,
        public string|Optional $twitter,
        public string|Optional $facebook,
        public Carbon|Optional $created_at,
        public Carbon|Optional $updated_at,
        public Carbon|Optional $deleted_at
    ) {

    }
}
