with
    address as (
        select 
            addressid as address_id
            , addressline1
            , addressline2
            , city
            , stateprovinceid as stateprovince_id
            --, postalcode
            --, spatiallocation
            --, rowguid
            --, modifieddate
        from {{ source('dbt_lineker98', 'address') }}
    )

select *
from address