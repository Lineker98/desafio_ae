with
    state_province as (
        select
            stateprovinceid as stateprovince_id
            , stateprovincecode
            , countryregioncode
            , cast(isonlystateprovinceflag	as boolean) as isonlystateprovinceflag
            , name
            -- , territoryid
            --, rowguid
            --, modifieddate

        from {{ source('dbt_lineker98', 'stateprovince') }}
    )

select *
from state_province