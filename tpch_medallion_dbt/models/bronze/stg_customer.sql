select
  c_custkey    as cust_key,
  c_name       as cust_name,
  c_address    as cust_address,
  c_nationkey  as nation_key,
  c_phone      as cust_phone,
  c_acctbal    as acct_bal,
  c_mktsegment as mkt_segment,
  c_comment    as comment
from {{ source('tpch', 'customer') }}
