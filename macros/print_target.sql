-- macros/print_target.sql
{% macro print_target() %}
  {% do log("target.database=" ~ target.database ~
            " schema=" ~ target.schema ~
            " name=" ~ target.name ~
            " profile_name=" ~ target.profile_name, info=True) %}
{% endmacro %}
