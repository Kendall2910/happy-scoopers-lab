with source as ( select * from {{ source('raw', 'product_categories') }} )

select
category_id,
category_name,
category_description as category_description,
department_id
from source 
