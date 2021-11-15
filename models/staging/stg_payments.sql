select 
    orderid as order_id, 
    id as payment_id, 
    amount/100 as amount,
    paymentmethod as payment_method,
    status,
    created as date
from {{ source('stripe', 'payment') }}

-- amount in cents