select

    payment_id,
    invoice_id,
    customer_id,

    cast(payment_date as date) as payment_date,

    upper(payment_method) as payment_method,
    upper(payment_status) as payment_status,

    cast(paid_amount as numeric) as paid_amount

from {{ source('raw', 'payments') }}