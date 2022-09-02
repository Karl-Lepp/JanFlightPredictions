# JanFlightPredictions

### Step One: Data Exploration/Feature Selection

We started by looking through the provided data and identifying features that we thought could be predictive of flight delays. To this end, we initlaly settled on fl_date, mkt_unique_carrier, op_unique_carrier, tail_num, op_carrier_fl_num, origin_airport_id, dest_airport_id, origin, dest, origin_city_name dest_city_name, dep_delay, distance, and diverted from the flights table and departures_scheduled, departures_performed, seats, passengers, aircraft_group, aircraft_type, freight, mail, unique_carrier, and region from passengers. 

With the data in the passengers table being aggregated by month and sorted by route we had to make some changes to combine the tables. To that end, we created a route column in the flights and passengers tables whlie also sorting the flights table by route, month, year, and op_unique_carrier; these ended up being the columns on which we joined the flights table to the passengers table. From here, we created dummies for categorical variables and scaled numerical ones, which led to us dropping some features like route and tail_num in order to limit the number of columns. For the test data, we combined the flight_test table with the passengers table by using aggregation functions to get averages of needed features, grouped by route and date.

### Step Two: Modeling and Future Improvements

We tried a few different models: linear regressions (Lasso, Ridge, and Elastic), Naive Bayes, Random Forest, and XG Boost. The classification models required us to bin arrival time, and when running linear regressions Ridge seemed to perform best. We ran regressions on both the binned data and on the continuous data, and the binned data performed better. The accuracy scores of the random forest model was ~0.72 when predicting solely whether or not a plane would be late, and around 0.2-0.25 for our models when predicting quartiles the minute delay would fall under.

For future improvements, integrating weather data would likely help improve accuracy, as would being able to find passenger data that is not aggregated by month, but instead provides information on each individual flight. Additionally, running stacked models would be something worth looking into.

### Notes of Model Output

The Output we looked to predict being the time was used by looking at the likely Quartile the Arrival Delay would fall under from a random forest model.  For 93% of the data the Quartiles are seperated by 3-10 minutes and can be classifed comfortably within those quartiles, however for the 10th quartile which makes up ~7% of our data, due to it containing right skewed outliers, can be anywhere from 30 minnutes to 80 hours, for this particular problem we would run our model after removing right skewed outliers to get a prediction closer to the rest of the dataset.  To adress this problem in our predictions if data falls within the 10th Quartile we assess it as being 30+ minutes late which. 

### File Descriptions
  -Cleaning Dataframes contains the notebooks that we use to get data from the SQL tables and clean them in pandas.
  
  -Models contains the notebooks with our models, including different types of linear regressions and random forest.
  
  -Rough contains some initial unorganized exploration of the SQL tables.

  -SQL contains postgresql files with the relevant SQL queries.
  
  -Predicting JanFlights is the jupyter file of pulling data and loading model to make our final prediction
  
  -Submission is our final csv prediction on how late planes will be for the Week of January 1st-7th

