with
    sales_order_header_reason as (
        select
            salesorderid			
            , salesreasonid			
            --, modifieddate
        
        from {{ source('dbt_lineker98', 'salesorderheadersalesreason') }}
    )

select *
from sales_order_header_reason