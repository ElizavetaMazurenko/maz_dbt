with success_payments as ( 
    select 
        order_id, 
        payment_id, 
        amount,
        status
    from {{ref('stg_payments')}}
    where status = 'success'
)


select
    order_id, 
    customer_id, 
    amount,
    order_date 
from success_payments
left join {{ref('stg_orders')}} using (order_id)
