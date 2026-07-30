
with customers as (

    select *
    from {{ ref('int_customer_subscriptions') }}

)

select distinct

    customer_id,
    company_name,
    country,
    region,
    industry,
    company_size,
    acquisition_channel,
    signup_date

from customers