CREATE TABLE `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata` AS (
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202301-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202302-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202303-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202304-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202305-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202306-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202307-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202308-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202309-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202310-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202311-divvy-tripdata`
  UNION ALL
  SELECT * FROM `alien-cedar-441716-t6.cyclistic.202312-divvy-tripdata`
)

