USE AirTraffic;

-- #1
-- How many flights were there in 2018 and 2019 separately?

SELECT COUNT(*) AS NumFlights2018
FROM flights
WHERE YEAR(FlightDate) = 2018;

-- using YEAR function to count the instances where 2018 appears in the FlightDate column

SELECT COUNT(*) AS NumFlights2019
FROM flights
WHERE YEAR(FlightDate) = 2019;

-- using YEAR function to count the instances where 2019 appears in the FlightDate column
-- Result: In 2018 there were 3,218,653 flights, in 2019 there were 3,302,708 flights

-- In total, how many flights were cancelled or departed late over both years?

SELECT COUNT(*) AS NumCancelled
FROM flights
WHERE Cancelled = 1;

-- Using WHERE function to look at Cancelled column to count instances of cancelled flights

SELECT COUNT(*) AS NumDepartedLate
FROM flights
WHERE DepDelay > 0;

-- Using WHERE function to look at DepDelay column to count instances of delayed flights (when the value stored is postive)
-- Result: There were 92,363 flights cancelled, and 2,542,442 flights departed late over both years

-- Show the number of flights that were cancelled broken down by the reason for cancellation.

SELECT CancellationReason, COUNT(*) AS cancelledCount
FROM flights
WHERE Cancelled = 1
GROUP BY CancellationReason;

-- Using WHERE function to find instances of cancelled flights, and GROUP BY to group them by reason for cancellation
-- Result: There were 50,225 flights cancelled dude to weather, 34,141 flights cancelled due to carrier, 7,962 flights cancelled due to National Air System, and 35 due to security

-- For each month in 2019, report both the total number of flights and percentage of flights cancelled. Based on your results, what might you say about the cyclic nature of airline revenue?

SELECT 
	MONTH(FlightDate) As Month, 
    COUNT(*) As totalNumFlights, 
    COUNT(CASE WHEN Cancelled = 1 THEN 1 END) As numCancelledFlights, ((COUNT(CASE WHEN Cancelled = 1 THEN 1 END)/COUNT(*)) * 100) AS pecentageCancelled
FROM flights
WHERE YEAR(FlightDate) = 2019
GROUP BY MONTH
ORDER BY MONTH;
/* Used CASE WHEN in order to count the instances of cancelled flights, not exactly sure why but when I would use 'WHERE Cancelled = 1' it would not 
function properly. Then divided the number of cancelled flights by the total flights in order to get the percentage, then grouped/ordered by month 

-- Results: 1-2.2%, 2-2.3%, 3-2.4%, 4-2.7%, 5-2.4%, 6-2.1%, 7-1.5%, 8-1.2%, 9-1.2%, 10-0.8%, 11-0.5%, 12-0.5%

The larger number of flight cancellations in the first 6 months are likely due to winter weather, which negatively impacts revenue.
They are able to increase revenue in the Summer and Fall. */

-- #2
-- Create two new tables, one for each year (2018 and 2019) showing the total miles traveled and number of flights broken down by airline.

DROP TABLE IF EXISTS flightData2018;

CREATE TABLE flightData2018 
SELECT AirlineName, COUNT(*) AS TotalFlights, SUM(Distance) AS MilesTraveled
FROM flights
WHERE YEAR(FlightDate) = 2018
GROUP BY AirlineName;
-- Creating table for 2018 flight data

DROP TABLE IF EXISTS flightData2019;

CREATE TABLE flightData2019
SELECT AirlineName, COUNT(*) AS TotalFlights, SUM(Distance) AS MilesTraveled
FROM flights
WHERE YEAR(FlightDate) = 2019
GROUP BY AirlineName;
-- Creating table for 2019 flight data																																																

-- Find the year-over-year percent change in total flights and miles traveled for each airline
SELECT
    flightData2018.AirlineName,
    flightData2018.TotalFlights AS Flights2018,
    flightData2019.TotalFlights AS Flights2019,
    flightData2018.MilesTraveled AS Miles2018,
    flightData2019.MilesTraveled AS Miles2019,
    ((flightData2019.TotalFlights - flightData2018.TotalFlights) / flightData2018.TotalFlights) * 100 AS FlightPercentChange,
    ((flightData2019.MilesTraveled - flightData2018.MilesTraveled) / flightData2018.MilesTraveled) * 100 AS MilesPercentChange
FROM
    flightData2018 
JOIN
    flightData2019 
ON
    flightData2018.AirlineName = flightData2019.AirlineName;
-- Joined the two tables by AirlineName, then calculating percent change in total flights and percent change in miles for each airline for both years
-- Result: Delta Airlines- 4.4% flights/5.5% miles, American Airlines- 3.2% flights, .5% miles, Southwest Airlines .8% flights, -0.1% miles

-- #3
-- What are the names of the 10 most popular destination airports overall?

SELECT 
	airports.AirportName,
    COUNT(flights.id) AS TotalFlights
FROM airports
JOIN flights
ON flights.DestAirportID = airports.AirportID
GROUP BY airports.AirportName
LIMIT 10;

SELECT 
    airports.AirportName,
    flightData.TotalFlights
FROM
    (
        SELECT DestAirportID, COUNT(id) AS TotalFlights
        FROM flights
        GROUP BY DestAirportID
        ORDER BY TotalFlights DESC
        LIMIT 10
    ) AS flightData
JOIN 
    airports
ON 
    flightData.DestAirportID = airports.AirportID;
/* Joined the two tables by airportID. Was only able to return names of the 10 most popular destination airports using a subquery, without it 
my computer was taking too long to execute and the query as was timing out. Using the subquery is much faster as it is more efficient since it reduces
the amount of data processed.
Result: 'Hartsfield-Jackson Atlanta International','595527'
'Baltimore/Washington International Thurgood Marshall','168334'
'Charlotte Douglas International','216389'
'Denver International','184935'
'Dallas/Fort Worth International','314423'
'Harry Reid International','200121'
'Los Angeles International','238092'
'Chicago Midway International','165007'
'Minneapolis-St Paul International','165367'
'Phoenix Sky Harbor International','253697'
*/

-- #4
-- Determine the number of unique aircrafts each airline operated in total over 2018-2019

SELECT AirlineName, COUNT(DISTINCT Tail_Number) AS DistinctPlanes
FROM  flights
GROUP BY AirlineName;
-- Using 'COUNT(DISTINCT Tail_Number)' to count the distinct number of aircrafts each airline operated
-- Using GROUP BY to group the number of distinct planes by airline
-- Result: American Airlines- 993, Delta Airlines- 988, Southwest Airlines- 754

-- What is the average distance traveled per aircraft for each of the three airlines?

SELECT AirlineName, SUM(Distance) / COUNT(DISTINCT Tail_Number) AS AvgDistancePerPlane
FROM flights
GROUP BY AirlineName;
-- Dividing the overall distance traveled by all aircrafts by the number of distinct aircrafts in order to get the average distance per plane
-- Result: American Airlines-1,884,615, Delta Airlines-1,752,719, Southwest Airlines-2,684,921

-- How do these results impact your estimates of each airline's finances?
/* American and Delta Airlines have a much lower average miles per aircraft in comparison to SouthWest, which means that they most likely incur
lower maintenance and fuel costs per plane */

-- #5
-- Find the average departure delay for each time-of-day across the whole data set

SELECT 
CASE
    WHEN HOUR(CRSDepTime) BETWEEN 7 AND 11 THEN "1-morning"
    WHEN HOUR(CRSDepTime) BETWEEN 12 AND 16 THEN "2-afternoon"
    WHEN HOUR(CRSDepTime) BETWEEN 17 AND 21 THEN "3-evening"
    ELSE "4-night"
END AS "time_of_day",
AVG(CASE 
		WHEN DepDelay < 1 THEN 0
		ELSE DepDelay
        END) AS AverageDelay
FROM flights
GROUP BY time_of_day
ORDER BY time_of_day;
-- Used the AVG function to get the average of departure delays, then GROUP BY time_of_day to group by morning, afternoon, evening, or night
-- Used WHEN DepDelay < 1 in order to remove the instances of early and on-time departures
-- Result: Morning- 7.9, Afternoon - 13.6, Evening- 18.3, Night- 7.7
-- It seems as though flights in the afternoon and evening tend to have longer departure delays

-- Find the average departure delay for each airport and time-of-day combination

SELECT 
    airports.AirportName,
    CASE 
        WHEN HOUR(CRSDepTime) BETWEEN 7 AND 11 THEN '1-morning'
        WHEN HOUR(CRSDepTime) BETWEEN 12 AND 16 THEN '2-afternoon'
        WHEN HOUR(CRSDepTime) BETWEEN 17 AND 21 THEN '3-evening'
        ELSE '4-night'
    END AS time_of_day,
    AVG(CASE
            WHEN flights.DepDelay < 1 THEN 0
            ELSE flights.DepDelay
        END) AS AverageDelay
FROM flights
JOIN airports
ON flights.OriginAirportID = airports.AirportID
GROUP BY airports.AirportName, time_of_day
ORDER BY airports.AirportName, time_of_day;
/* Joined the flights and airports tables by airport ID in order to display the names of each airport, then grouped by airport name and time of 
day in order to find the average departure delay for each airport and time-of-day combination. Unfortunately my computer continues to time out when 
running this query so I am not able to view its results. */

-- Limit your average departure delay analysis to morning delays and airports with at least 10,000 flights

SELECT 
    airports.AirportName,
    AVG(CASE
            WHEN flights.DepDelay < 1 THEN 0
            ELSE flights.DepDelay
        END) AS AverageDelay,
    COUNT(flights.id) AS numFlights
FROM flights
JOIN airports
ON flights.OriginAirportID = airports.AirportID
WHERE HOUR(flights.CRSDepTime) BETWEEN 7 AND 11
GROUP BY airports.AirportName
HAVING COUNT(flights.id) >= 10000 
ORDER BY AverageDelay;
/* Used WHERE HOUR in order to limit analysis to morning delays and HAVING COUNT >= 10,000 to limit to airports with that number of flights.
Joined the two tables by airport ID in order to get the Airport names from the airports table. 

Top 10 Results: 'Cincinnati/Northern Kentucky International','5.0318','10492'
'Sacramento International','5.6013','20355'
'Hartsfield-Jackson Atlanta International','5.6182','179940'
'Bob Hope','5.6947','16715'
'General Mitchell International','5.7904','11766'
'Norman Y. Mineta San Jose International','6.0134','23985'
'Southwest Florida International','6.1078','11579'
'Detroit Metro Wayne County','6.1575','43716'
'Minneapolis-St Paul International','6.2818','52214'
'Tampa International','6.4672','34577' */

-- Name the top-10 airports (with >10000 flights) with the highest average morning delay. In what cities are these airports located?

SELECT 
    airports.AirportName,
    AVG(CASE
            WHEN flights.DepDelay < 1 THEN 0
            ELSE flights.DepDelay
        END) AS AverageDelay,
    COUNT(flights.id) AS numFlights
FROM flights
JOIN airports
ON flights.OriginAirportID = airports.AirportID
WHERE HOUR(flights.CRSDepTime) BETWEEN 7 AND 11
GROUP BY airports.AirportName
HAVING COUNT(flights.id) >= 10000 
ORDER BY AverageDelay desc
LIMIT 10;
/* Ran the same query but ordered by average delay in descending order, and limited the results to 10 using 'LIMIT 10'
These airports are located in San Fransisco, Chicago (O'Hare), Dallas/Fort Worth, Los Angeles, Seattle, Chicago (Midway), 
Boston (Logan), Raleigh, Denver, San Diego */