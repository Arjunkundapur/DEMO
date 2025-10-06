with li as (select * from {{ ref('stg_lineitem') }}),
o  as (select order_key, cust_key, order_date from {{ ref('stg_orders') }})
select
  li.order_key,
  o.cust_key,
  li.part_key,
  li.supp_key,
  li.line_number,
  o.order_date,
  li.ship_date,
  li.quantity,
  li.extended_price,
  li.discount,
  li.tax,
  (li.extended_price * (1 - li.discount))                         as net_item_sales,
  (li.extended_price * (1 - li.discount) * (1 + li.tax))          as gross_item_sales
from li
left join o using (order_key)
