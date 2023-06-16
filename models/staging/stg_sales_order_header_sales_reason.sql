with
    sales_order_header_reason as (
        select
            salesorderid as salesorder_id	
            , salesreasonid	as salesreason_id
            --, modifieddate
        
        from {{ source('dbt_lineker98', 'salesorderheadersalesreason') }}
    )

select *
from sales_order_header_reason