with 
    products_subcategory as (
        select
            productsubcategoryid
            , productcategoryid
            , name
            -- , rowguid
            -- , modifieddate
        from {{ source('dbt_lineker98', 'productsubcategory') }}
    )

select *
from products_subcategory