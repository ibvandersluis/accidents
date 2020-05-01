# Analysing UK Accident Data with R

Thousands of people are killed in car accidents every year. Naturally this is something we want to avoid, but in order to do that we need to understand more about what causes fatal car accidents. Unfortunately there’s no way to know how many car accidents almost happened, but out of ones that we know certainly did happen, we can start to examine differences between those that were fatal and those that were not.

The project seeks to analyse UK accident data in an attempt to find factors prior to the crash that could predict whether the accident would end in a fatality or not.

## Data

The dataset used in this project can be found in the [accidents.csv](accidents.csv) file and was downloaded from the Kaggle dataset [Road Accidents Incidence](https://www.kaggle.com/akshay4/road-accidents-incidence#Kaagle_Upload.csv).

This is a large dataset with some 250,000 observations of 70 variables each. The data will require some preparation and reduction. See [data_exploration.md](data_exploration.md) for the details on this.

## Report

This project is documented in a report, laid out in markdown files:

1. [Abstract](report/s0_abstract.md)
2. [Introduction](report/s1_intro.md)
3. [Literature Review](report/s2_lit_review.md)
4. [Data Exploration](report/s3_data_exploration.md)
5. [Methodology](report/s4_experiments.md)
6. [Results](report/s5_results.md)
7. [Discussion](report/s6_discussion.md)
8. [Conclusion](report/s7_conclusion.md)
9. [Future Study](report/s8_future_study.md)

## Resources

For this project I use methods learned from the book [Introduction to Statistical Learning with Applications in R](http://faculty.marshall.usc.edu/gareth-james/ISL/) by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. As I read through the book, I recorded my lab exercises in [this repository](https://github.com/ibvandersluis/islr).

This project was completed using the [R programming language for statistical computing](https://cran.r-project.org/) and the [RStudio IDE](https://rstudio.com/products/rstudio/download/).