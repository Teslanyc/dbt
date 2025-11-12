{{ config(materialized='table') }}


with bike as (
select 
distinct 
start_station_id   AS station_id,
start_station_name AS station_name,
start_lat          AS station_lat,
start_lng          AS station_lng
from {{ source('demo', 'bike') }}
where ride_id != 'ride_id'
)
select
*
from bike