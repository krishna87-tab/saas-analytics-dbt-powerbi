with usage as (

    select *
    from {{ ref('stg_usage') }}

),

subscriptions as (

    select *
    from {{ ref('stg_subscription') }}

),

plans as (

    select *
    from {{ ref('stg_plans') }}

)

select
    u.usage_id,
    u.customer_id,
    u.subscription_id,
    u.usage_month,

    s.subscription_status,

    s.current_plan_id,
    p.plan_name,
    p.billing_period,
    p.monthly_price,
    p.included_users,
    p.included_events,

    u.active_users,
    u.events_used,
    u.active_days,
    u.api_calls,
    u.reports_created,

    safe_divide(u.active_users, p.included_users) as user_utilization_rate,

    safe_divide(u.events_used, p.included_events) as event_utilization_rate,

    safe_divide(u.api_calls, u.active_users) as api_calls_per_user,

    safe_divide(u.events_used, u.active_users) as events_per_user,

    safe_divide(u.reports_created, u.active_users) as reports_per_user,

    safe_divide(
        u.active_days,
        extract(day from last_day(u.usage_month))
    ) as active_days_rate

from usage u

left join subscriptions s
    on u.subscription_id = s.subscription_id

left join plans p
    on s.current_plan_id = p.plan_id