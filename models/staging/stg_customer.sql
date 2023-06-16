with
    customer as (
        select 
            customerid as customer_id
            , personid as person_id
            , storeid as store_id
            , territoryid as territory_id
            --, rowguid			
            --, modifieddate

        from {{ source('dbt_lineker98', 'customer') }}
    )

select *
from customer