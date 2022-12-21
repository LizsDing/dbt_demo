with payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        -- unit is cents, convert it to dollars
        amount/100 as amount

    from raw.stripe.payment

    where 
        status = 'success'

)

select * from payments