# Databricks Accelerator Week 1 Project - TfL Cycle Hire

Journey files downloaded from __https://cycling.data.tfl.gov.uk/__ :

- 01aJourneyDataExtract10Jan16-23Jan16.csv	
- 01bJourneyDataExtract24Jan16-06Feb16.csv	
- 02aJourneyDataExtract07Fe16-20Feb2016.csv	
- 02bJourneyDataExtract21Feb16-05Mar2016.csv	
- 03JourneyDataExtract06Mar2016-31Mar2016.csv	
- 04JourneyDataExtract01Apr2016-30Apr2016.csv	
- 05JourneyDataExtract01May2016-17May2016.csv	
- 06JourneyDataExtract18May2016-24May2016.csv	
- 07JourneyDataExtract25May2016-31May2016.csv


## Data Issues
For cycle hire data from 2016
- Inconsistent column names in terms of capitalisation and spacing that make it harder to query column names
    e.g. 'End Date' vs 'EndStation Id'
- Incorrect data formats - all currently strings, should be ints for duration and ids, timestamps for start/end date etc.
    e.g. Start Date is currently string -> should be datetime, StartStation Id is also string -> should be int
- Several rows with null values for EndStation Id and EndStation Name in older files
- Duration given in seconds without clear indication; not compatible with newer files which give duration in ms and mins
- Min duration = 0 s which is invalid cycle hire
- Several empty columns which give no useful information (`_c9`, `_c10`, `_c11`)

## Cleaning Rules

Data was cleaned to remove invalid/duplicate/missing data in the following ways:
- `End Date` and `Start Date` columns were converted to timestamps in `end_time` and `start_time` columns
- `Duration` in seconds was converted to `duration_minutes` by dividing by 60
- Removed Duplicate rows with repeated `rental_id`s - removed 0 rows
- Removed rows with `duration_minutes` equal to or less than 0 minutes as not valid hires - removed 4419 rows
- Removed rows with duration greater than 24 hours (TFL has a 24 hour limit on a single bike hire) - removed 1361 rows
- Removed rows with no end station were as invalid/unfinished hire with no end destination - removed 22402 rows

## Future Steps

In order to load next month's files and further tfl cycle hire files in future, a similar process should be set up to automatically ingest and transform new data.

1. Ingest the raw csv files into the bronze layer with an auto loader or using `COPY INTO`, making sure to fill in details such as the original source file name and time ingested to trace changes and loads.
2. Check the new data files for differences in column names/data formats/types that need to be cleaned and resolved before transforming data and joining with the silver layer. Use MERGE to update existing rows and insert new records without potentially introducing duplicates to silver layer table.
3. Rebuild gold tables to take new data into account
4. To set up a sustainable pipeline, set up a job to orchestrate the three steps in an automated workflow that runs every month when new data arrives