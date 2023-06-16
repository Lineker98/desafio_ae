with 
    products_subcategory as (
        select
            productsubcategoryid as productsubcategory_id
            , productcategoryid as productcategory_id
            , name
            -- , rowguid
            -- , modifieddate
        from {{ source('dbt_lineker98', 'productsubcategory') }}
    )

select *
from products_subcategory