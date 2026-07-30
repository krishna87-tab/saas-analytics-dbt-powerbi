select
    customer_id,
    company_name,
    country,
    country_code,
    region,
    industry,
    company_size,
    acquisition_channel,
    cast(signup_date as date) as signup_date

from {{ source('raw', 'customers') }}