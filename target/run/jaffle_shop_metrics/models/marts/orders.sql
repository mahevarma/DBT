
  
    

        create or replace transient table demo_db.dbt_mahevarma.orders  as
        (with orders as (

    select * from demo_db.dbt_mahevarma.int_order_payments_pivoted

)
,
customers as (

    select * from demo_db.dbt_mahevarma.int_customer_order_history_joined

)
,
final as (

    select 
        *
    from orders 
    left join customers using (customer_id)

)

select * from final
        );
      
  