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

- 435JourneyDataExtract01Jan2026-15Jan2026.csv	
- 436JourneyDataExtract16Jan2026-31Jan2026.csv	
- 437JourneyDataExtract01Feb2026-14Feb2026.csv	
- 438JourneyDataExtract15Feb2026-28Feb2026.csv	
- 439JourneyDataExtract01Mar2026-15Mar2026.csv	
- 440JourneyDataExtract15Mar2026-31Mar2026.csv	
- 441JourneyDataExtract01Apr2026-15Apr2026.csv	
- 442JourneyDataExtract16Apr2026-30Apr2026.cs
- 443JourneyDataExtract01May2026-16May2026.csv	
- 444JourneyDataExtract17May2026-31May2026.csv


## Data Issues

- Inconsistent column names in terms of capitalisation and spacing  
- Incorrect data formats (should be ints for duration and ids, timestamps)
- Several rows with null values for EndStation Id and EndStation Name in older files