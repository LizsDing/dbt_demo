-- notice that staging models are suppsoed to be simple
-- so we don't filter any rows here

with sources as (

    select * from {{ source('stripe', 'payment') }}
),

payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status, 

        -- unit is cents, convert it to dollars
        amount/100 as amount,
        created as created_at

    from sources

)

select * from payments