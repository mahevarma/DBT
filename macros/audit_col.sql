{% macro audit_col() %}
current_timestamp as sf_insert_dttm,
current_timestamp as sf_update_dttm
{% endmacro %}