with
    product as (
        select
            productid as product_id
            , productsubcategoryid as productsubcategory_id
            , name
            , productnumber
            , cast(makeflag as boolean) as makeflag
            , cast(finishedgoodsflag as boolean) as finishedgoodsflag
            , safetystocklevel
            , standardcost
            , listprice
            , daystomanufacture
            , productline				
            , cast(SUBSTR(sellstartdate, 1, 10) as date) as sellstartdate
            , cast(SUBSTR(sellenddate, 1, 10) as date) as sellenddate
            --, reorderpoint
            --, productmodelid
            --, color
            --, size
            --, sizeunitmeasurecode
            --, weightunitmeasurecode
            --, weight
            -- , class
            -- , style	
            --, discontinueddate
            --, rowguid
            --, modifieddate

        from {{ source('dbt_lineker98', 'product') }}
    )

select *
from product