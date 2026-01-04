{{ config(materialized='table') }}
with cte as (
  select distinct 
 BIKE_ID,
TRY_TO_TIMESTAMP(STARTED_AT) AS TRIP_DATE,
START_STATION_ID,
END_STATION_ID,
TIMESTAMPDIFF(SECOND,TRY_TO_TIMESTAMP(STARTED_AT), TRY_TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
  FROM {{ source('demo', 'bike') }}
  WHERE START_STATION_ID!='start station id'
 
)
select * from cte