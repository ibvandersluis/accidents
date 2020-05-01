# Data Exploration and Processing

## Variables

The original dataset contains over 285,000 observations of 70 features each. Many of the features are factors denoted by integers. The explanation of these factors and what they represent are explained in the data_guide.xls spreadsheet.

In exploring the data, the goal is to identify variables of interest and variables that are not of interest. Variables of interest can be ones that seem like they might have some bearing on the fatal or non-fatal outcome of the accident. Variables that are not of interest will be ones that either indicate events that occur after the accident (and therefore should have no predictive power), variables that should not have any predictive power on the outcome of the accident (such as latitude and longitude), and variables that are beyond the scope of this project (such as those relating to non-fatal injury).

### Variables of Interest

The key variable of interest is the Accident Severity variable, which indicates if the accident was 1: Fatal, 2: Serious, or 3: Slight. For the purposes of this project, we are only interested in whether or not the accident was fatal. We will use the Accident Severity variable to create a response variable Fatal that is `true` or `1` if 'Accident Severity' is `1` and `false` or `0` otherwise.

Variables of interest include:
- Day of Week
- 1st Road Class
- Road Type
- Junction Detail
- Junction Conrol
- 2nd Road Class
- Ped Cross - Human
- Ped Cross - Physical
- Light Conditions
- Weather
- Road Surface
- Special Conditions at Site
- Carriageway Hazards
- Urban Rural
- Vehicle Type
- Towing and Articulation
- Vehicle Manoeuvre
- Vehicle Location
- Junction Location
- Was Vehicle Left Hand Drive
- Journey Purpose
- Sex of Driver
- Age of Driver
- Age Band of Driver
- Vehicle Propulsion Code
- Date
- Time
- Speed Limit
- Engine Capacity
- Age of Vehicle
- Driver IMD Decile
- Driver Home Area Type

### Variables Not of Interest

These variables were not found to be of interest and should not have any predictive ability for determining a fatality:
- Police Force
- Local Authority (District)
- Local Authority (Highway)
- Car Passenger
- Bus Passenger
- Ped Road Maintenance Worker
- Location Easting OSGR
- Location Northing OSGR
- Latitude
- Longitude
- Lower Super Output Area of Accident
- Vehicle Reference

These variables refer to events that take place after the accident occurs and therefore cannot be used to predict a fatal accident:
- Police Officer Attend

These variables refer to data that is beyond the scope of this project:
- Casualty Class
- Sex of Casualty
- Age of Casualty
- Age Band of Casualty
- Casualty Severity
- Casualty Type
- Number of Casualties

### Variables that were Difficult to Place

Variables describing the accident itself, rather than events leading up to the accident, were difficult to place. However, since our goal is to determine whether an accident will be fatal, as opposed to determining if an accident will take place at all, these details could still be important to us.

- Skidding and Overturning
- Hit Object in Carriageway
- Veh Leaving Carriageway
- Hit Object Off Carriageway
- 1st Point of Impact
- Number of Vehicles
- 1st Road Number
- 2nd Road Number
- Ped Location
- Ped Movement

## Processing

To prepare the data, the entire dataset was imported from the `accidents.csv` file, consisting of over 285,000 observations of 70 attributes each. The response variable 'fatal' was created based on the data from the 'accident_severity' attribute.

27 features were then deleted from the data frame, after which the remaining attributes were examined to determine if any additional features could be removed. An additional 4 were deleted: 2 for containing no information, 1 for containing useless information, and 1 for being functionally identical to another feature. The resulting dataset contained 39 attributes.

The Time feature was adapted to remove unneeded junk data, then converted to time format using the `chron` package.

Next, all NA rows were removed from the dataset. This removed an enormous amount of data: the resulting dataset contained slightly over 101,000 observations, less than half of the original dataset.

The structure of our dataset was then inspected. All factors were converted to integers, as each qualitative value is associated with a number. The response variable Fatal was also converted from numeric to integer, as it should only ever be `0` or `1`, and nothing else.

At this stage there are still 39 features in the data, so the features are checked for significance. To do this we fit the data to a linear model and inspect the p-values. Any features with a p-value greater than 0.05 is not significant in determining the response variable and can be removed. This process allowed the the removal of an additional 13 features, leaving us with 26 features in the dataset.

Best subsets selection was performed to determine if the dataset should be further reduced, but the results indicated that models will be best when fit with all 25 predictive variables.

The finished, prepared dataset was exported as a CSV and also in RDS format so that it could be imported and used in the R scripts for each experiment.

Next - [Section 4: Experiments](s4_experiments.md)  
Previous -
[Section 2: Literature Review](s2_lit_review.md)