DROP TABLE IF EXISTS flight_subset;
DROP TABLE IF EXISTS passenger_subset;

SELECT AVG(arr_delay) AS avg_arr_delay, op_unique_carrier, AVG(dep_delay) AS avg_dep_delay, CONCAT(flights.origin_airport_id, '-', flights.dest_airport_id) AS route, SUBSTRING(fl_date, 6, 2) AS month, SUBSTRING(fl_date, 1, 4) AS year
INTO TABLE flight_subset
FROM flights
WHERE diverted != 1.0
GROUP BY route, month, year, op_unique_carrier;

ALTER TABLE flight_subset ALTER COLUMN month TYPE BIGINT USING(month::bigint), ALTER COLUMN year TYPE BIGINT USING (year::bigint);

SELECT departures_scheduled, departures_performed, seats, passengers, freight, mail, aircraft_group, aircraft_type, unique_carrier, region, origin_airport_id, dest_airport_id, CONCAT(origin_airport_id, '-', dest_airport_id) AS route, month, year, distance
INTO TABLE passenger_subset
FROM passengers;

SELECT MAX(avg_arr_delay) AS avg_arr_delay, passenger_subset.route, passenger_subset.month, passenger_subset.year, unique_carrier, MAX(avg_dep_delay) AS avg_dep_delay, MAX(departures_scheduled) AS departures_scheduled, MAX(departures_performed) AS departures_performed, MAX(seats) AS seats, MAX(passengers) AS passengers, MAX(freight) AS freight, MAX(mail) AS mail, MAX(aircraft_group) AS aircraft_group, MAX(aircraft_type) AS aircraft_type, MAX(region) AS region, MAX(passenger_subset.origin_airport_id) AS origin_airport_id, MAX(passenger_subset.dest_airport_id) AS dest_airport_id, MAX(distance) AS distance
FROM flight_subset JOIN passenger_subset ON (flight_subset.route = passenger_subset.route AND op_unique_carrier = unique_carrier AND flight_subset.month = passenger_subset.month AND flight_subset.year = passenger_subset.year)
GROUP BY passenger_subset.route, passenger_subset.month, passenger_subset.year, unique_carrier;