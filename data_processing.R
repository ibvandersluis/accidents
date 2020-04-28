# Data Processing

# This file records steps taken to process the data from accidents.csv



# Clear workspace
rm(list=ls())

# Load data
accidents = read.csv("accidents.csv", header = T, na.strings = "-1")

# Inspect data
dim(accidents)
names(accidents)

# Inspect fatality data (accident is fatal if accident_severity = 1)
table(accidents$accident_severity)

# Create 'Fatal' variable
accidents$fatal = 0
names(accidents)
# Set 'fatal' to 1 if there was a fatality
accidents$fatal[accidents$accident_severity == 1] = 1
# Check that number of fatal = 1 is the same as what we get from accident_severity
table(accidents$fatal)
table(accidents$fatal, accidents$accident_severity)
# Get fatality percentages
prop.table(table(accidents$fatal))

# Remove unwanted variables
accidents$accident_severity = NULL
accidents$police_force = NULL
accidents$local_authority_.district. = NULL
accidents$local_authority_.highway. = NULL
accidents$car_passenger = NULL
accidents$bus_or_coach_passenger = NULL
accidents$pedestrian_road_maintenance_worker = NULL
accidents$location_easting_osgr = NULL
accidents$location_northing_osgr = NULL
accidents$latitude = NULL
accidents$longitude = NULL
accidents$lsoa_of_accident_location = NULL
accidents$did_police_officer_attend_scene_of_accident = NULL
accidents$sex_of_casualty = NULL
accidents$casualty_class = NULL
accidents$age_of_casualty = NULL
accidents$age_band_of_casualty = NULL
accidents$casualty_type = NULL
accidents$number_of_casualties = NULL
accidents$NUmber_of_Casualities_unique_to_accident_index = NULL
accidents$X1st_road_number = NULL
accidents$X2nd_road_number = NULL
accidents$casualty_reference = NULL
accidents$casualty_severity = NULL
accidents$casualty_home_area_type = NULL
accidents$casualty_imd_decile = NULL
accidents$accident_index = NULL
accidents$vehicle_reference = NULL

# Check if variance of feature includes fatality
table(accidents$speed_limit, accidents$fatal)
table(accidents$towing_and_articulation, accidents$fatal)
table(accidents$pedestrian_crossing.human_control, accidents$fatal)
table(accidents$pedestrian_location, accidents$fatal)
table(accidents$pedestrian_movement, accidents$fatal)
table(accidents$junction_detail, accidents$fatal)
table(accidents$propulsion_code, accidents$fatal)
table(accidents$skidding_and_overturning, accidents$fatal)
table(accidents$was_vehicle_left_hand_drive., accidents$fatal)
table(accidents$number_of_vehicles, accidents$fatal)

table(accidents$urban_or_rural_area, accidents$fatal)
prop.table(table(accidents$urban_or_rural_area, accidents$fatal))
# Important note:
# The above table indicates that non-fatal accidents are far more likely in an urban area
# But fatal accidents are far more likey in a rural area

table(accidents$driver_imd_decile, accidents$fatal)
summary(accidents$driver_imd_decile)
# The feature driver_imd_decile is entirely empty and can be removed
accidents$driver_imd_decile = NULL

table(accidents$vehicle_imd_decile, accidents$fatal)
# vehicle_imd_decile is also empty and can be removed
accidents$vehicle_imd_decile = NULL

table(accidents$No_of_Vehicles_involved_unique_to_accident_index, accidents$number_of_vehicles)
# No_of_Vehicles_involved_unique_to_accident_index is identical to numer_of_vehicles and can be removed
accidents$No_of_Vehicles_involved_unique_to_accident_index = NULL


# Remove junk data from 'time' variable
accidents$time = substring(accidents$time, first = 12)

# The 'date' variable either shows a date in 2015 or an integer in the 40,000 range
# Unfortunately this means it cannot be relied upon for any useful information
# Remove date
accidents$date = NULL

# Remove NA rows
sum(is.na(accidents))
accidents = na.omit(accidents)

# Make data technically correct

str(accidents)

# Much of the data is actually categorical, though R is identifying it numerically
# We can change this by coercing the data type to factor
# Mohamed said to leave them as numeric values

# accidents$vehicle_type = as.factor(accidents$vehicle_type)
# accidents$towing_and_articulation = as.factor(accidents$towing_and_articulation)
# accidents$vehicle_manoeuvre = as.factor(accidents$vehicle_manoeuvre)
# accidents$vehicle_location.restricted_lane = as.factor(accidents$vehicle_location.restricted_lane)
# accidents$junction_location = as.factor(accidents$junction_location)
# accidents$skidding_and_overturning = as.factor(accidents$skidding_and_overturning)
# accidents$hit_object_in_carriageway = as.factor(accidents$hit_object_in_carriageway)
# accidents$vehicle_leaving_carriageway = as.factor(accidents$vehicle_leaving_carriageway)
# accidents$hit_object_off_carriageway = as.factor(accidents$hit_object_off_carriageway)
# accidents$X1st_point_of_impact = as.factor(accidents$X1st_point_of_impact)
# accidents$was_vehicle_left_hand_drive. = as.factor(accidents$was_vehicle_left_hand_drive.)
# accidents$journey_purpose_of_driver = as.factor(accidents$journey_purpose_of_driver)
# accidents$sex_of_driver = as.factor(accidents$sex_of_driver)
# accidents$age_band_of_driver = as.factor(accidents$age_band_of_driver)
# accidents$propulsion_code = as.factor(accidents$propulsion_code)
# accidents$driver_home_area_type = as.factor(accidents$driver_home_area_type)
# accidents$day_of_week = as.factor(accidents$day_of_week)
# accidents$X1st_road_class = as.factor(accidents$X1st_road_class)
# accidents$road_type = as.factor(accidents$road_type)
# accidents$junction_detail = as.factor(accidents$junction_detail)
# accidents$junction_control = as.factor(accidents$junction_control)
# accidents$X2nd_road_class = as.factor(accidents$X2nd_road_class)
# accidents$pedestrian_crossing.human_control = as.factor(accidents$pedestrian_crossing.human_control)
# accidents$pedestrian_crossing.physical_facilities = as.factor(accidents$pedestrian_crossing.physical_facilities)
# accidents$light_conditions = as.factor(accidents$light_conditions)
# accidents$weather_conditions = as.factor(accidents$weather_conditions)
# accidents$road_surface_conditions = as.factor(accidents$road_surface_conditions)
# accidents$special_conditions_at_site = as.factor(accidents$special_conditions_at_site)
# accidents$carriageway_hazards = as.factor(accidents$carriageway_hazards)
# accidents$urban_or_rural_area = as.factor(accidents$urban_or_rural_area)

# Convert boolean response variable to logical
# accidents$fatal = as.logical(accidents$fatal)
accidents$fatal = as.integer(accidents$fatal)

# Convert $pedestrian_location and $pedestrian_movement to numerical
accidents$pedestrian_location = as.integer(accidents$pedestrian_location)
accidents$pedestrian_movement = as.integer(accidents$pedestrian_movement)

# Convert time
library(chron)
accidents$time = chron(times=accidents$time)

# Check data again
str(accidents)

# All features are numeric, check for significance of variables and if we can remove any
# Inpect correlations
cor(accidents)
# Fit linear model
lm.fit = lm(fatal ~ ., data = accidents)
summary(lm.fit)
# Remove features with p-value > 0.05
accidents$carriageway_hazards = NULL
accidents$special_conditions_at_site = NULL
accidents$weather_conditions = NULL
accidents$pedestrian_crossing.human_control = NULL
accidents$age_band_of_driver = NULL
accidents$road_type = NULL
accidents$number_of_vehicles = NULL
accidents$driver_home_area_type = NULL
accidents$age_of_vehicle = NULL
accidents$propulsion_code = NULL
accidents$X1st_point_of_impact = NULL
accidents$was_vehicle_left_hand_drive. = NULL
# accidents$hit_object_off_carriageway = NULL
# Refit and check p-values again
lm.fit = lm(fatal ~ ., data = accidents)
summary(lm.fit)
# Remove features with p-value > 0.05
accidents$vehicle_type = NULL
# accidents$towing_and_articulation = NULL
# Check again
lm.fit = lm(fatal ~ ., data = accidents)
summary(lm.fit)
# All features remaining have significant relationship to the response variable fatal

# Perform best subsets selection
library(leaps)
regfit.full = regsubsets(fatal ~ ., accidents, nvmax=25)
reg.summary= summary(regfit.full)
reg.summary$rsq
# Plot RSS
plot(reg.summary$rss, xlab="Number of Variables", ylab="RSS", type="l")
# Plot Adjusted Rsq
plot(reg.summary$adjr2, xlab="Number of Variables", ylab="Adjusted RSq", type="l")
which.max(reg.summary$adjr2)
points(25, reg.summary$adjr2[25], col="red", cex=2, pch=20)
# Plot Cp
plot(reg.summary$cp, xlab="Number of Variables", ylab="Cp", type="l")
which.min(reg.summary$cp)
points(25, reg.summary$cp[25], col="red", cex=2, pch=20)
# Plot BIC
plot(reg.summary$bic, xlab="Number of Variables", ylab="BIC", type="l")
which.min(reg.summary$bic)
points(17, reg.summary$bic[17], col="red", cex=2, pch=20)

plot(regfit.full, scale="r2")
plot(regfit.full, scale="adjr2")
plot(regfit.full, scale="Cp")
plot(regfit.full, scale="bic")

# Make predict function for regsubsets
predict.regsubsets = function(object, newdata, id, ...){
  form = as.formula(object$call[[2]])
  mat = model.matrix(form, newdata)
  coefi = coef(object, id=id)
  xvars = names(coefi)
  mat[,xvars]%*%coefi
}

# Get best model with cross validation approach
set.seed(42)
k=10
folds = sample(1:k, nrow(accidents), replace=TRUE)
cv.errors = matrix(NA, k, 25, dimnames=list(NULL, paste(1:25)))

for(j in 1:k) {
  best.fit = regsubsets(fatal ~ ., data = accidents[folds!=j,], nvmax=25)
  for(i in 1:25) {
    pred = predict(best.fit, accidents[folds==j,], id=i)
    cv.errors[j, i] = mean((accidents$fatal[folds==j]-pred)^2)
  }
}

# Export CSV of prepared data
write.csv(accidents, "prep.csv", row.names = F)

# Export as dataframe that keeps formatting
saveRDS(accidents, file="prep.rds")

# Save history
savehistory()
# Quit
q()
