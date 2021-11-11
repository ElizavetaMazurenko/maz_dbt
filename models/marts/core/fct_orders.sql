select
    order_id, 
    customer_id, 
    amount 
from {{ref('stg_payments')}}
left join {{ref('stg_orders')}} using (order_id)