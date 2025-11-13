with bike as
(
select 
ride_id,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_csual
from {{ source('demo', 'bike') }}
where ride_id != 'bikeid'
)
select * from bike