with cust as (
  select * from {{ ref('stg_customer') }}
),
nat as (
  select nation_key, n_name as nation_name, region_key from {{ ref('stg_nation') }}
),
reg as (
  select region_key, r_name as region_name from {{ ref('stg_region') }}
)
select
  cust.cust_key,
  cust.cust_name,
  cust.cust_address,
  cust.cust_phone,
  cust.acct_bal,
  cust.mkt_segment,
  nat.nation_name,
  reg.region_name
from cust
left join nat using (nation_key)
left join reg using (region_key)
