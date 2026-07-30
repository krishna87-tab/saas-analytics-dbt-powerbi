with invoices as (

    select *
    from {{ ref('stg_invoices') }}

),

payments as (

    select *
    from {{ ref('stg_payments') }}

)

select

    i.invoice_id,
    i.customer_id,
    i.subscription_id,
    i.plan_id,
    i.invoice_date,
    i.invoice_month,
    i.subtotal,
    i.discount_amount,
    i.tax_amount,
    i.total_amount,
    i.invoice_status,

    p.payment_id,
    p.payment_date,
    p.payment_method,
    p.payment_status,
    p.paid_amount,


    case
        when p.payment_status = 'PAID' then true
        else false
    end as is_paid,

    case
        when p.payment_status = 'LATE' then true
        else false
    end as is_payment_late,

    case
        when p.payment_status = 'FAILED' then true
        else false
    end as is_payment_failed,

    -- Payment Category
    case
        when p.payment_status = 'PAID' then 'Paid'
        when p.payment_status = 'LATE' then 'Late'
        when p.payment_status = 'FAILED' then 'Failed'
        else 'Unknown'
    end as payment_category,

    -- Payment Metrics
    case
        when p.payment_date is not null
            then date_diff(p.payment_date, i.invoice_date, day)
    end as days_to_payment

from invoices i

left join payments p
    on i.invoice_id = p.invoice_id