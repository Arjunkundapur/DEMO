with base as (select * from {{ ref('dim_supplier_s') }})
select
  {{ dbt_utils.generate_surrogate_key(['supp_key']) }} as supplier_sk,
  supp_key     as supplier_nk,
  supp_name,
  supp_address,
  supp_phone,
  supp_acct_bal,
  nation_name,
  region_name
from base
