Project Overview
This project involves analyzing flight data from the AirTraffic database to explore various aspects of airline operations in 2018 and 2019. The analysis addresses topics such as flight volume, cancellation reasons, delays, airline-specific metrics, and airport performance. By leveraging SQL queries, the project delivers actionable insights into patterns and trends in air traffic.

Key Objectives
Flight Volume Analysis:

Determine the total number of flights in 2018 and 2019.
Assess the total number of cancelled and delayed flights over both years.


Cancellations and Delays:

Breakdown flight cancellations by reason.
Analyze monthly flight data for 2019, including cancellations as a percentage of total flights, to identify cyclic revenue trends.

Airline Performance:
Create summary tables for 2018 and 2019 showing total miles traveled and the number of flights by airline.
Calculate year-over-year percentage changes in flights and miles traveled for each airline.

Airport Analysis:
Identify the 10 most popular destination airports overall.
Determine the number of unique aircraft operated by each airline and calculate the average distance traveled per aircraft.

Departure Delays:
Calculate average departure delays by time of day.
Investigate average delays by airport and time-of-day combinations, focusing on morning delays at airports with high traffic volumes.

Data and Schema
Flights Table: Contains detailed flight information, including FlightDate, Cancelled, DepDelay, Distance, CRSDepTime, AirlineName, DestAirportID, and Tail_Number.
Airports Table: Contains airport details with columns AirportID and AirportName.


Key Queries and Results

Flight Volume
Total Flights:
2018: 3,218,653 flights.
2019: 3,302,708 flights.

Cancelled/Delayed Flights:
Cancelled: 92,363
Departed Late: 2,542,442.

Cancellations
Reasons:
Weather: 50,225 flights.
Carrier: 34,141 flights.
National Air System: 7,962 flights.
Security: 35 flights.

Monthly Trends (2019):
Cancellation rates range from 0.5% in December to 2.7% in April.
Airline Performance

Year-over-Year Changes:
Delta Airlines: +4.4% flights, +5.5% miles.
American Airlines: +3.2% flights, +0.5% miles.
Southwest Airlines: +0.8% flights, -0.1% miles.

Unique Aircraft:
American Airlines: 993.
Delta Airlines: 988.
Southwest Airlines: 754.

Average Distance per Plane:
American Airlines: 1,884,615 miles.
Delta Airlines: 1,752,719 miles.
Southwest Airlines: 2,684,921 miles.

Popular Destinations
Top airports include Hartsfield-Jackson Atlanta International, Denver International, and Los Angeles International.

Departure Delays
By Time of Day:
Morning: 7.9 minutes.
Afternoon: 13.6 minutes.
Evening: 18.3 minutes.
Night: 7.7 minutes.

Morning Delays at High-Traffic Airports:
Lowest: Cincinnati/Northern Kentucky International (5.03 minutes).
Highest: San Francisco International (13.74 minutes).


Insights

Seasonality:
Flight cancellations peak in winter and spring, likely due to adverse weather conditions.

Airline Finances:
Southwest Airlines maximizes aircraft utilization with higher average miles per plane but may face higher maintenance costs.

Operational Efficiency:
Morning flights experience the lowest delays, suggesting operational bottlenecks build throughout the day.

Limitations
Some queries involving large datasets were computationally expensive and required optimizations (e.g., subqueries).
Analyses involving airport and time-of-day combinations were constrained by query timeouts.

Tools
SQL for querying the AirTraffic database.
RDBMS for data storage and retrieval.