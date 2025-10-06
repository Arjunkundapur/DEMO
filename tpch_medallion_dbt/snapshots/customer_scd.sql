{% snapshot customer_scd %}
{{
  config(
    target_schema='SNAPSHOTS',
    unique_key='cust_key',
    strategy='check',
    check_cols='all'
  )
}}
select * from {{ ref('dim_customer_s') }}
{% endsnapshot %}
