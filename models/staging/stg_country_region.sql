with
    country_region as (
        select
            countryregioncode
            , name
            --, modifieddate

        from {{ source('dbt_lineker98', 'countryregion') }}
    )

select *
from country_region