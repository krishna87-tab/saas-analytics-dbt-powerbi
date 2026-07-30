select

    usage_id,
    customer_id,
    subscription_id,

    cast(usage_month as date) as usage_month,

    cast(active_users as int64) as active_users,
    cast(events_used as int64) as events_used,
    cast(active_days as int64) as active_days,
    cast(api_calls as int64) as api_calls,
    cast(reports_created as int64) as reports_created

from {{ source('raw', 'usage') }}