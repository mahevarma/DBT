
  create or replace   view demo_db.dbt_mahevarma.stg_orders
  
   as (
    

with source as (
    select * from demo_db.dbt_mahevarma.raw_orders

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

select * from renamed
  );

