with cte as (
select
TO_TIMESTAMP(started_at) as STARTED_AT,
DATE(TO_TIMESTAMP(started_at)) as DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(started_at)) as HOUR_STARTED_AT,
CASE
WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat', 'Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END AS DAY_TYPE,

CASE WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
END AS STATION_OF_YEAR
--DATE(STARTED_AT)
from 
{{ source('demo', 'bike') }}    
where started_at != 'started_at'
)

select 
*
from cte 