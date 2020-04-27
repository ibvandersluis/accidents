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

# Make data technically correct

str(AccidentData)

# Much of the data is actually categorical, though R is identifying it numerically
# We can change this by coercing the data type to factor

AccidentData$vehicle_type = as.factor(AccidentData$vehicle_type)
AccidentData$towing_and_articulation = as.factor(AccidentData$towing_and_articulation)
AccidentData$vehicle_manoeuvre = as.factor(AccidentData$vehicle_manoeuvre)
AccidentData$vehicle_location.restricted_lane = as.factor(AccidentData$vehicle_location.restricted_lane)
AccidentData$junction_location = as.factor(AccidentData$junction_location)
AccidentData$skidding_and_overturning = as.factor(AccidentData$skidding_and_overturning)
AccidentData$hit_object_in_carriageway = as.factor(AccidentData$hit_object_in_carriageway)
AccidentData$vehicle_leaving_carriageway = as.factor(AccidentData$vehicle_leaving_carriageway)
AccidentData$hit_object_off_carriageway = as.factor(AccidentData$hit_object_off_carriageway)
AccidentData$X1st_point_of_impact = as.factor(AccidentData$X1st_point_of_impact)
AccidentData$was_vehicle_left_hand_drive. = as.factor(AccidentData$was_vehicle_left_hand_drive.)
AccidentData$journey_purpose_of_driver = as.factor(AccidentData$journey_purpose_of_driver)
AccidentData$sex_of_driver = as.factor(AccidentData$sex_of_driver)
AccidentData$age_band_of_driver = as.factor(AccidentData$age_band_of_driver)
AccidentData$propulsion_code = as.factor(AccidentData$propulsion_code)
AccidentData$driver_home_area_type = as.factor(AccidentData$driver_home_area_type)
AccidentData$day_of_week = as.factor(AccidentData$day_of_week)
AccidentData$X1st_road_class = as.factor(AccidentData$X1st_road_class)
AccidentData$road_type = as.factor(AccidentData$road_type)
AccidentData$junction_detail = as.factor(AccidentData$junction_detail)
AccidentData$junction_control = as.factor(AccidentData$junction_control)
AccidentData$X2nd_road_class = as.factor(AccidentData$X2nd_road_class)
AccidentData$pedestrian_crossing.human_control = as.factor(AccidentData$pedestrian_crossing.human_control)
AccidentData$pedestrian_crossing.physical_facilities = as.factor(AccidentData$pedestrian_crossing.physical_facilities)
AccidentData$light_conditions = as.factor(AccidentData$light_conditions)
AccidentData$weather_conditions = as.factor(AccidentData$weather_conditions)
AccidentData$road_surface_conditions = as.factor(AccidentData$road_surface_conditions)
AccidentData$special_conditions_at_site = as.factor(AccidentData$special_conditions_at_site)
AccidentData$carriageway_hazards = as.factor(AccidentData$carriageway_hazards)
AccidentData$urban_or_rural_area = as.factor(AccidentData$urban_or_rural_area)

# Convert boolean response variable to logical
AccidentData$fatal = as.logical(AccidentData$fatal)

# Convert time
library(chron)
AccidentData$time = chron(times=AccidentData$time)

# Check data again
str(AccidentData)

# Export CSV of prepared data
write.csv(AccidentData, "prep.csv", row.names = F)

# Export as dataframe that keeps formatting
saveRDS(AccidentData, file="prep.rds")

# Save history
savehistory()
# Quit
q()
