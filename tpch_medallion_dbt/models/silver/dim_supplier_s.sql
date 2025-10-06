with s as (select * from {{ ref('stg_supplier') }}),
nat as (select nation_key, n_name as nation_name, region_key from {{ ref('stg_nation') }}),
reg as (select region_key, r_name as region_name from {{ ref('stg_region') }})
select
  s.supp_key,
  s.s_name     as supp_name,
  s.s_address  as supp_address,
  s.s_phone    as supp_phone,
  s.s_acctbal  as supp_acct_bal,
  nat.nation_name,
  reg.region_name
from s
left join nat using (nation_key)
left join reg using (region_key)
