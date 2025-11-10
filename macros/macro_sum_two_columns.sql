{% macro sum_two_columns(col1, col2) %}
    (COALESCE({{ col1 }}, 0) + COALESCE({{ col2 }}, 0))
{% endmacro %}