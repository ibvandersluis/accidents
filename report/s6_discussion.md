# Discussion

In this study there is a tradeoff between detection accuracy and prediction accuracy, and no point of compromise is right or wrong by necessity.

K-Nearest Neighbours seems to offer a fairly balanced solution, with similar detection and prediction accuracy ratios.

Logistic regression offers similar detection accuracy compared with kNN, but much worse prediction accuracy. The model can be pushed by lowering the threshold further, but to the continuing detrement of its prediction accuracy.

A single decision tree can give decent prediction accuracy, but inferior detection accuracy compared with the other two models. However, when extended using bagging or random forests, these models improve both the prediction accuracy and the detection accuracy.

| Model               | Prediction | Detection |
| ------------------- | ---------- | --------- |
| kNN, k=1            | 34.2%      | 32.8%     |
| Logistic Regression | 4.3%       | 41.1%     |
| Classification Tree | 38.7%      | 16.4%     |
| Bagging/RF          | 100%       | 26.0%     |

This table indicates that the most balanced models, and therefore the most useful, are a kNN model with k=1 and classification tree with bagging or a random forest.

Next - [Section 7: Conclusion](s7_conclusion.md)  
Previous - [Section 5: Results](s5_results.md)