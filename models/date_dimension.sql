with cte as (
select
TO_TIMESTAMP(started_at) AS STARTED_AT,
DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,

{{day_type('STARTED_AT')}} AS DAY_TYPE,
{{get_season('STARTED_AT')}} AS STATION_OF_YEAR


from 
{{ source('demo', 'bike') }}    
where started_at != 'started_at'
)

select 
*
from cte 