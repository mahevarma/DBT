
  
    

        create or replace transient table demo_db.dbt_mahevarma.example_develop_metric  as
        (

select * 
from -- depends on: demo_db.dbt_mahevarma.dbt_metrics_default_calendar

    
    
        
        
    
    

    

    

    

    
    (

with calendar as (
    select 
        * 
    from demo_db.dbt_mahevarma.dbt_metrics_default_calendar
     
)

, model_6a913ad407016e4c1d836bf64cdcb732__aggregate as (
    
    select
        date_month,
        boolor_agg(metric_date_day is not null) as has_data,
        avg(property_to_aggregate__develop_metric) as develop_metric
    from (
        select 
            cast(base_model.order_date as date) as metric_date_day,
            calendar.date_month as date_month,
            calendar.date_day as window_filter_date,
            (amount) as property_to_aggregate__develop_metric
        from demo_db.dbt_mahevarma.orders base_model 
        
        left join calendar
            on cast(base_model.order_date as date) = calendar.date_day
        
        where 1=1
        
    ) as base_query

    where 1=1
    group by 1

), model_6a913ad407016e4c1d836bf64cdcb732__final as (
    
    select
        parent_metric_cte.date_month,
        coalesce(develop_metric, 0) as develop_metric
    from model_6a913ad407016e4c1d836bf64cdcb732__aggregate as parent_metric_cte
)

select
    date_month ,
    develop_metric  
    
from model_6a913ad407016e4c1d836bf64cdcb732__final
    
order by 1 desc
    
) metric_subq
        );
      
  