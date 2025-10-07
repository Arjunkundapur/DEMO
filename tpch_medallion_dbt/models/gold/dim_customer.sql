with base as (select * from {{ ref('dim_customer_s') }})
select
  {{ dbt_utils.generate_surrogate_key(['cust_key']) }} as customer_sk,
  cust_key      as customer_nk,
  cust_name,
  cust_address,
  cust_phone,
  acct_bal,
  mkt_segment,
  nation_name,
  region_name
from base
