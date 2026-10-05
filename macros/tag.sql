{% macro tag(col_name) %}
    CASE
        WHEN {{col_name}} <100 THEN 'Low'
        WHEN {{col_name}} <200 THEN 'Medium'
        ELSE 'High'
    END
{% endmacro %}