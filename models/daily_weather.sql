with cte as (
  select 
    DATE(TIME) AS DAILY_WEATHER,
    WEATHER,
    TEMP,
    PRESSURE,
    HUMIDITY,
    CLOUDS
  from {{ source('demo', 'weather') }}
),
daily_weather_agg as (
  select 
    DAILY_WEATHER,
    WEATHER,
    ROUND(AVG(TEMP), 2) AS Avg_Temp,
    ROUND(AVG(PRESSURE), 2) AS Avg_Pressure,
    ROUND(AVG(HUMIDITY), 2) AS Avg_Humidity,
    ROUND(AVG(CLOUDS), 2) AS Avg_Clouds,
    COUNT(WEATHER) AS weather_count
  from cte
  group by DAILY_WEATHER, WEATHER
  qualify ROW_NUMBER() OVER (PARTITION BY DAILY_WEATHER ORDER BY weather_count DESC) = 1
)
select * from daily_weather_agg