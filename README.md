# Analysing UK Accident Data with R

Thousands of people are killed in car accidents every year. Naturally this is something we want to avoid, but in order to do that we need to understand more about what causes fatal car accidents. Unfortunately there’s no way to know how many car accidents almost happened, but out of ones that we know certainly did happen, we can start to examine differences between those that were fatal and those that were not.

The project seeks to analyse UK accident data in an attempt to find factors prior to the crash that could predict whether the accident would end in a fatality or not.

## Data

The dataset used in this project can be found in the [accidents.csv](accidents.csv) file and was downloaded from the Kaggle dataset [Road Accidents Incidence](https://www.kaggle.com/akshay4/road-accidents-incidence#Kaagle_Upload.csv).

This is a large dataset with some 250,000 observations of 70 variables each. The data will require some preparation and reduction. See [s3_data_exploration.md](s3_data_exploration.md) for the details on this.

## Resources

For this project I use methods learned from the book [Introduction to Statistical Learning with Applications in R](http://faculty.marshall.usc.edu/gareth-james/ISL/) by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. As I read through the book, I recorded my lab exercises in [this repository](https://github.com/ibvandersluis/islr).

This project was completed using the [R programming language for statistical computing](https://cran.r-project.org/) and the [RStudio IDE](https://rstudio.com/products/rstudio/download/).