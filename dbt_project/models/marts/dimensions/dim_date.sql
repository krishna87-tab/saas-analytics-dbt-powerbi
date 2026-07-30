with date_spine as (

    {{
        dbt_utils.date_spine(
            datepart="day",
            start_date="cast('2023-01-01' as date)",
            end_date="cast('2030-12-31' as date)"
        )
    }}

)

select

    -- Primary Key
    cast(date_day as date) as date_day,

    -- Calendar Attributes
    extract(year from date_day) as year,
    extract(quarter from date_day) as quarter,
    extract(month from date_day) as month,
    format_date('%B', date_day) as month_name,

    concat(
        cast(extract(year from date_day) as string),
        '-',
        lpad(cast(extract(month from date_day) as string), 2, '0')
    ) as year_month,

    format_date('%b %Y', date_day) as month_year,

    extract(isoweek from date_day) as week,

    extract(day from date_day) as day_of_month,

    extract(dayofyear from date_day) as day_of_year,

    extract(dayofweek from date_day) as day_of_week,

    format_date('%A', date_day) as day_name,

    -- Flags
    case
        when extract(dayofweek from date_day) in (1, 7) then true
        else false
    end as is_weekend,

    case
        when extract(day from date_day) = 1 then true
        else false
    end as is_month_start,

    case
        when date_day = last_day(date_day) then true
        else false
    end as is_month_end,

    case
        when extract(month from date_day) in (1, 4, 7, 10)
         and extract(day from date_day) = 1 then true
        else false
    end as is_quarter_start,

    case
        when date_day = last_day(date_day, quarter) then true
        else false
    end as is_quarter_end,

    case
        when extract(dayofyear from date_day) = 1 then true
        else false
    end as is_year_start,

    case
        when extract(month from date_day) = 12
         and extract(day from date_day) = 31 then true
        else false
    end as is_year_end

from date_spine