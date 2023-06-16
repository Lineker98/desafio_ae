with
    product_subcategory as (
        select * 
        from {{ ref("stg_product_subcategory") }})

    , product_category as (
        select * 
        from {{ ref("stg_product_category") }})

    , product as (
        select
            product.product_id
            , product.name as product_name
            , product.productsubcategory_id
            , product_subcategory.name as subcategory_name
            , product_category.productcategory_id
            , product_category.name as category_name
            , product.productnumber
            , product.makeflag
            , product.finishedgoodsflag
            , product.safetystocklevel
            , product.standardcost
            , product.listprice
            , product.daystomanufacture
            , product.productline
            , product.sellstartdate
            , product.sellenddate
        from {{ ref("stg_product") }} as product
        left join product_subcategory on product.productsubcategory_id = product_subcategory.productsubcategory_id
        left join product_category  on product_subcategory.productcategory_id = product_category.productcategory_id
    )

    , transformed as (
        select 
            row_number() over (order by product_id) as product_sk
            , *
        from product
    )

select *
from transformed