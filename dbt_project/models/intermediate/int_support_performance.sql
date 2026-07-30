with tickets as (

    select *
    from {{ ref('stg_tickets') }}

),

subscriptions as (

    select *
    from {{ ref('stg_subscription') }}

)

select
    t.ticket_id,
    t.customer_id,
    t.subscription_id,

    t.created_date,
    t.resolved_date,

    t.ticket_type,
    t.priority,
    t.ticket_status,

    s.subscription_status,
    t.first_response_hours,

    case
        when t.resolved_date is not null
            then date_diff(t.resolved_date, t.created_date, day)
    end as resolution_days,

    case
        when t.ticket_status <> 'RESOLVED'
            then date_diff(current_date(), t.created_date, day)
    end as ticket_age_days,

    case
        when t.ticket_status = 'OPEN' then true
        else false
    end as is_open_ticket,

    case
        when t.ticket_status = 'RESOLVED' then true
        else false
    end as is_resolved_ticket,

    case
        when t.ticket_status = 'ESCALATED' then true
        else false
    end as is_escalated_ticket,

    case
        when t.priority in ('HIGH', 'URGENT') then true
        else false
    end as is_high_priority,

    case
        when t.priority = 'URGENT' then true
        else false
    end as is_urgent_priority,

    case
        when t.first_response_hours <= 8 then true
        else false
    end as sla_met

from tickets t

left join subscriptions s
    on t.subscription_id = s.subscription_id