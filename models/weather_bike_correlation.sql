{{ config(materialized='table') }}
WITH CTE AS (
SELECT * FROM
{{ ref('trips_fact') }} t  LEFT JOIN {{ ref('daily_weather') }} w 
ON t.TRIP_DATE = w.daily_weather

)
SELECT * FROM CTE