with source as ( select * from {{ source('raw', 'product_categories') }} )

select
category_id,
name as category_name,
description as category_description,
department_id
from source
