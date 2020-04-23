# Data Processing

# This file records steps taken to process the data from accidents.csv



# Clear workspace
rm(list=ls())

# Load data
AccidentData = read.csv("accidents.csv", header = T, na.strings = "-1")

# Inspect data
dim(AccidentData)
names(AccidentData)

# Inspect fatality data (accident is fatal if accident_severity = 1)
table(AccidentData$accident_severity)

# Create 'Fatal' variable
AccidentData$fatal = 0
names(AccidentData)
# Set 'fatal' to 1 if there was a fatality
AccidentData$fatal[AccidentData$accident_severity == 1] = 1
# Check that number of fatal = 1 is the same as what we get from accident_severity
table(AccidentData$fatal)
table(AccidentData$fatal, AccidentData$accident_severity)
# Get fatality percentages
prop.table(table(AccidentData$fatal))

# Remove unwanted variables
AccidentData$accident_severity = NULL
AccidentData$police_force = NULL
AccidentData$local_authority_.district. = NULL
AccidentData$local_authority_.highway. = NULL
AccidentData$car_passenger = NULL
AccidentData$bus_or_coach_passenger = NULL
AccidentData$pedestrian_road_maintenance_worker = NULL
AccidentData$location_easting_osgr = NULL
AccidentData$location_northing_osgr = NULL
AccidentData$latitude = NULL
AccidentData$longitude = NULL
AccidentData$lsoa_of_accident_location = NULL
AccidentData$did_police_officer_attend_scene_of_accident = NULL
AccidentData$sex_of_casualty = NULL
AccidentData$casualty_class = NULL
AccidentData$age_of_casualty = NULL
AccidentData$age_band_of_casualty = NULL
AccidentData$casualty_type = NULL
AccidentData$number_of_casualties = NULL
AccidentData$NUmber_of_Casualities_unique_to_accident_index = NULL
AccidentData$X1st_road_number = NULL
AccidentData$X2nd_road_number = NULL
AccidentData$casualty_reference = NULL
AccidentData$casualty_severity = NULL
AccidentData$casualty_home_area_type = NULL
AccidentData$casualty_imd_decile = NULL
AccidentData$accident_index = NULL
AccidentData$vehicle_reference = NULL

# Check if variance of feature includes fatality
table(AccidentData$speed_limit, AccidentData$fatal)
table(AccidentData$towing_and_articulation, AccidentData$fatal)
table(AccidentData$pedestrian_crossing.human_control, AccidentData$fatal)
table(AccidentData$pedestrian_location, AccidentData$fatal)
table(AccidentData$pedestrian_movement, AccidentData$fatal)
table(AccidentData$junction_detail, AccidentData$fatal)
table(AccidentData$propulsion_code, AccidentData$fatal)
table(AccidentData$skidding_and_overturning, AccidentData$fatal)
table(AccidentData$was_vehicle_left_hand_drive., AccidentData$fatal)
table(AccidentData$number_of_vehicles, AccidentData$fatal)

table(AccidentData$urban_or_rural_area, AccidentData$fatal)
prop.table(table(AccidentData$urban_or_rural_area, AccidentData$fatal))
# Important note:
# The above table indicates that non-fatal accidents are far more likely in an urban area
# But fatal accidents are far more likey in a rural area

table(AccidentData$driver_imd_decile, AccidentData$fatal)
summary(AccidentData$driver_imd_decile)
# The feature driver_imd_decile is entirely empty and can be removed
AccidentData$driver_imd_decile = NULL

table(AccidentData$vehicle_imd_decile, AccidentData$fatal)
# vehicle_imd_decile is also empty and can be removed
AccidentData$vehicle_imd_decile = NULL

table(AccidentData$No_of_Vehicles_involved_unique_to_accident_index, AccidentData$number_of_vehicles)
# No_of_Vehicles_involved_unique_to_accident_index is identical to numer_of_vehicles and can be removed
AccidentData$No_of_Vehicles_involved_unique_to_accident_index = NULL


# Remove junk data from 'time' variable
AccidentData$time = substring(AccidentData$time, first = 12)

# The 'date' variable either shows a date in 2015 or an integer in the 40,000 range
# Unfortunately this means it cannot be relied upon for any useful information
# Remove date
AccidentData$date = NULL

str(AccidentData)

# The data frame is still far too large. We will trim it down to the first 5000 observations
# Hopefully this means that they are also the most recent observations
# However, since the date variable was useless, we don't know that
AccidentData = AccidentData[1:5000,]

# Export CSV of prepared data
write.csv(AccidentData, "prep.csv", row.names = F)


# Save history
savehistory()
# Quit
q()
