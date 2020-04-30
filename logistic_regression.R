# Multiple Logistic Regression

# This R script attempts to predict fatal accidents using multiple linear regression
# to predict the binary response variable 'fatal'

# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Load data
accidents = readRDS("prep.rds")
attach(accidents)
summary(accidents)

# Create test set
# Get random sample to test on
set.seed(42)
testRows = sample(1:nrow(accidents), 0.1*nrow(accidents))
accidents.train = accidents[-testRows,]
accidents.test = accidents[testRows,]
fatal.test = fatal[testRows]

# Fit logistic regression model
glm.fit = glm(fatal ~ ., data=accidents, family=binomial, subset=-testRows)
glm.probs = predict(glm.fit, accidents.test, type="response")
# Try with threshold = 0.5
glm.preds = rep(0,10132)
glm.preds[glm.probs>.5] = 1
table(glm.preds, fatal.test)
# No fatal crashes predicted

# Try with threshold = 0.3
glm.preds = rep(0,10132)
glm.preds[glm.probs>.3] = 1
table(glm.preds, fatal.test)
# 1 fatality predicted, and it was wrong

# Try with threshold = 0.2
glm.preds = rep(0,10132)
glm.preds[glm.probs>.2] = 1
table(glm.preds, fatal.test)
# 8 predicted, 1 was correct

# Try with threshold = 0.1
glm.preds = rep(0,10132)
glm.preds[glm.probs>.1] = 1
table(glm.preds, fatal.test)
# 30 predicted, 2 correct

# Try with threshold = 0.05
glm.preds = rep(0,10132)
glm.preds[glm.probs>.05] = 1
table(glm.preds, fatal.test)
# We successfully predict 10 of 71 fatal accidents

# Try with threshold = 0.04
glm.preds = rep(0,10132)
glm.preds[glm.probs>.04] = 1
table(glm.preds, fatal.test)
# We successfully predict 14 of 71 fatal accidents

# Try with threshold = 0.03
glm.preds = rep(0,10132)
glm.preds[glm.probs>.03] = 1
table(glm.preds, fatal.test)
# We successfully predict 20 of 71 fatal accidents

# Try with threshold = 0.02
glm.preds = rep(0,10132)
glm.preds[glm.probs>.02] = 1
table(glm.preds, fatal.test)
# We successfully predict 30 of 71 fatal accidents
# With a lot of incorrect predictions as well...
# Predict 695, of which 30 are correct
30/(30 + 665)
# Our predictions are only 4.3% accurate
# Which is better than guessing, but not great
# kNN was able to predict nearly as many fatal accidents with much better accuracy

# Try with threshold = 0.01
glm.preds = rep(0,10132)
glm.preds[glm.probs>.01] = 1
table(glm.preds, fatal.test)
41/(1794 + 41)
# We catch 41 of 71 fatal accidents, but misclassify many
# 2.2% prediction accuracy, getting worse

# Try with threshold = 0.009
glm.preds = rep(0,10132)
glm.preds[glm.probs>.009] = 1
table(glm.preds, fatal.test)
44/(44 + 2053)
# 2% accuracy

# Try with threshold = 0.007
glm.preds = rep(0,10132)
glm.preds[glm.probs>.007] = 1
table(glm.preds, fatal.test)

# kNN was a better model
# It caught a reasonable number of fatal accidents,
# and its predictions were more meaningful

# Save history
savehistory()
