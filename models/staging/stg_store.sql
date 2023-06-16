with
    store as (
        select
            name as store_name
            , salespersonid as salesperson_id
        from {{ source('dbt_lineker98', 'store') }}
    )

select *
from store