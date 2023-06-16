with
    state_province as (
        select *
        from {{ ref('stg_state_province') }}
    )
    , country_region as (
        select *
        from {{ ref('stg_country_region') }}
    )
    , address as (
        select
            address.address_id
            , address.addressline1
            , address.addressline2
            , address.city
            , address.stateprovince_id
            , state_province.name as state_name
            , state_province.stateprovincecode as state_code
            , state_province.countryregioncode as country_code
            , country_region.name as country_name
        from {{ ref('stg_address') }} as address
        left join state_province on address.stateprovince_id = state_province.stateprovince_id
        left join country_region on state_province.countryregioncode = country_region.countryregioncode
    )

    , transformed as (
        select 
            row_number() over (order by address_id) as address_sk
            , *
        from address
    )
select *
from transformed