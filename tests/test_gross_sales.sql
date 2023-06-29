with 
    validation as (
        select sum(fact.orderqty * fact.unitprice) as gross_sales
        from {{ ref('fact_sales') }} as fact
        where fact.orderdate between "2011-01-01" and "2011-12-31"
    )

select *
from validation
where round(gross_sales, 2) != 12646112.16