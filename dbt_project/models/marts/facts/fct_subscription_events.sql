
with subscription_events as (

    select *
    from {{ ref('int_subscription_lifecycle') }}

)

select

    event_id,
    customer_id,
    subscription_id,
    event_date,

    event_type,
    lifecycle_event,

    old_plan_id,
    old_plan_name,
    old_billing_period,
    old_monthly_price,

    new_plan_id,
    new_plan_name,
    new_billing_period,
    new_monthly_price,

    mrr_change,

    is_new_subscription,
    is_upgrade,
    is_downgrade,
    is_churn

from subscription_events