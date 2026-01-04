{{ config(materialized='table') }}

with cte as (
  select
    TRY_TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TRY_TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TRY_TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    {{ get_daytype(STARTED_AT) }} AS Day_Type,
    {{ get_season(STARTED_AT) }} AS Season_of_year
  FROM {{ source('demo', 'bike') }}
  WHERE STARTED_AT IS NOT NULL AND START_STATION_ID!='start station id'
)

select * from cte