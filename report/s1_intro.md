# Introduction

Car accidents cause many human deaths every year. Of fatal accidents, human error is responsible for 94% of them. In the future this situation could be improved through the use of autonomous vehicles, but whether for the purposes of teaching a computer to drive safely or simply for improving road safety for human drivers, it is important to understand which car accidents will result in the loss of life and which ones will not.

This is more challenging than it sounds: fatal car accidents account for a tiny percentage of observations of the dataset in which they are found. In the case of this study, just 0.77% of the observations are involved in a fatal accident. In other words, simply by predicting that all accidents will be non-fatal, we would be right nearly every time. However, this would be less than useful in predicting or preventing deaths on the road.

This study aims to use a dataset of UK car accidents to train a supervised learning model to detect fatal accidents. The base level of success is to achieve results that are better than just guessing, though beyond that we want to find a model that accurately detects as many fatal crashes as possible while keeping the ratio or correct predictions to total predictions as high as possible.

The rest of this study is structured as follows: Section 2 provides a brief review of the literature for other studies that have applied machine learning techniques to car accident data. Section 3 documents the data exploration and processing for this study. Section 4 describes the experiements that were performed, and Section 5 describes the results that were obtained from these experiments. Sections 6 provides a discussion of the results. Finally, Section 7 concludes the study and Section 8 identifies points for future study.

Next - [Section 2: Literature Review](s2_lit_review.md)  
Previous - [Abstract](s0_abstract.md)