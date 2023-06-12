with
    person as (
        select
            businessentityid		
            , persontype	
            , cast(namestyle as boolean) as namestyle	
            , title	
            , firstname	
            , middlename	
            , lastname	
            --, suffix	
            --, emailpromotion		
            --, additionalcontactinfo	
            --, demographics	
            --, rowguid	
            --, modifieddate

        from {{ source('dbt_lineker98', 'person') }}
    )

select *
from person