with base as (select * from {{ ref('dim_part_s') }})
select
  {{ dbt_utils.surrogate_key(['part_key']) }} as part_sk,
  part_key     as part_nk,
  part_name,
  mfgr,
  brand,
  part_type,
  part_size,
  container,
  retail_price
from base
