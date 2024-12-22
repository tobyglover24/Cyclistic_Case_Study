-- DATA ANALYSIS --



-- no of trips by member type and ride type

SELECT 
  member_casual,
  rideable_type,
  COUNT(*) AS total_trips
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips


-- no of trips by month

SELECT 
  month,
  member_casual,
  COUNT(*) as total_trips
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY month, member_casual
ORDER BY member_casual


-- no of trips by day

SELECT 
  day_of_week,
  member_casual,
  COUNT(*) as total_trips
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY day_of_week, member_casual
ORDER BY member_casual


-- no of trips by hour

SELECT 
  EXTRACT (HOUR FROM started_at) as hour_of_day,
  member_casual,
  COUNT(*) as total_trips
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual


-- average ride_length by month

SELECT 
  month,
  member_casual,
  avg(ride_length) as avg_ride_length
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY month, member_casual


-- average ride_length by day

SELECT 
  day_of_week,
  member_casual,
  avg(ride_length) as avg_ride_length
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY day_of_week, member_casual


-- average ride_length by hour

SELECT 
  EXTRACT (HOUR FROM started_at) as hour_of_day,
  member_casual,
  avg(ride_length) as avg_ride_length
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY hour_of_day, member_casual


-- start station locations

SELECT 
  start_station_name, 
  member_casual,
  AVG(start_lat) AS start_lat, 
  AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY start_station_name, member_casual


-- end station locations

SELECT 
  end_station_name, 
  member_casual,
  AVG(end_lat) AS end_lat, 
  AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `alien-cedar-441716-t6.cyclistic.cleaned_2023_tripdata`
GROUP BY end_station_name, member_casual

