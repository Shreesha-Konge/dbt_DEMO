{{ config(materialized='table') }}
with cte as (
  select 
 START_STATION_ID AS Station_ID,
  START_STATION_NAME AS Station_name,
  START_STATION_LAT AS Station_LAT,
  START_STATION_LONG AS Station_LONG
  FROM {{ source('demo', 'bike') }}
  WHERE START_STATION_ID!='start station id'
 
)
select * from cte