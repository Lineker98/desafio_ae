with 
    creditcard as (
        select 
            creditcard_id
            , cardtype

        from {{ ref('stg_creditcard') }}
    )
    , transformed as (
        select
            row_number() over (order by creditcard_id) as creditcard_sk
            , *
        from creditcard
    )

select *
from transformed