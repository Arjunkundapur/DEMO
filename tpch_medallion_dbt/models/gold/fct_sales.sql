with f as (select * from {{ ref('fct_lineitem_s') }}),
d_order as (
  select date_day, date_sk from {{ ref('dim_date') }}
),
d_ship as (
  select date_day, date_sk from {{ ref('dim_date') }}
),
d_c as (select customer_nk, customer_sk from {{ ref('dim_customer') }}),
d_s as (select supplier_nk, supplier_sk from {{ ref('dim_supplier') }}),
d_p as (select part_nk, part_sk from {{ ref('dim_part') }})
select
  f.order_key,
  f.cust_key,
  f.part_key,
  f.supp_key,
  f.line_number,
  dc.customer_sk,
  ds.supplier_sk,
  dp.part_sk,
  do.date_sk  as order_date_sk,
  ds2.date_sk as ship_date_sk,
  f.quantity,
  f.extended_price,
  f.discount,
  f.tax,
  f.net_item_sales,
  f.gross_item_sales
from f
left join d_c  dc on dc.customer_nk = f.cust_key
left join d_s  ds on ds.supplier_nk = f.supp_key
left join d_p  dp on dp.part_nk     = f.part_key
left join d_order do on do.date_day  = f.order_date
left join d_ship  ds2 on ds2.date_day = f.ship_date
