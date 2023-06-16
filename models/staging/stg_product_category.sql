with
    product_category as (
        select
            productcategoryid	as productcategory_id	
            , name
            --, rowguid
            --, modifieddate

        from {{ source('dbt_lineker98', 'productcategory') }}
    )

select *
from product_category