with
    customers as (
        select *
        from {{ ref('dim_customers') }}
    )
    , creditcard as (
        select *
        from {{ ref('dim_creditcard') }}
    )
    , product as (
        select *
        from {{ ref('dim_product') }}
    )
    , sales_reason as (
        select *
        from {{ ref('dim_sales_reason') }}
    )
    , dates as (
        select *
        from {{ ref('dim_dates') }}
    )
    , territory as (
        select * 
        from {{ ref('dim_territory') }}
    )
    , orders_with_sk as (
        select
            orders.salesorder_id
            , customers.customer_sk as customer_fk
            , bill_to.address_sk as bill_to_address_fk
            , ship_to.address_sk as ship_to_address_fk
            , creditcard.creditcard_sk as creditcard_fk
            , sales_reason.sales_reason_sk as sales_reason_fk
            , orders.orderdate		
            , orders.duedate
            , orders.shipdate
            , orders.subtotal	
            , orders.taxamt
            , orders.freight		
            , orders.totaldue   
            , orders.status
        from {{ ref('stg_sales_order_header') }} as orders
        left join customers on orders.customer_id = customers.customer_id
        left join territory bill_to on orders.billtoaddress_id = bill_to.address_id
        left join territory ship_to on orders.shiptoaddress_id = ship_to.address_id
        left join creditcard on orders.creditcard_id = creditcard.creditcard_id
        left join sales_reason on orders.salesorder_id = sales_reason.salesorder_id
    )
    , orders_detail_with_sk as (
        select
            order_detail.salesorder_id	
            , order_detail.salesorderdetail_id			
            , order_detail.orderqty			
            , product.product_sk as product_fk
            , order_detail.unitprice			
            , order_detail.unitpricediscount
            from {{ ref('stg_sales_order_detail') }} as order_detail
            left join product on order_detail.product_id = product.product_id
    )
    , final as (
        select
            orders_with_sk.salesorder_id
            , orders_detail_with_sk.salesorderdetail_id	
            , orders_with_sk.customer_fk
            , orders_with_sk.bill_to_address_fk
            , orders_with_sk.ship_to_address_fk
            , orders_with_sk.creditcard_fk
            , orders_with_sk.sales_reason_fk
            , orders_with_sk.orderdate		
            , orders_with_sk.duedate
            , orders_with_sk.shipdate
            , orders_with_sk.subtotal	
            , orders_with_sk.taxamt
            , orders_with_sk.freight		
            , orders_with_sk.totaldue		
            , orders_detail_with_sk.orderqty			
            , orders_detail_with_sk.product_fk
            , orders_detail_with_sk.unitprice			
            , orders_detail_with_sk.unitpricediscount
        from orders_with_sk
        left join orders_detail_with_sk on orders_with_sk.salesorder_id = orders_detail_with_sk.salesorder_id
    )

select *
from final