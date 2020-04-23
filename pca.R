# Principal Components Analysis

# This R script performs PCA on the accidents dataset



# Load history
loadhistory()
# Clear workspace
rm(list=ls())

# Import data
accidents = read.csv("prep.csv")

# Get column names
names(accidents)

# Get averages
apply(accidents, 2, mean)
# Returns NA for all

# Get variances
apply(accidents, 2, var)

# Perform PCA
pr.out = prcomp(accidents, scale = T)
# Error, x must be numeric