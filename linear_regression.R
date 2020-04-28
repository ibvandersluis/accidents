# Multiple Logistic Regression

# This R scripit attempts to apply multiple logistic regression to predict fatal accidents



# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Load data
accidents = readRDS("prep.rds")
attach(accidents)
summary(fatal)
table(fatal)
str(accidents)

# Create test set
# Get random sample to test on
set.seed(42)
testRows = sample(1:nrow(accidents), 0.1*nrow(accidents))
train = accidents[-testRows,]
test = accidents[testRows,]

# Fit multiple logistic regression
lm.fit = lm(fatal ~ ., data = train)
summary(lm.fit)
lm.preds = predict(lm.fit, test)
results = data.frame(cbind(actuals=test, predicteds=lm.preds))
table(results)
cor(results)

# Something went wrong