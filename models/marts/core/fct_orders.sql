with payments as (
    
    select 
        order_id,
        amount
    from
        {{ ref('stg_payments') }}
),

customers as (

    select 
        customer_id    
    from 
        {{ ref('stg_customers') }}
),

orders as (

    select
        customer_id,
        order_id
    from
        {{ ref('stg_orders') }}
),

final as (

    select 
        orders.order_id,
        orders.customer_id,
        payments.amount
    from 
        orders
    left join
        customers
        on
            orders.customer_id = customers.customer_id
    left join
        payments
        on
            orders.order_id = payments.order_id
)

select * from final