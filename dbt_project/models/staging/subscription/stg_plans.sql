select
    plan_id,
    plan_name,
    billing_period,
    monthly_price,
    included_users,
    included_events

from {{ source('raw', 'plans') }}