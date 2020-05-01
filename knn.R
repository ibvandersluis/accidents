# K-Nearest Neighbours

# Attempt at using kNN approach to predict fatal car accidents



# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Load library
library(class)

# Load data
accidents = readRDS("prep.rds")
summary(accidents)
attach(accidents)
# Scale the data except for the qualitative response variable
scaled = scale(accidents[, -26])
var(accidents[,1])
var(accidents[,2])
var(scaled[,1])
var(scaled[,2])
fix(scaled)

# Create test set
# Get random sample to test on
set.seed(42)
testRows = sample(1:nrow(accidents), 0.1*nrow(accidents))
train.X = scaled[-testRows,]
test.X = scaled[testRows,]
train.Y = fatal[-testRows]
test.Y = fatal[testRows]

# Fit kNN model with k=1
knn.pred = knn(train.X, test.X, train.Y, k=1)
mean(test.Y != knn.pred)
# Error rate is 0.9%
mean(test.Y != 0)
# Fatal crash rate is 0.7%
# We want to predict fatal crashes
# Our only concern is the ratio of total fatal crashes
# Compared to the fatal crashes we predicted correctly
table(knn.pred, test.Y)
24/(24 + 49)
# We predicted 32.8% of fatal crashes
24/(24 + 46)
# Our predictions for fatal crashes were 34.2% accurate
# Considering fatal crashes happen less than 1% of the time,
# K=1 gives us a significantly better result compared with just guessing

# Refit with k=3
knn.pred = knn(train.X, test.X, train.Y, k=3)
mean(test.Y != knn.pred)
# Lower test error than k=1
mean(test.Y != 0)
table(knn.pred, test.Y)
12/(12 + 61)
# Predicted 16.4% of fatal crashes... much worse than k=1
# BUT the ratio is worse, so k=1 is better for our purposes

# Refit with k=5
knn.pred = knn(train.X, test.X, train.Y, k=5)
mean(test.Y != knn.pred)
# Incredibly low test error, probably means it barely predicted any crashes
mean(test.Y != 0)
table(knn.pred, test.Y)
6/(6 + 67)
# Our accuracy is amazing-ish, but we only predict 8.2% of fatal crashes. 

# Refit with k=7
knn.pred = knn(train.X, test.X, train.Y, k=7)
mean(test.Y != knn.pred)
# Test error almost as low as the occurance rate of fatal crashes
mean(test.Y != 0)
table(knn.pred, test.Y)
3/(3 + 70)
# We predict 4.1% of fatal crashes
3/7
# Our predictions are 42.8 % accurate
# Our predictions become less meaningful. Our best fit is k=1.

# Save history
savehistory()
