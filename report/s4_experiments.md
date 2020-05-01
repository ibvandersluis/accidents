# Experiments

This project will be completed using three methods: multiple logisitic regression, k-nearest neighbours, and decision trees.

In running these experiments, this study hopes to accomplish two things:

1. To produce a model that accurately predicts as many fatal accidents as possible
2. To produce predictions that are worth using

As the goal of this study is applicable to prevent the loss of life, the cost associated with predicting a fatal car accident and having it turn out to be non-fatal is quite trivial compared with the cost of classifying an accident as non-fatal and having it end up being fatal.

At the same time, we cannot meet this requirement by simply predicting every car crash will be fatal, as this is not a useful prediction.

To this end, this study seeks to maximise two quantifiable features:

1. The ratio of fatal accidents successfully predicted to the total number of fatal accidents that were in the test set
2. The ratio of fatal accidents successfully predicted to the total number of fatal predictions made

For the rest of this study, these will be referred to as _detection accuracy_ and _prediction accuracy_ respectively.

This will balance the trade-off between success in detecting fatal crashes and making accurate predictions. As will be seen in the following section, it is easy to detect all fatal crashes (by predicting all crashes will be fatal), and it isn't too much of a challenge to make few fatal predictions and have most of them be correct, but this study seeks to find a balance between the two.

Each of the methods used for this study use a validation set approach to check the accuracy of the respective model. A random sample of the dataset equal to a tenth of the total observations is set aside, and training is performed on the remaining data. Predictions are then made using the test data, then checked for accuracy against the response variable Fatal.

## K-Nearest Neighbours
This method was chosen for its ability to correctly classify observations based on the observations that are closest to it, allowing it to beat other methods such as linear regression if the decision boundary is non-linear.

The experiment was run by loading loading the `class` library. Then the data was loaded into RStudio and scaled, excluding the response variable from scaling. The data was split into training and testing sets, and four kNN models were fit for k values 1, 3, 5, and 7. Testing for higher values of k was not pursued, as a clear trend in decreasing accuracy was observed for prior k values.

## Logistic Regression
This method was chosen for its ability to classify an obseration into one category or another based on the probability that it will be in that category. For this purpose, it is being used to assess the probability that a given car accident will be fatal, and the threshold for classification is adjusted to get the most useful results.

To run this experiment, the data was loaded into RStudio from its RDS file and the seed was set. The dataset was then separated into a training dataset and a test dataset. The model was fit with the training data and the probabilities for the test observations were calculated.

Next, a good discrimination threshold had to be found. Thresholds were tested starting with 50% and retested at increasingly low thresholds until the accelerated rate of incorrect guesses made further testing pointless.

## Decision Trees
This method was chosen for the interpretability of the model to aid in determining which factors seem to be most significant in predicting fatal crashes.

This experiment was run by loading the `tree` library. The dataset was then loaded into RStudio and the response variable Fatal was converted from an integer to a factor in order to grow a classification tree. As converting factored features of the dataset from integers to factors was found to improve the accuracy during both training and testing, this data transformation was also executed. The data was split into training and testing datasets, then a decision tree was fit with the data.

On first attempt the classification tree did not grow, resulting in one terminal node containing all of the training data. After some investigation, it was found that manually decreasing the variance required for a split allowed the tree to grow. This indicates that the variance of the training set was not enough to split the tree under the default settings, perhaps because the response variable being searched for was present in less than 1% of observations.

The tree was grown and predictions were made. Pruning was attempted in order to improve results, but failed due to no difference in any of the variances produced by the `cv.tree()` function, resulting in an inability to select an optimal tree complexity for pruning. Attempting pruning using a variety of random values for complexity did not improve the accuracy of the fit.

Bagging and random forrests were both applied as well.

- Next - [Section 5: Results](s5_results.md)
- Previous - [Section 3: Data Exploration and Processing](s3_data_exploration.md)