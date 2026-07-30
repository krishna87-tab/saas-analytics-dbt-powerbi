select

    invoice_id,
    subscription_id,
    customer_id,
    plan_id,

    cast(invoice_date as date) as invoice_date,
    cast(invoice_month as date) as invoice_month,

    cast(subtotal as numeric) as subtotal,
    cast(discount_amount as numeric) as discount_amount,
    cast(tax_amount as numeric) as tax_amount,
    cast(total_amount as numeric) as total_amount,

    upper(invoice_status) as invoice_status

from {{ source('raw', 'invoices') }}