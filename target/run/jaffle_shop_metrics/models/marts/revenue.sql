
  
    

        create or replace transient table demo_db.dbt_mahevarma.revenue  as
        (select *
from -- depends on: demo_db.dbt_mahevarma.dbt_metrics_default_calendar

(

with calendar as (
    select 
        * 
    from demo_db.dbt_mahevarma.dbt_metrics_default_calendar
     
)

, model_e3e19d6da530c9e5ae6ef0cd58faeb9b__aggregate as (
    
    select
        date_day,
        customer_status,
        boolor_agg(metric_date_day is not null) as has_data,
        sum(property_to_aggregate__revenue) as revenue
    from (
        select 
            cast(base_model.order_date as date) as metric_date_day,
            calendar.date_day as date_day,
            calendar.date_day as window_filter_date,
            base_model.customer_status,
            (amount) as property_to_aggregate__revenue
        from demo_db.dbt_mahevarma.orders base_model 
        
        left join calendar
            on cast(base_model.order_date as date) = calendar.date_day
        
        where 1=1
        and (
            status = 'completed'
            )
    
        
    ) as base_query

    where 1=1
    group by 1, 2

), model_e3e19d6da530c9e5ae6ef0cd58faeb9b__final as (
    
    select
        parent_metric_cte.date_day,
        parent_metric_cte.customer_status,
        coalesce(revenue, 0) as revenue
    from model_e3e19d6da530c9e5ae6ef0cd58faeb9b__aggregate as parent_metric_cte
)

select
    date_day ,
    customer_status,
    revenue  
    
from model_e3e19d6da530c9e5ae6ef0cd58faeb9b__final
    
order by 1 desc
    
) metric_subq
        );
      
  