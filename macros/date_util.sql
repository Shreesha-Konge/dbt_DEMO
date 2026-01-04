{% macro get_season(x) %}
  CASE 
    WHEN MONTH(TRY_TO_TIMESTAMP({{ x }})) IN (12, 1, 2) THEN 'Winter'
    WHEN MONTH(TRY_TO_TIMESTAMP({{ x }})) IN (3, 4, 5) THEN 'Spring'
    WHEN MONTH(TRY_TO_TIMESTAMP({{ x }})) IN (6, 7, 8) THEN 'Summer'
    ELSE 'Autumn' 
  END
{% endmacro %}

{% macro get_daytype(x) %}
  CASE 
    WHEN DAYNAME(TRY_TO_TIMESTAMP({{ x }})) IN ('Saturday', 'Sunday') THEN 'Weekend'
    ELSE 'Businessdays' 
  END
{% endmacro %}