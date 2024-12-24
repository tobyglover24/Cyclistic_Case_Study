# Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Cyclistic Case Study](https://www.coursera.org/learn/google-data-analytics-capstone) as part of [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics)

## Introduction
In this case study, I will perform typical actions of a junior data analyst working at a fictional bike-share company, Cyclistic. To complete the overall business task, I will follow the steps of the data analysis process: [Ask](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/README.md#ask), [Prepare](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/README.md#prepare), [Process](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/README.md#process), [Analyse](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/README.md#analyse&share), [Share](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/README.md#analyse&share) and [Act](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/README.md#act)

### Shortcuts

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

SQL Queries:
* [01. Data Combination](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/01.%20Data%20Combination.sql)
* [02. Data Exploration](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/02.%20Data%20Exploration.sql)
* [03. Data Cleansing](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/03.%20Data%20Cleansing.sql)
* [04. Data Analysis](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/04.%20Data%20Analysis.sql)

Data Visualisations(
## Analyse & Share

## Context
### Cyclistic
Cyclistic are a bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing) believes that maximising the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analysing the Cyclistic historical bike trip data to identify trends.

## Ask
### Business Task
Design marketing strategies aimed at converting casual riders into annual members.

### Focus
My focus is on how annual members and casual riders use Cyclistic bikes differently.

The future marketing program will also answer:
* Why would casual riders by Cyclistic annual memberships?
* How can Cyclistic use digital media to influence casual riders to become members?

For now, this analysis will only focus on analysis between members and casual riders on their cycling patterns.

## Prepare
### Data Source
This analysis will use Cyclistic's historical trip data from Jan 2023 to Dec 2023. The 12 months of Cyclistic trip data can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) (the data has been made available by Motivate International Inc. under [this license](https://divvybikes.com/data-license-agreement)

This is public data for exploratory analysis. There is no access to rider's personally identifiable information, meaning that you won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

### Data Organisation
Each of the 12 files are named YYYYMM-divvy-tripdata depending on the year and month that the data corresponds with. A file includes the following information for each ride (_column names_); a unique ride ID (_ride_id_), bike type (_rideable_type_), start time (_started_at_), end time (_ended_at_), start station info (_start_station_name, start_station_id, start_lat, start_lng_), end station info (_end_station_name, end_station_id, end_lat, end_lng_) rider type (_member_casual_).

## Process
This analysis will use BigQuery for analysis due to its ability to handle large datasets. Microsoft Excel is impractical as it cannot handle datasets with over 1,048,576 rows (our data will have more rows). Other tools like R Studio are suitable but we will use BigQuery here.

### Data Combination
See SQL Query: [01. Data Combination](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/01.%20Data%20Combination.sql)

In the Cyclistic dataset, 12 csv files representing each month of 2023 are uploaded and joined into one table - _2023_divvy_tripdata_

There are 5,719,877 rows in this table

### Data Exploration
See SQL Query: [02. Data Exploration](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/02.%20Data%20Exploration.sql)

Before cleaning and analysis, I will explore the data to understand the data I'm working with and highlight any inconsistencies that need to be addressed when cleaning the data.

**Observations:** 
1. **Data Types** - the column names and data types are shown below - ***ride_id*** is our primary key as it uniquely identifies each row.
<img width="464" alt="image" src="https://github.com/user-attachments/assets/c0b3bb61-76fd-4af2-b85f-07659a60d9e2" />


2. **Null Values** - nulls appear in 6 of the 13 columns. Specifically in the station information and ending location. Further testing is needed to find any relationship between the nulls.
<img width="1069" alt="image" src="https://github.com/user-attachments/assets/0684b2fc-e6d7-4e3c-b334-fd7db227bc1a" />


3. **Duplicate Values** - _ride_id_ is our primary key in this table. It must be unique for each row, meaning there must be no duplicates in this column. No need for cleaning as there are **no duplicates** in the _ride_id_ column.

4. **_ride_id_ length** - all values are 16 characters in length. No need for cleaning.

5. **Types of Bike** - there are 3 unique types of bike (_rideable_type_).
<img width="388" alt="image" src="https://github.com/user-attachments/assets/95269227-5a20-486e-bdc4-9aa55d2d4a7c" />

6. **Trip Duration** - to find the trip duration, we can use the _started_at_ and _ended_at_ timestamps to create a new column; ***trip_duration***, by extracting the number of minutes between the start and end timestamp. ***day_of_week*** and ***month*** columns will also be created by extracting the relevant information when cleaning, to support analysis.

The 149,615 trips less than a minute and 6418 trips longer than a day will be removed when cleaning to ensure data integrity.

7. **Null Station Information**
START - 875,848 rows are missing either the start station name or id. There are 0 rows that are missing only the start station name when the station id is not null. Therefore, we can remove all the rows with nulls in the start station name when cleaning, as these are rows that are missing both start name and id.

END - 929,343 rows are missing either the end station name or id. There are 0 rows that are missing only the end station name when the station id is not null. Therefore, we can remove all the rows with nulls in the end station name when cleaning, as these are rows that are missing both end name and id.

LAT/LNG - 6990 rows have both _end_lat_ and _end_lng_ missing. These will need to be removed.

8. **Member Types** - there are 2 unique types of member (_member_casual_)
<img width="386" alt="image" src="https://github.com/user-attachments/assets/38171774-659f-4071-aebd-eedd0d8f3ead" />


### Data Cleansing
See SQL Query: [03. Data Cleansing](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/03.%20Data%20Cleansing.sql)

The steps to create a clean table for analysis:
* Remove nulls - all rows with nulls in _start_station_name, end_station_name, end_lat, end_lng_ are removed.
* Remove extremes - all trips that are less than a minute or longer than a day in duration are removed.
* Remove columns - unnecessary columns _start_station_id_ and _end_station_id_ are removed.
* Add columns - _trip_duration, month, day_of_week_ are added.

In total, 1,476,445 rows are removed.

## Analyse & Share
See SQL Query: [04. Data Analysis](https://github.com/tobyglover24/GDA_CS1_Cyclistic/blob/main/04.%20Data%20Analysis.sql)

See Data Visualisation: Tableau Visualisations

After loading our clean dataset into Tableau, we can produce insights from our visualisations.

![Ride Type Split](https://github.com/user-attachments/assets/109c66e9-79a3-4f95-8623-f9e46d77942e)
**Insight** - In 2023, 64.5% of rides were completed by members. Classic bike was the most popular choice of bike by both casual riders and members. A greater proportion of casual riders chose electric bike (36.9%) compared to members (34.7%).

![Monthly Trend](https://github.com/user-attachments/assets/24e00a9f-4668-4eb9-85f2-bda6177d73ad)
**Insight** - Member and casual rides follow very similar monthly riding habits, with the number of riders peaking in summer and lowest at the start of the new year. Note that casual rides peaked in July whereas members rides peaked a month later in August

![Hourly Rides by Rider Type](https://github.com/user-attachments/assets/98f78173-43e1-4f65-8976-65141e6efa0a)
**Insight**
* CASUAL - Rides by casuals peak on the weekend, where rides are spread across the day mostly from 10am to 6pm. Throughout the week, there are small peaks or rides times at around 7am and 5pm.
* MEMBER - Rides by members follow much stronger peaks throughout the week, between 7-8am and then again at 4-6pm, around typical work times. Their weekend patterns and volumes are extremely similar to casual riders.

![Start Station Map](https://github.com/user-attachments/assets/4a7c93b9-d31e-4725-98a4-b30c26d9c807)
**Insight** - Casual riders start their trips mostly along the coastline of Chicago, with the spread of start trips being very focused along the coast. Member ride starts are more spread out across the City, with the most common start stations being more in-land.

![End Station Map](https://github.com/user-attachments/assets/8df20da0-1a84-422a-a836-1f0750047935)
**Insight** - End stations follow very similar trends to start stations for both casuals and members. Casuals ended their trips most commonly along the coast line of the city, whereas members end stations were more spread across the city, with the number of rides ending peaking at stations further in-land.



## Act

The overall business task of this piece was to design marketing strategies aimed at converting casual riders into annual members, by looking into the differences in ride habits between members and casuals.

After analysing the 2023 Cyclistic trip data, these are the following marketing strategies that would potentially be worth looking into.

### Marketing Recommendations
1. Run all advertising campaings aimed at casuals along the Chicago coast-line - casual riders are typically starting and ending along the coast-line, so any marketing to convert them to members would be seen the most along the coast-line.
2. Make casuals more aware that Cyclistic bikes can be used as a form of transport to and from work - marketing campaigns need to highlight that this is an eco-friendly way to travel to and from work. If casuals understand this and make this a primary transport mode, this will hopefully convert them to members if they're using the bikes daily.
3. Offer mid-week discounts - we know that bikes are most popular at weekends for casuals, but for members ridership is higher in the week. Offering incentives to ride uring the week could help casuals realise that bikes are not impractical for them during the week, and they can also use their commutes as daily exercise.

### Next Steps
Proceed with presenting these findings to stakeholders for feedback and potential strategies of bringing these findings to life. Further breakdown of the most common hotspots/trips by casuals and members could help support marketing strategies.


## Thank you!
Thank you for reading this case study - Toby Glover
