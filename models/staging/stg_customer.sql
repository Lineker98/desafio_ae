with
    customer as (
        select 
            customerid
            , personid
            , storeid
            , territoryid
            --, rowguid			
            --, modifieddate

        from {{ source('dbt_lineker98', 'customer') }}
    )

select *
from customer