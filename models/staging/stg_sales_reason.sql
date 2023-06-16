with
    sales_reason as (
        select
            salesreasonid as salesreason_id		
            , name			
            , reasontype			
            --, modifieddate

        from {{ source('dbt_lineker98', 'salesreason') }}
    )
select *
from sales_reason