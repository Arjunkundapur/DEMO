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

  {% set tbl = run_query(q) %}
  {% if execute and tbl is not none and (tbl.rows | length) > 0 %}
    {% set r = tbl.rows[0] %}
    {% do log(
      "account=" ~ r[0] ~
      " user=" ~ r[1] ~
      " role=" ~ r[2] ~
      " warehouse=" ~ r[3] ~
      " default_db=" ~ r[4] ~
      " default_schema=" ~ r[5],
      info=True
    ) %}
  {% endif %}
{% endmacro %}
