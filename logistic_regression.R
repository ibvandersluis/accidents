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
glm.preds = rep(0,28533)
glm.preds[glm.probs>.006] = 1
table(glm.preds, fatal.test)
