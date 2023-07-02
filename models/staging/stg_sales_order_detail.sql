with
    sales_order_detal as (
        select
            salesorderid as salesorder_id			
            , salesorderdetailid as salesorderdetail_id			
            , orderqty			
            , productid as product_id
            , unitprice			
            , unitpricediscount
            --, specialofferid as specialodder_id	
            --, carriertrackingnumber				
            --, rowguid				
            --, modifieddate
        from {{ source('dbt_lineker98', 'salesorderdetail') }}
    )

select *
from sales_order_detal