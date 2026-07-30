select

    event_id,
    subscription_id,
    customer_id,

    cast(event_date as date) as event_date,

    upper(event_type) as event_type,

    old_plan_id,
    new_plan_id,

    cast(mrr_change as numeric) as mrr_change

from {{ source('raw', 'events') }}