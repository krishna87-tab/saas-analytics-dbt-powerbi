
with product_usage as (

    select *
    from {{ ref('int_product_adoption') }}

)

select

    usage_id,
    customer_id,
    subscription_id,
    current_plan_id as plan_id,
    usage_month,

    subscription_status,

    plan_name,
    billing_period,
    monthly_price,
    included_users,
    included_events,

    active_users,
    events_used,
    active_days,
    api_calls,
    reports_created,

    user_utilization_rate,
    event_utilization_rate,
    api_calls_per_user,
    events_per_user,
    reports_per_user,
    active_days_rate

from product_usage