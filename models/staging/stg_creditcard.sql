with 
    creditcard as (
        select 
            creditcardid as creditcard_id
            , cardtype
            -- , cardnumber
            -- , expmonth
            -- , expyear
            -- , modifieddate

        from {{ source('dbt_lineker98', 'creditcard') }}
    )

select *
from creditcard