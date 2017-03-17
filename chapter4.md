---
title: 'Case study: New York City bike share'
description: >-
  This chapter gives you an opportunity to apply everything you've learned in
  the first three chapters to real-world data! You'll be working with a database
  that contains information on millions of individual bike share trips in New
  York City in 2016, along with the stations the bikes belong to, and daily
  weather metrics recorded from Central Park of the same time period.

--- type:VideoExercise lang:sql xp:50 skills:1 key:911bc3c8cf
## Introduction to the data

* Intro Citi Bike database: trips, stations, weather
* Part of an urban planning committee trying to understand biking habits in NYC
* Will be exploring a number of questions, practicing your SQL skills along the way
* Quick refresher of chapter 1 concepts (SELECT, DISTINCT, aggregate functions)

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:b0be145084
## How many records?

How many records are in the stations, trips, and weather tables, respectively? 498, 9937968, 365 (numbers may change if/when we subset the data to e.g. summer only)

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:419d49c7f9
## Preview the tables

SELECT some columns from weather, then from stations, then from weather. But intro LIMIT for the last, since we don't want to retrieve all records from such a huge table

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:09bc128ec6
## Explore the data

* How many bikes? SELECT COUNT(DISTINCT bike_id) FROM trips;
* Minimum, average, and maximum trip durations (in seconds, minutes)?
* Minimum, average, and maximum mean_temp_f?

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:VideoExercise lang:sql xp:50 skills:1 key:8102fab0db
## Refresher: filtering rows

* Quick review of chapter 2 concepts (filtering rows)
* Pose some interested questions to be answered in the following exercises

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:b0f844f025
## When it rains, it pours

* How many days saw more than 1/2 inch of precipitation?
* How many days did it *rain* more than 1/2 inch? (Need to use LIKE to partial match for "Rain" on events column)
* How many days did it rain BETWEEN 1/2 and 1 inches, with cloud cover greater than 6?


*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:d44b60c855
## Does rain affect rides?

* What's the average trip length?
* What's the average trip length on days with more than 1/2 inch of rain? (use start_date)

SELECT AVG(duration)
FROM trips
WHERE start_date IN (
  SELECT date
  FROM weather
  WHERE precipitation_in > 0.5
);

* Finish with multiple choice to interpret result

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:VideoExercise lang:sql xp:50 skills:1 key:79c6de8759
## Refresher: sorting and grouping

* Refresher of chapter 3 concepts (sorting and grouping)
* Pose some interesting questions to be answered in following exercises

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8

--- type:NormalExercise lang:sql xp:100 skills:1 key:697fd44510
## Most popular times to ride?

* Compute the total number of trips started each month
* Compare ridership on weekdays vs weekends (use DATE_PART('dow', ...))
* Average daily rides on national holidays vs. non-holidays?
* Which of the following is NOT a correct interpretation of these results? (evaluate interpretation of last 3 results)

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:a85da2f4cc
## Most and least popular routes?

* Count the total number of trips within each combination of start_station_id and end_station_id (need to LIMIT result?)
* Then sort in both ascending and descending order
* Are these routes particularly short or long relative to other routes?

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:9335870a7d
## Average trip duration by starting station

Compute the average trip duration by starting station and order the result by station id:

SELECT start_station_id AS station, AVG(duration) AS seconds
FROM trips
GROUP BY station
ORDER BY station

---

Again, but only the longest trips:

SELECT start_station_id AS station, AVG(duration) AS seconds
FROM trips
GROUP BY station
HAVING AVG(duration) > 2000
ORDER BY seconds DESC;

Takes us to a station out in Bed-Stuy, Brooklyn!

*** =instructions

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}

```

*** =solution
```{sql}

```

*** =sct
```{sql}

```

--- type:VideoExercise lang:sql xp:50 skills:1 key:7e7b661149
## Summary

Summarize what was learned from the case study and the course overall

*** =video_link
//player.vimeo.com/video/154783078

*** =video_hls
//videos.datacamp.com/transcoded/000_placeholders/v1/hls-temp.master.m3u8