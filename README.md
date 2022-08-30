# JanFlightPredictions

### Step One: Data Exploration/Feature Selection

We started by looking through the provided data and identifying features that we thought could be predictive of flight delays. To this end, we initlaly settled on fl_date, mkt_unique_carrier, op_unique_carrier, tail_num, op_carrier_fl_num, origin_airport_id, dest_airport_id, origin, dest, origin_city_name dest_city_name, dep_delay, distance, and diverted from the flights table and departures_scheduled, departures_performed, seats, passengers, aircraft_group, aircraft_type, freight, mail, unique_carrier, and region from passengers. However, with the data in the passengers table being aggregated by month and sorted by route we had to make some changes to combine the tables. To that end, we created a route column in the flights and passengers tables whlie also sorting the flights table by route, month, year, and op_unique_carrier; these ended up being the columns on which we joined the flights table to the passengers table. From here, we created dummies for categorical variables and scaled numerical ones, which led to us dropping some features like route and tail_num in order to limit the number of columns.

### Step Two: Modeling
