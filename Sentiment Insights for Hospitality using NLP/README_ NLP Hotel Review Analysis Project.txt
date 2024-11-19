Project Overview
This project analyzes hotel reviews and stay details to identify factors contributing to customer satisfaction. The analysis uses natural language processing (NLP) and machine learning techniques to extract insights from text reviews and numerical features. By exploring customer feedback, this project aims to assist hotel management in improving customer experiences and ratings.

Key Objectives
1. Perform Exploratory Data Analysis (EDA) to clean and understand the dataset.
2. Use NLP techniques to process text reviews and identify sentiment-driven features.
3. Build and evaluate two models:
   * Logistic Regression: Analyze predictive words and derive insights from review text.
   * Decision Tree Classifier with PCA: Optimize feature usage and enhance model performance.
4. Provide actionable recommendations for improving customer satisfaction.

Table of Contents
1. Introduction: Overview and objectives.
2. Data Loading and Exploration:
   * Loading the dataset.
   * Initial exploration and visualizations.
   * Summary statistics.
3. Data Preprocessing:
   * Text cleaning and tokenization.
   * Feature extraction using CountVectorizer.
   * Scaling and standardizing numerical data.
   * Splitting data into training and testing sets.
4. Modeling:
   * Logistic Regression:
      * Train a logistic regression model.
      * Evaluate performance (accuracy, precision, recall, F1 score).
      * Extract top positive and negative words from reviews.
   * Decision Tree with PCA:
      * Set up a pipeline with PCA for dimensionality reduction.
      * Perform hyperparameter tuning with grid search.
      * Evaluate cross-validation and test scores.
5. Model Evaluation:
   * Analyze confusion matrix, ROC curve, and AUC score.
   * Assess precision, recall, and F1 score.
6. Conclusion and Recommendations:
   * Summarize findings.
   * Suggest improvements for hotel management.

Dataset Description
* The dataset contains hotel reviews, reviewer scores, and stay-related features.
* Text columns include positive and negative reviews, while numerical columns include reviewer scores and stay details.
Methodology

Data Preprocessing
* Cleaned and tokenized text data using CountVectorizer.
* Scaled numerical features with StandardScaler for consistency.
* Created training and testing sets for modeling.

Modeling
1. Logistic Regression:
   * Used vectorized review text as features.
   * Extracted the top 20 predictive words influencing customer ratings.
2. Decision Tree with PCA:
   * Integrated dimensionality reduction to optimize feature usage.
   * Tuned hyperparameters using grid search and cross-validation.

Evaluation Metrics
* Accuracy, precision, recall, F1 score, confusion matrix, ROC curve, and AUC score.

Insights and Recommendations
1. Top Predictive Words:
   * Positive words: "friendly," "clean," "comfortable."
   * Negative words: "dirty," "noisy," "rude."
2. Improving Customer Satisfaction:
   * Address common complaints related to noise and cleanliness.
   * Focus on enhancing service friendliness and comfort.
3. Actionable Metrics:
   * Decision tree analysis highlights key numerical and categorical features affecting customer ratings.
   * PCA ensures efficient feature utilization, especially for large datasets.

Tools and Libraries
* Python libraries: pandas, numpy, sklearn, matplotlib, seaborn.
* NLP tools: CountVectorizer, TfidfVectorizer.
* Machine learning algorithms: Logistic Regression, Decision Tree Classifier.