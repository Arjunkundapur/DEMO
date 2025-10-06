select
  s_suppkey   as supp_key,
  s_name      as s_name,
  s_address   as s_address,
  s_nationkey as nation_key,
  s_phone     as s_phone,
  s_acctbal   as s_acctbal,
  s_comment   as s_comment
from {{ source('tpch', 'supplier') }}
