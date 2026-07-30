select

    ticket_id,
    customer_id,
    subscription_id,

    cast(created_date as date) as created_date,
    cast(resolved_date as date) as resolved_date,

    upper(ticket_type) as ticket_type,
    upper(priority) as priority,
    upper(status) as ticket_status,

    cast(first_response_hours as numeric) as first_response_hours

from {{ source('raw', 'tickets') }}