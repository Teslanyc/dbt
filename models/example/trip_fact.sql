with trips as 
(
    select 
    ride_id,
    rideable_type,
    date(to_timestamp(started_at)) AS trip_date,
    start_station_id,
    end_station_id,
    member_csual AS member_casual,
    started_at,
    ended_at,
    timestampdiff(second,to_timestamp(started_at), to_timestamp(ended_at)) AS trip_duration_seconds
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
)
select * from trips