select
  part_key,
  p_name       as part_name,
  p_mfgr       as mfgr,
  p_brand      as brand,
  p_type       as part_type,
  p_size       as part_size,
  p_container  as container,
  p_retailprice as retail_price
from {{ ref('stg_part') }}
