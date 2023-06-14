with
    address as (
        select 
            addressid
            , addressline1
            , addressline2
            , city
            , stateprovinceid
            --, postalcode
            --, spatiallocation
            --, rowguid
            --, modifieddate
        from {{ source('dbt_lineker98', 'address') }}
    )

select *
from address