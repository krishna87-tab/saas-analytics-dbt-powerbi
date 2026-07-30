with customers as (

    select *
    from {{ ref('stg_customers') }}

),

subscriptions as (

    select *
    from {{ ref('stg_subscription') }}

),

initial_plan as (

    select *
    from {{ ref('stg_plans') }}

),

current_plan as (

    select *
    from {{ ref('stg_plans') }}

)

select

    c.customer_id,
    c.company_name,
    c.country,
    c.region,
    c.industry,
    c.company_size,
    c.acquisition_channel,
    c.signup_date,

    s.subscription_id,
    s.start_date,
    s.end_date,
    s.subscription_status,
    s.initial_plan_id,

    ip.plan_name as initial_plan_name,
    ip.billing_period as initial_billing_period,
    ip.monthly_price as initial_monthly_price,

    s.current_plan_id,
    cp.plan_name as current_plan_name,
    cp.billing_period as current_billing_period,
    cp.monthly_price as current_monthly_price,
    cp.included_users,
    cp.included_events,

    case
        when s.initial_plan_id <> s.current_plan_id then true
        else false
    end as plan_changed_flag,

    case
        when s.end_date is not null then date_diff(s.end_date, s.start_date, day)
        else date_diff(current_date(), s.start_date, day)
    end as subscription_length_days

from customers c

left join subscriptions s
    on c.customer_id = s.customer_id

left join initial_plan ip
    on s.initial_plan_id = ip.plan_id

left join current_plan cp
    on s.current_plan_id = cp.plan_id