with revenue as (

    select *
    from {{ ref('int_revenue') }}

)

select

    invoice_id,
    customer_id,
    subscription_id,
    plan_id,
    invoice_date,

    subtotal,
    discount_amount,
    tax_amount,
    total_amount,

    paid_amount,

    invoice_status,
    payment_status,
    payment_method,

    is_paid,
    is_payment_late,
    is_payment_failed,
    payment_category,

    days_to_payment

from revenue