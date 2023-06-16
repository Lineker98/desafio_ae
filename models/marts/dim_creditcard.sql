with 
    creditcard as (
        select 
            creditcardid
            , cardtype

        from {{ ref('stg_creditcard') }}
    )
    , transformed as (
        select
            row_number() over (order by creditcardid) as creditcard_sk
            , *
        from creditcard
    )

select *
from transformed