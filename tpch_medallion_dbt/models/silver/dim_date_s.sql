with bounds as (
  select
    least(min(o.order_date), min(l.ship_date))   as min_date,
    greatest(max(o.order_date), max(l.ship_date)) as max_date
  from {{ ref('stg_orders') }} o
  cross join {{ ref('stg_lineitem') }} l
),
date_spine as (
  select
    dateadd(day, seq4(), (select min_date from bounds)) as dt
  from table(generator(rowcount => 20000))
)
select
  dt as date_day,
  year(dt)  as year,
  month(dt) as month,
  day(dt)   as day,
  to_char(dt,'YYYYMMDD') as yyyymmdd
from date_spine
where dt <= (select max_date from bounds)
