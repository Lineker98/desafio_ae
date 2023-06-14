with
    sales_order_header as (
        select
            salesorderid	
            , customerid
            , territoryid
            , billtoaddressid
            , shiptoaddressid
            , creditcardid
            , revisionnumber			
            , orderdate		
            , duedate		
            , cast(SUBSTR(shipdate, 1, 10) as date) as shipdate
            , cast(subtotal	as FLOAT64) as subtotal	
            , cast(taxamt as FLOAT64) as taxamt
            , cast(freight as FLOAT64) as freight		
            , totaldue
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