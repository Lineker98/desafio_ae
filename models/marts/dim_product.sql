with
    product_subcategory as (
        select * 
        from {{ ref("stg_product_subcategory") }})

    , product_category as (
        select * 
        from {{ ref("stg_product_category") }})

    , product as (
        select
            product.productid
            , product.name as product_name
            , product.productsubcategoryid
            , product_subcategory.name as subcategory_name
            , product_category.productcategoryid
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
        from {{ ref("stg_products") }} as product
        left join product_subcategory on product.productsubcategoryid = product_subcategory.productsubcategoryid
        left join product_category  on product_subcategory.productcategoryid = product_category.productcategoryid
    )

    , transformed as (
        select 
            row_number() over (order by productid) as product_sk
            , *
        from product
    )

select *
from transformed