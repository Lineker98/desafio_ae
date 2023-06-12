with
    products as (
        select
            productid
            , productsubcategoryid
            , productmodelid
            , name
            , productnumber
            , cast(makeflag as boolean) as makeflag
            , cast(finishedgoodsflag as boolean) as finishedgoodsflag
            , color
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , size
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , weight
            , daystomanufacture
            , productline
            , class
            , style					
            , cast(SUBSTR(sellstartdate, 1, 10) as date) as sellstartdate
            , cast(SUBSTR(sellenddate, 1, 10) as date) as sellenddate
            , discontinueddate
            , rowguid
            , modifieddate

        from {{ source('dbt_lineker98', 'product') }}
    )

select *
from products