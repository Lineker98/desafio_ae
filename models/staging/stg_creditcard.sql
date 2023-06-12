with 
    creditcard as (
        select 
            creditcardid
            , cardtype
            -- , cardnumber
            -- , expmonth
            -- , expyear
            -- , modifieddate

        from {{ source('dbt_lineker98', 'creditcard') }}
    )

select *
from creditcard