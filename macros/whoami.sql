-- macros/whoami.sql
{% macro whoami() %}
  {% set q -%}
    select
      current_account()   as account,
      current_user()      as user,
      current_role()      as role,
      current_warehouse() as warehouse,
      current_database()  as default_db,
      current_schema()    as default_schema
  {%- endset %}
  {% do run_query(q) %}
{% endmacro %}
