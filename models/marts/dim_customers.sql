with
    person as (
        select *
        from {{ ref('stg_person') }}
    )
    , store as (
        select *
        from {{ ref('stg_store') }}
    )
    , customer as (
        select 
            customer.customer_id
            , customer.person_id
            , customer.store_id
            , store.store_name
            , concat(person.title, person.firstname, person.middlename, person.lastname) as name
            , person.firstname as firstname
            , person.middlename as middlename
            , person.lastname as lastname
            , customer.territory_id
        from {{ ref('stg_customer') }} as customer
        left join person on customer.person_id = person.businessentity_id
        left join store on customer.person_id = store.salesperson_id
    )

    , transformed as (
        select 
            row_number() over (order by customer_id) as customer_sk
            , *
        from customer
    )

select *
from transformed