
  create or replace   view demo_db.dbt_mahevarma.stg_payments
  
   as (
    with source as (
    select * from demo_db.dbt_mahevarma.raw_payments

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

    from source

)

select * from renamed
  );

