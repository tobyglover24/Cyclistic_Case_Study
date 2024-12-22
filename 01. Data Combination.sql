-- DATA COMBINATION --

DROP TABLE IF EXISTS `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`

-- combining all 12 months of data from Jan 2023 to Dec 2023 into one single 2023 table  

CREATE TABLE IF NOT EXISTS `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata` AS (
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


-- check the number of rows total 5,719,877

SELECT 
    COUNT(*)
FROM `alien-cedar-441716-t6.cyclistic.2023_divvy_tripdata`
