with customers as (
    select * from {{ ref('stg_oltp__customers') }}
),
addresses as (
    select * from {{ ref('stg_oltp__addresses') }}
),
cities as (
    select * from {{ ref('stg_oltp__cities') }}
)
select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.full_name,
    c.title,
    c.phone_number,
    c.email,
    -- Dirección de entrega
    de.address_line1 as delivery_address_line1,
    cde.city_name as delivery_city_name,
    cde.state_province_name as delivery_state_province_name,
    cde.country_name as delivery_country_name,
    -- Dirección de facturación
    fa.address_line1 as billing_address_line1,
    cfa.city_name as billing_city_name,
    cfa.state_province_name as billing_state_province_name,
    cfa.country_name as billing_country_name
from customers c
left join addresses de on c.delivery_address_id = de.address_id
left join cities cde on de.city_id = cde.city_id
left join addresses fa on c.billing_address_id = fa.address_id
left join cities cfa on fa.city_id = cfa.city_id
