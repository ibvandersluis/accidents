# Data Exploration and Processing

## Variables

There are 70 variables in this dataset.

The explainations for enumerated variables can be found in the data_guide.xls spreadsheet.

In exploring the data, the goal is to identify variables of interest and variables that are not of interest. Variables of interest can be ones that seem like they might have some bearing on the fatal or non-fatal outcome of the accident. Variables that are not of interest will be ones that either indicate events that occur after the accident (and therefore should have no predictive power), variables that should not have any predictive power on the outcome of the accident, and variables that are beyond the scope of this project (such as those relating to non-fatal injury).

### __Variables of Interest__

The key variable of interest is the Accident Severity variable, which indicates if the accident was 1: Fatal, 2: Serious, or 3: Slight. For the purposes of this project, we are only interested in whether or not the accident was fatal. We will use this variable to create a dummy variable Fatal that is `true` if 'Accident Severity' is `1` and `false` otherwise.

Accident Index is the unique reference for the accident.

Other variables of interest include:
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

### __Variables Not of Interest__

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
- IMD Decile
- Home Area Type

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

### __Variables that were Difficult to Place__

Variables describing the accident itself, rather than events leading up to the accident, were difficult to place. Most of these variables will be left in the dataset. However, as it seems that pedestrian location and movement were only recorded if the pedestrian was a casualty, these can be left out.

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