{{ config(materialized='table') }}
with cte as (
select
 TRY_TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
 DATE(TRY_TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
HOUR(TRY_TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
{{ get_season('STARTED_AT') }} AS Season_of_year,
{{ get_daytype('STARTED_AT') }} AS Day_Type
FROM {{ source('demo', 'bike') }}
WHERE STARTED_AT != 'starttime' and STARTED_AT is not null
)
select * from cte







