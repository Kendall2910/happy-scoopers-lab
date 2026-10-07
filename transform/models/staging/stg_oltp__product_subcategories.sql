with source as ( select * from {{ source('raw', 'product_subcategories') }} )

select
product_subcategory_id,
product_category_id,
name as subcategory_name,
description as subcategory_description
from source
