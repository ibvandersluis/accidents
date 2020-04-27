# Multiple Logistic Regression

# This R script attempts to predict fatal accidents using multiple linear regression
# to predict the binary response variable 'fatal'

# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Load data
Data = read.csv("prepv1.csv")
fix(Data)
attach(Data)

cor(Data)
summary(Data)
