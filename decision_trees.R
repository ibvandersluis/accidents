# Decision Trees

# This R script attempts to predict fatalities using a decision tree



# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Load tree library
library(tree)

# Load data
accidents = readRDS("prep.rds")
str(accidents)
attach(accidents)

# Make response variable logical
accidents$fatal = as.factor(accidents$fatal)
str(accidents)

# Turning variables into factors improves test accuracy
accidents$towing_and_articulation = as.factor(accidents$towing_and_articulation)
accidents$vehicle_manoeuvre = as.factor(accidents$vehicle_manoeuvre)
accidents$vehicle_location.restricted_lane = as.factor(accidents$vehicle_location.restricted_lane)
accidents$junction_location = as.factor(accidents$junction_location)
accidents$skidding_and_overturning = as.factor(accidents$skidding_and_overturning)
accidents$hit_object_in_carriageway = as.factor(accidents$hit_object_in_carriageway)
accidents$vehicle_leaving_carriageway = as.factor(accidents$vehicle_leaving_carriageway)
accidents$hit_object_off_carriageway = as.factor(accidents$hit_object_off_carriageway)
accidents$journey_purpose_of_driver = as.factor(accidents$journey_purpose_of_driver)
accidents$sex_of_driver = as.factor(accidents$sex_of_driver)
accidents$day_of_week = as.factor(accidents$day_of_week)
accidents$X1st_road_class = as.factor(accidents$X1st_road_class)
accidents$junction_detail = as.factor(accidents$junction_detail)
accidents$junction_control = as.factor(accidents$junction_control)
accidents$X2nd_road_class = as.factor(accidents$X2nd_road_class)
accidents$pedestrian_crossing.physical_facilities = as.factor(accidents$pedestrian_crossing.physical_facilities)
accidents$light_conditions = as.factor(accidents$light_conditions)
accidents$road_surface_conditions = as.factor(accidents$road_surface_conditions)
accidents$urban_or_rural_area = as.factor(accidents$urban_or_rural_area)
accidents$pedestrian_location = as.factor(accidents$pedestrian_location)
accidents$pedestrian_movement = as.factor(accidents$pedestrian_movement)

# Create test set
# Get random sample to test on
set.seed(42)
testRows = sample(1:nrow(accidents), 0.1*nrow(accidents))
accidents.train = accidents[-testRows,]
accidents.test = accidents[testRows,]
fatal.test = fatal[testRows]

# Fit classification tree
tree.accidents = tree(fatal ~ ., accidents, subset=-testRows, control=tree.control(nobs=91192, mindev=0.0009))
tree.preds = predict(tree.accidents, accidents.test, type="class")
table(tree.preds, fatal.test)
12/(12 + 61)
# Accurately predicted 16.4% of fatal accidents
12/(12 + 19)
# 38.7% of predictions were correct
summary(tree.accidents)
png("tree.png")
plot(tree.accidents)
dev.off()
png("tree_text.png")
plot(tree.accidents)
text(tree.accidents, pretty=0)
dev.off()

# Implement pruning - doesn't work
set.seed(1)
cv.accidents = cv.tree(tree.accidents, FUN=prune.misclass)
names(cv.accidents)
cv.accidents
# Same deviance for the most part
prune.accidents = prune.misclass(tree.accidents, best=80)
tree.preds = predict(prune.accidents, accidents.test, type="class")
table(tree.preds, fatal.test)
# Pruning not successful in improving accuracy

# Try bagging
library(randomForest)
set.seed(1)
bag.accidents = randomForest(fatal ~ ., data=accidents.train, mtry=25, importance=T)
bag.accidents
yhat.bag = predict(bag.accidents, newdata=accidents.test)
table(yhat.bag, fatal.test)
# Successfully predicts 19 accidents
19/73
# Bagging doesn't predict any fatal accidents that turn out not to be fatal,
# but not as good at catching fatal accidents as kNN

# Try random forest
set.seed(1)
rf.accidents = randomForest(fatal ~ ., data=accidents.train, mtry=12, importance=T)
yhat.rf = predict(rf.accidents, newdata=accidents.test)
table(yhat.rf, fatal.test)
# Identical to bagging
importance(rf.accidents)
plot(importance(rf.accidents))
varImpPlot(rf.accidents)

# Save history
savehistory()