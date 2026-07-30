with events as (

    select *
    from {{ ref('stg_events') }}

),

old_plan as (

    select *
    from {{ ref('stg_plans') }}

),

new_plan as (

    select *
    from {{ ref('stg_plans') }}

)

select
    e.event_id,
    e.customer_id,
    e.subscription_id,
    e.event_date,
    e.event_type,

    e.old_plan_id,
    op.plan_name as old_plan_name,
    op.billing_period as old_billing_period,
    op.monthly_price as old_monthly_price,

    e.new_plan_id,
    np.plan_name as new_plan_name,
    np.billing_period as new_billing_period,
    np.monthly_price as new_monthly_price,

    e.mrr_change,

    case
        when e.event_type = 'NEW' then true
        else false
    end as is_new_subscription,

    case
        when e.event_type = 'UPGRADE' then true
        else false
    end as is_upgrade,

    case
        when e.event_type = 'DOWNGRADE' then true
        else false
    end as is_downgrade,

    case
        when e.event_type = 'CHURN' then true
        else false
    end as is_churn,

    -- Event Category
    case
        when e.event_type = 'NEW' then 'New Subscription'
        when e.event_type = 'UPGRADE' then 'Upgrade'
        when e.event_type = 'DOWNGRADE' then 'Downgrade'
        when e.event_type = 'CHURN' then 'Churn'
        else 'Unknown'
    end as lifecycle_event

from events e

left join old_plan op
    on e.old_plan_id = op.plan_id

left join new_plan np
    on e.new_plan_id = np.plan_id