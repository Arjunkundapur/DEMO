with base as (select * from {{ ref('dim_date_s') }})
select
  {{ dbt_utils.generate_surrogate_key(['date_day']) }} as date_sk,
  date_day,
  year,
  month,
  day,
  yyyymmdd
from base
