select

    subscription_id,
    customer_id,

    cast(start_date as date) as start_date,
    cast(end_date as date) as end_date,

    upper(current_status) as subscription_status,

    initial_plan_id,
    current_plan_id

from {{ source('raw', 'subscription') }}