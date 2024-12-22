-- DATA EXPLORATION -- 


--  null values - check if any exist

SELECT 
  COUNT(*) - COUNT(ride_id) ride_id,
  COUNT(*) - COUNT(rideable_type) rideable_type,
  COUNT(*) - COUNT(started_at) started_at,
  COUNT(*) - COUNT(ended_at) ended_at,
  COUNT(*) - COUNT(start_station_name) start_station_name,
  COUNT(*) - COUNT(start_station_id) start_station_id,
  COUNT(*) - COUNT(end_station_name) end_station_name,
  COUNT(*) - COUNT(end_station_id) end_station_id,
  COUNT(*) - COUNT(start_lat) start_lat,
  COUNT(*) - COUNT(start_lng) start_lng,
  COUNT(*) - COUNT(end_lat) end_lat,
  COUNT(*) - COUNT(end_lng) end_lng,
  COUNT(*) - COUNT(member_casual) member_casual
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`

  

-- duplicate rows - check if any exist

SELECT 
  COUNT(ride_id) - COUNT(DISTINCT ride_id) as duplicate_rows
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`


  
-- ride_id - check length is 16 characters

SELECT 
  LENGTH(ride_id) as length_ride_id
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
GROUP BY length_ride_id


  
-- rideable_type - check the number of unique ride types is 3

SELECT 
  rideable_type,
  COUNT(rideable_type) AS count_rideable_type
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
GROUP BY rideable_type


  
-- trip duration - calculate no rides; less than a minute long, longer than a day

SELECT
  COUNT(*) AS less_than_a_min
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
WHERE 
  ((EXTRACT(HOUR FROM (ended_at - started_at))) * 60 +
  (EXTRACT(MINUTE FROM (ended_at - started_at))) +
  (EXTRACT(SECOND FROM (ended_at - started_at))) / 60) < 1		-- less than a minute - 151,069 rows


  
SELECT
  COUNT(*) AS more_than_a_day
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
WHERE 
  ((EXTRACT(HOUR FROM (ended_at - started_at))) * 60 +
  (EXTRACT(MINUTE FROM (ended_at - started_at))) +
  (EXTRACT(SECOND FROM (ended_at - started_at))) / 60) > 1440	-- longer than a day - 6,418 rows

  

-- start station information - check if any nulls, then check where they appear
  
SELECT 
  COUNT (ride_id) AS rows_missing_start_station_info
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
WHERE start_station_name IS NULL OR start_station_id IS NULL 		-- missing some start station info - 875,848 rows

SELECT 
  COUNT (ride_id) AS missing_start_name
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
WHERE start_station_name IS NULL AND start_station_id IS NOT NULL	-- 0 rows missing only start name

  
-- end station information - check is any nulls, then check where they appear

SELECT 
  COUNT (ride_id) AS rows_missing_end_station_info
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
WHERE end_station_name IS NULL OR end_station_id IS NULL		-- missing some end station info - 929,343 rows 

SELECT 
  COUNT (ride_id) AS missing_end_name
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
WHERE end_station_name IS NULL AND end_station_id IS NOT NULL	-- 0 rows missing only end name


  
-- member_casual - check the number of unique member types is 2

SELECT 
  member_casual,
  COUNT (member_casual) as no_of_trips
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
GROUP BY member_casual


  
-- end_lat, end_lng - check for nulls

SELECT 
  COUNT(*) AS missing_end_loc
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
WHERE end_lat IS NULL AND end_lng IS NULL			-- all 6990 rows have both missing

