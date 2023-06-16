with
    sales_reason as (
        select *
        from {{ ref('stg_sales_reason') }}
    )

    , sales_order_header_sales_reason as (
        select 
            sales_order_reason.salesorderid			
            , sales_order_reason.salesreasonid
            , sales_reason.name as sales_reason_name
            , sales_reason.reasontype as reason_type
        from {{ ref('stg_sales_order_header_sales_reason') }} as sales_order_reason
        left join sales_reason on sales_order_reason.salesreasonid = sales_reason.salesreasonid
    )

    , transformed as (
        select 
            row_number() over (order by salesorderid) as sales_order_sk
            , *
        from sales_order_header_sales_reason
    )

select *
from transformed