SET use_cached_result = false;

-- query to find number of hires per week
SELECT 
    weekofyear(start_time) AS week,
    COUNT(*) as num_hires
FROM workspace.tfl_lakehouse.silver
GROUP BY weekofyear(start_time)
ORDER BY week;

-- query to find busiest stations in month of may 2016
SELECT 
    start_station_id,
    COUNT(*) as num_hires
FROM workspace.tfl_lakehouse.silver
WHERE month(start_time) = 5
GROUP BY start_station_id
ORDER BY COUNT(*) DESC
LIMIT 100;

-- query to find average journeys when start and end station are the same
SELECT 
    start_station_id,
    end_station_id,
    AVG(duration_minutes) AS avg_duration
FROM workspace.tfl_lakehouse.silver
WHERE start_station_id = end_station_id
GROUP BY start_station_id, end_station_id
ORDER BY avg_duration;


-- query to find average and longest journeys of most used start stations
SELECT 
    start_station_id,
    AVG(duration_minutes) AS avg_journey,
    MAX(duration_minutes) AS longest_journey,
    COUNT(*) AS num_journeys
FROM workspace.tfl_lakehouse.silver
GROUP BY start_station_id
HAVING num_journeys > 5000
ORDER BY start_station_id;
