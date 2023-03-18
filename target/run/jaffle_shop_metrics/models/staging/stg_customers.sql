
  create or replace   view demo_db.dbt_mahevarma.stg_customers
  
   as (
    with source as (
    select * from demo_db.dbt_mahevarma.raw_customers

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed
  );

