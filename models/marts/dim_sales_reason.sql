with
    sales_reason as (
        select *
        from {{ ref('stg_sales_reason') }}
    )

    , sales_order_header_sales_reason as (
        select 
            sales_order_reason.salesorder_id			
            , sales_reason.name as sales_reason_name
            , sales_reason.reasontype as reason_type
        from {{ ref('stg_sales_order_header_sales_reason') }} as sales_order_reason
        left join sales_reason on sales_order_reason.salesreason_id = sales_reason.salesreason_id
    )

    , transformed as (
        select 
            row_number() over (order by salesorder_id) as sales_reason_sk
            , *
        from sales_order_header_sales_reason
    )

select *
from transformed