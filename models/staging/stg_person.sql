with
    person as (
        select
            businessentityid as businessentity_id		 
            , persontype		
            , title	
            , firstname	
            , middlename	
            , lastname
            --, namestyle
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