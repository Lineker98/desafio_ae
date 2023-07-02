with
    store as (
        select
            businessentityid as businessentity_id
            , salespersonid as salesperson_id
            , name as store_name
        from {{ source('dbt_lineker98', 'store') }}
    )

select *
from store