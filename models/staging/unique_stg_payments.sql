-- Returns a list of the payment_methods in the stg_payments model_
{% import '__bad_try__jinja.sql' as dat %}

with pm as ({% for payment_method in dat.payment_methods %}
    select '{{ payment_method }}' as payment_method {% if not loop.last %} union all {% endif %}
{% endfor %}),
ss as (
{%- for status in dat.statuses -%}
select '{{ status }}' as status {% if not loop.last %} union all {% endif %}
{%- endfor -%} )

select payment_method, status from pm, ss
