with
    sales_order_header as (
        select
            salesorderid as salesorder_id
            , customerid as customer_id
            , billtoaddressid as billtoaddress_id
            , shiptoaddressid as shiptoaddress_id
            , creditcardid as creditcard_id
            , revisionnumber			
            , cast(SUBSTR(orderdate, 1, 10) as date) as orderdate		
            , cast(SUBSTR(duedate, 1, 10) as date) as duedate
            , cast(SUBSTR(shipdate, 1, 10) as date) as shipdate
            , cast(subtotal	as FLOAT64) as subtotal	
            , cast(taxamt as FLOAT64) as taxamt
            , cast(freight as FLOAT64) as freight		
            , totaldue
            -- , territoryid as territory_id
            --, status			
            --, onlineorderflag	
            --, purchaseordernumber		
            --, accountnumber					
            --, salespersonid			
            --, shipmethodid						
            --, creditcardapprovalcode		
            --, currencyrateid					
            --, comment			
            --, rowguid		
            --, modifieddate
        from {{ source('dbt_lineker98', 'salesorderheader') }}
    )

select *
from sales_order_header