# Multiple Logistic Regression

# This R scripit attempts to apply multiple logistic regression to predict fatal accidents



# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Load data
accidents = read.csv("prep.csv")
attach(accidents)
summary(fatal)
table(fatal)

# Create test set
test = 1:1000
train.X = accidents[-test,]
test.X = accidents[test,]
train.Y = fatal[-test]
test.Y = fatal[test]

# Fit multiple logistic regression
glm.fit = glm(fatal ~ ., data = accidents, family = binomial, subset = -test)

# Make predictions
glm.probs = predict(glm.fit, accidents[test,], type = "response")
# Error in model.frame.default