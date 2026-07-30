with plans as (

    select *
    from {{ ref('stg_plans') }}

)

select

    plan_id,
    plan_name,
    billing_period,
    monthly_price,
    included_users,
    included_events

from plans