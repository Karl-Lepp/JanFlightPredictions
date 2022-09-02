
DROP TABLE IF EXISTS passengers_aggregated;
DROP TABLE IF EXISTS week_one;

SELECT COUNT(departures_scheduled), COUNT(passengers) FROM passengers;

-- SELECT op_carrier_fl_num, op_unique_carrier, MAX(origin_airport_id) AS origin_airport_id, MAX(dest_airport_id) AS dest_airport_id, AVG(distance) AS distance, CONCAT(flights_test.origin_airport_id, '-', flights_test.dest_airport_id) AS route, EXTRACT(DAY from fl_date) AS day
-- INTO TABLE week_one
-- FROM flights_test
-- WHERE EXTRACT(DAY from fl_date) < 08
-- GROUP BY op_carrier_fl_num, route, op_unique_carrier, day;

-- SELECT AVG(departures_scheduled) AS avg_departures_scheduled, AVG(departures_performed) AS avg_departures_performed, AVG(seats) AS avg_seats, AVG(passengers) AS avg_passengers, AVG(freight) AS avg_freight, AVG(mail) AS avg_mail, MAX(aircraft_group) AS aircraft_group, MAX(aircraft_type) AS aircraft_type, unique_carrier, CONCAT(origin_airport_id, '-', dest_airport_id) AS route
-- INTO passengers_aggregated
-- FROM passengers
-- WHERE month = 01
-- GROUP BY route, unique_carrier;

-- SELECT day, op_unique_carrier, MAX(week_one.origin_airport_id) AS origin_airport_id, MAX(week_one.dest_airport_id) AS dest_airport_id, MAX(distance) AS distance, MAX(avg_departures_scheduled) AS avg_departures_scheduled, MAX(avg_departures_performed) AS avg_departures_performed, MAX(avg_seats) AS avg_seats, MAX(avg_passengers) AS avg_passengers, MAX(avg_freight), MAX(avg_mail) AS avg_mail, MAX(aircraft_group) AS aircraft_group, MAX(aircraft_type) AS aircraft_type
-- FROM week_one JOIN passengers_aggregated ON (week_one.route = passengers_aggregated.route AND op_unique_carrier = unique_carrier)
-- GROUP BY op_carrier_fl_num, week_one.route, op_unique_carrier, day;

-- SELECT COUNT(*) FROM flights_test WHERE EXTRACT(DAY from fl_date) < 08;
