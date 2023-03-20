{% set PAYMENT_METHOD = ['bank_transfer','credit_card','gift_card','coupon'] %}

with payments as (
    select * from {{ref('stg_payments')}}
),
pivoted as (
select ORDER_ID,
{% for payment in PAYMENT_METHOD -%}
sum(case when PAYMENT_METHOD = '{{payment}}' then amount else 0 end ) as {{payment}}_amount
{%- if not loop.last -%}
,
{%- endif %}
{% endfor %}
from payments 
group by 1
)
select * from pivoted

