# Results

## K-Nearest Neighbours

Fitting the kNN model with k=1 accurately predicts 24 of 73 fatal crashes, giving us a detection accuracy of 32.8%. The prediction accuracy for the model is 34.2%.

As k is increased to 3, 5, and 7, a trend becomes clear: the model classifies fewer observations as fatal, resulting in a drop in detection accuracy and a simultaneous increase in prediction accuracy.

For instance, with k=7, the model predicts that only 7 accidents will be fatal, of which 3 actually were. This gives us a relatively improved prediction accuracy of 42.8% but an abysmal detection accuracy of 4.1%.

Overall, the kNN model with k=1 offered the highest detection accuracy with acceptable prediction accuracy.

## Logistic Regression

The first threshold attempted was 50%, which resulted in 0 predicted fatal accidents. Dropping the threshold to 30% yielded one predicted fatal accident, which was wrong. Continuing to 10%, the model still only predicted 9 fatal accidents, only one of which was correct.

At a 5% threshold, the number of correct fatal accident predictions increases to 10, but the number of incorrect fatal accident predictions is increasing faster.

With a threshold of 4%, the correct predictions increase by 4 while the incorrect predictions increase by nearly 100. This trend continues.

In order to catch more accidents than the kNN model, we find that with a threshold of 2% we accurately detect 30 out of 73 fatal accidents, giving us a detection accuracy of 41.1%. However, the model predicted that a total of 695 accidents would be fatal, with only 30 that actually were. This gives a prediction accuracy of just 4.3%, which leaves something to be desired.

## Decision Trees

Because the classification tree would not grow using the default deviance sensitivity, it had to be adjusted to find the bost setting. Trying various sensitivity settings yielded that the best results were optained with a sensitivity of 0.0009.

For 73 fatal accidents in the test set, the model accurately detected only 12 of them, or 16.4%. However, the model only predicted that 31 accidents would be fatal, which means that its prediction accuracy was 38.7%.

Bagging offered improved results, successfully detecting 19 fatal accidents, or 26%. No accident that the model predicted would be fatal ended up being non-fatal, giving it 100% prediction accuracy.

A random forest was made with `mtry=12`, half that of bagging. The prediction results were identical to the ones obtained from bagging. Attempts at fitting a random forest with different mtry values were not made due to the slow hardware available for the experiment.

- Next - [Section 6: Discussion](s6_discussion.md)
- Previous - [Section 4: Experiments](s4_experiments.md)