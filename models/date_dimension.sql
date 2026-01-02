
with cte as (
  select 
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    {{ get_daytype('STARTED_AT') }} AS Day_Type,
    {{ get_season('STARTED_AT') }} AS Season_of_year
  FROM {{ source('demo', 'bike') }}
  WHERE STARTED_AT != 'starttime'
)
select * from cte