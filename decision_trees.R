# Decision Trees

# This R script attempts to predict fatalities using a decision tree



# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Load tree library
library(tree)

# Load data
accidents = read.csv("prep.csv")
attach(accidents)

# Fit classification tree
tree.accidents = tree(fatal ~ ., data = accidents)
# Error: factor predictors must have at most 32 levels
str(accidents)
# Time is considered a factor, which is a big problem