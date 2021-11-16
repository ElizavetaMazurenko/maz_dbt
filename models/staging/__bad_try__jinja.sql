-- {%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

-- with payments as (
--    select * from {{ ref('stg_payments') }}
-- ),

-- final as (
--    select
--        order_id,
--        {% set num = 0 %}
--        {% for payment_method in payment_methods -%}
--             sum(case when payment_method = '{{ payment_method }}' then amount else 0 end)
--             as {{ payment_method }}_amount,
--         {%- if payment_method+'_amount' == 0 -%}
--             {%- set num = num+1 -%}
--         {%- endif -%}
--        {%- if not loop.last -%}
--         -- ,
--        {% endif -%}

--        {%- endfor %}
--         {%- if num == 3 -%}
--             1 as one_payment_method,
--         {% else %}
--             0 as one_payment_method,
--         {%- endif %} 
--         {{num}} as num
        
--    from {{ ref('stg_payments') }}
--    group by 1
-- )

-- select * from final

select * from {{ ref('stg_payments') }}