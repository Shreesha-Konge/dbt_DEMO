with cte as (
  select 
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    CASE 
      WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Saturday','Sunday') THEN 'Weekend'
      ELSE 'Businessdays' 
    END AS DAY_NAME,
    CASE 
      WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (12, 1, 2) THEN 'Winter'
      WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (3, 4, 5) THEN 'Spring'
      WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (6, 7, 8) THEN 'Summer'
      ELSE 'Autumn' 
    END AS Season
  FROM {{ source('demo', 'bike') }}
  WHERE STARTED_AT != 'starttime'
)
select * from cte