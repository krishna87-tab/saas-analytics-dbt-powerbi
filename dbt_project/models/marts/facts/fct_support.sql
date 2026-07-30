
with support as (

    select *
    from {{ ref('int_support_performance') }}

)

select

    ticket_id,
    customer_id,
    subscription_id,
    created_date,
    resolved_date,

    ticket_type,
    priority,
    ticket_status,
    subscription_status,

    first_response_hours,
    resolution_days,
    ticket_age_days,

    is_open_ticket,
    is_resolved_ticket,
    is_escalated_ticket,
    is_high_priority,
    is_urgent_priority,
    sla_met

from support