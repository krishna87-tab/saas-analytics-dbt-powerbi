
with customer_profile as (

    select

        customer_id,
        company_name,
        country,
        region,
        industry,
        company_size,
        acquisition_channel,
        subscription_status,
        current_plan_name,
        subscription_length_days

    from {{ ref('int_customer_subscriptions') }}

),

revenue_summary as (

    select

        customer_id,

        count(invoice_id) as invoice_count,

        sum(total_amount) as total_revenue,

        sum(paid_amount) as total_paid,

        sum(case when is_paid then 1 else 0 end) as paid_invoice_count,

        sum(case when is_payment_late then 1 else 0 end) as late_payment_count,

        sum(case when is_payment_failed then 1 else 0 end) as failed_payment_count,

        avg(days_to_payment) as avg_days_to_payment

    from {{ ref('int_revenue') }}

    group by customer_id

),

usage_summary as (

    select

        customer_id,

        avg(active_users) as avg_active_users,

        avg(user_utilization_rate) as avg_user_utilization,

        avg(event_utilization_rate) as avg_event_utilization,

        avg(api_calls) as avg_api_calls,

        avg(reports_created) as avg_reports_created,

        avg(active_days_rate) as avg_active_days_rate

    from {{ ref('int_product_adoption') }}

    group by customer_id

),

support_summary as (

    select

        customer_id,

        count(ticket_id) as ticket_count,

        sum(case when is_resolved_ticket then 1 else 0 end) as resolved_ticket_count,

        sum(case when is_escalated_ticket then 1 else 0 end) as escalated_ticket_count,

        sum(case when is_high_priority then 1 else 0 end) as high_priority_ticket_count,

        avg(first_response_hours) as avg_first_response_hours,

        avg(resolution_days) as avg_resolution_days,

        avg(case when sla_met then 1 else 0 end) as sla_percentage

    from {{ ref('int_support_performance') }}

    group by customer_id

),

customer_metrics as (

    select

        cp.*,

        rs.invoice_count,
        rs.total_revenue,
        rs.total_paid,
        rs.paid_invoice_count,
        rs.late_payment_count,
        rs.failed_payment_count,
        rs.avg_days_to_payment,

        us.avg_active_users,
        us.avg_user_utilization,
        us.avg_event_utilization,
        us.avg_api_calls,
        us.avg_reports_created,
        us.avg_active_days_rate,

        ss.ticket_count,
        ss.resolved_ticket_count,
        ss.escalated_ticket_count,
        ss.high_priority_ticket_count,
        ss.avg_first_response_hours,
        ss.avg_resolution_days,
        ss.sla_percentage

    from customer_profile cp

    left join revenue_summary rs
        on cp.customer_id = rs.customer_id

    left join usage_summary us
        on cp.customer_id = us.customer_id

    left join support_summary ss
        on cp.customer_id = ss.customer_id

),
customer_health_scores as (

    select

        cm.*,

        case
            when coalesce(failed_payment_count,0) > 0 then 'Poor'
            when coalesce(late_payment_count,0) >= 2 then 'Average'
            else 'Good'
        end as payment_health,

        case
            when coalesce(avg_user_utilization,0) >= 0.80 then 'High'
            when coalesce(avg_user_utilization,0) >= 0.50 then 'Medium'
            else 'Low'
        end as usage_health,

        CASE
            WHEN COALESCE(sla_percentage,0) >= 0.80 THEN 'Excellent'
            WHEN COALESCE(sla_percentage,0) >= 0.60 THEN 'Good'
            ELSE 'Needs Attention'
        END AS support_health,

        (
            case when subscription_status = 'ACTIVE' then 20 else 0 end
            +
            case when coalesce(failed_payment_count,0) = 0 then 25 else 0 end
            +
            case
                when coalesce(avg_user_utilization,0) >= 0.80 then 30
                when coalesce(avg_user_utilization,0) >= 0.50 then 20
                else 10
            end
            +
            case
                when coalesce(sla_percentage,0) >= 0.90 then 25
                when coalesce(sla_percentage,0) >= 0.70 then 20
                 when coalesce(sla_percentage,0) >= 0.50 then 15
    else 10
            end
        ) as health_score

    from customer_metrics cm

)
select
    chs.*,

    case
        when health_score >= 90 then 'Healthy'
        when health_score >= 70 then 'Stable'
        when health_score >= 50 then 'At Risk'
        else 'Critical'
    end as customer_health_status

from customer_health_scores chs
