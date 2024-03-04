<?php

namespace Domain\User\Data;

use Spatie\LaravelData\Data;
use Spatie\LaravelData\Optional;

class UserSubscriptionDTO extends Data
{
    public function __construct(
        public string|Optional $user_id,
        public string $package_id,
        public bool|Optional $active = true,
        public string|Optional $id = '',
        public int|Optional|null $tenant_id = 0,
        public string|null|Optional $status = '',
        public string|null|Optional $sub_account_id = '',
        public string|null|Optional $customer_iugu_id = '',
        public string|null|Optional $offer_id = '',
        public string|null|Optional $iugu_id = '',
        public string|null|Optional $contract_id = '',
        public string|null|Optional $credit_brand = '',
        public string|null|Optional $last_digits = '',
        public string|null|Optional $contract_invoice = '',
        public string|null|Optional $payment_last_date = '',
        public string|null|Optional $expiration_date = '',
        public string|null|Optional $cancel_date = '',
        public string|null|Optional $iugu_payment_method_id = '',
        public string|null|Optional $iugu_invoice_id = '',
        public string|null|Optional $iugu_invoice_status = '',
        public string|null|Optional $iugu_assinatura_status = '',
        public int|null|Optional $iugu_qtd_installments = 0,
        public string|null|Optional $iugu_assinatura_id = '',
        public string|null|Optional $type_payment = '',
        public int|null|Optional $attempts = 0,
        public string|Optional $created_at = '',
        public string|Optional $updated_at = '',
        public bool|null|Optional $accepted_terms = false,
        public string|Optional $accession_date = ''
    ) {
    }
}
