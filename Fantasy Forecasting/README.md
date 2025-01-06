## Fantasy Forecasts
=========================

### Executive Summary

Problem Area

Fantasy football has become increasingly popular, engaging millions of participants who aim to build the best teams by carefully selecting NFL players. However, making informed decisions on which players to draft, start, or trade can be challenging due to numerous factors influencing a player's performance, such as previous stats, injuries, weather conditions, and team dynamics. This problem primarily affects fantasy football players, ranging from casual fans to serious league participants, who seek to optimize their rosters for success.

Affected Population

The primary audience impacted by this solution includes fantasy football players who need predictive insights to make strategic roster decisions. Secondary audiences could include sports analysts, fantasy league hosts, and sports betting platforms that benefit from accurate player performance forecasts.

Proposed Data Science Solution

This project proposes a data science solution utilizing machine learning techniques to predict NFL players' fantasy football statistics. By analyzing historical performance data and other contextual factors, the model will generate predictions to aid users in making better roster decisions. This solution leverages predictive modeling to uncover patterns and insights that are difficult for players to discern on their own.

Impact of the Solution

The implementation of this solution will enable fantasy football players to make more informed decisions, ultimately increasing their chances of success in fantasy leagues. Additionally, it could reduce the reliance on expert analyses, empowering users with data-driven insights directly. Beyond individual users, this model may also benefit fantasy sports platforms and betting services by enhancing user engagement and satisfaction.

Dataset Description

The dataset used in this project includes detailed NFL competition and fantasy football data sourced from Kaggle. It contains weekly player statistics, including performance metrics like touchdowns, yards gained, receptions, and points scored. Additionally, contextual variables such as player injuries, weather conditions, and team performance are included to increase the model's predictive accuracy.

### Notebooks

**Exploratory Data Analysis**

Objective:

This notebook focuses on cleaning and analyzing player performance data, identifying trends and relationships, and preparing dataframes segmented by player positions for predictive modeling.

1. Data Ingestion:
Read data from the provided datasource into a working format.

2. Data Cleaning:
Checked for and addressed null values and duplicate entries.
Removed players marked as "Did Not Play" to maintain data relevance.
Fixed inconsistencies for players on bye weeks or listed as free agents.

3. Data Preparation:
Split the cleaned dataset into separate dataframes for Quarterbacks (QBs), Running Backs (RBs), Wide Receivers (WRs), and Tight Ends (TEs) to facilitate position-specific analysis.

4. Exploratory Analysis:
Plotted distributions for key stats (e.g., passing yards, rushing yards) to understand positional performance patterns.
Generated heatmaps to visualize correlations between features (e.g., passing yards, rushing touchdowns) and fantasy point totals.
Created scatter plots to analyze relationships between individual features and total fantasy points.

5. Data Export:
Saved the cleaned and segmented dataframes for use in predictive modeling workflows.

**Baseline Modeling**

Objective: 
This notebook focuses on feature engineering and baseline model implementation to predict fantasy football player performance.

1. Feature Engineering: Computed 5-game rolling averages for key stats (e.g., passing yards, rushing yards, receiving yards) to capture recent performance trends.
Calculated cumulative and average stats for fantasy points, rushing, passing, and receiving metrics up to each week, excluding the current week.

2. Model Development: Implemented baseline regression models, including Linear Regression and Ridge Regression, to predict player fantasy performance.
Used both cumulative season metrics and 5-game rolling averages as predictors to assess their impact on model accuracy.

3. Model Evaluation: Evaluated models using Mean Absolute Error (MAE) and R-squared (R²) metrics to measure predictive power. 
Found that certain positions (e.g., Quarterbacks) achieved better metrics due to the consistent nature of their role and statistical contributions. Leveraged grid search cross-validation to optimize hyperparameters, which significantly improved predictions for all positions.

**Advanced Modeling**

Objective:
This notebook builds upon the baseline models by incorporating traditional Gradient Boosting algorithms to improve predictions of fantasy football player performance. It evaluates model performance while addressing potential overfitting issues.

1. Feature Engineering:
Used the same features developed during baseline modeling, including 5-game rolling averages for key stats and cumulative metrics for fantasy points, rushing, passing, and receiving metrics.
Did not include further feature engineering beyond the baseline approach to maintain a consistent feature set for comparison.

2. Model Development:
Implemented traditional Gradient Boosting regression models to leverage their ability to capture complex patterns in the data.
Compared Gradient Boosting performance to baseline models, using the same predictor variables for consistency.
Built generalized models rather than position-specific ones to focus on overall predictive improvement.

3. Model Optimization and Tuning:
Conducted hyperparameter tuning using Grid Search cross-validation to optimize key parameters such as learning rate, maximum depth, and the number of estimators.
Used early stopping to mitigate overfitting by halting training when validation error stopped improving.

4. Model Evaluation:
Evaluated models using Mean Absolute Error (MAE) and R-squared (R²) metrics.
Observed higher metrics for Gradient Boosting models compared to baseline models but noted signs of overfitting during evaluation.
Residual analysis revealed overfitting patterns, especially for positions with more volatile performance metrics, such as Running Backs and Wide Receivers.

5. Insights and Conclusions:
While Gradient Boosting models demonstrated higher R² and lower MAE compared to baseline models, the improvements were attributed to overfitting rather than genuine predictive accuracy gains.
Concluded that further regularization or simplified models may be required to generalize better to unseen data.
Highlighted the importance of balancing model complexity with interpretability and robustness, emphasizing that advanced models do not always equate to better real-world performance.


**Baseline/Advanced Metric Analysis**

Objective:
This notebook focuses on analyzing and comparing the evaluation metrics from both the baseline and advanced models to understand their performance, limitations, and areas for improvement.

1. Baseline Metrics Analysis:

Reviewed metrics such as Mean Absolute Error (MAE) and R-squared (R²) for the baseline models, including Linear Regression and Ridge Regression.
Observed that baseline models performed consistently across positions with lower variance, such as Quarterbacks, but struggled with positions exhibiting more volatile performance (e.g., Running Backs and Wide Receivers).
Highlighted the limitations of using simpler regression models in capturing non-linear patterns and interaction effects.
Advanced Metrics Analysis:

Compared baseline metrics with those of the advanced Gradient Boosting models, which showed noticeably higher R² and lower MAE.
Identified overfitting as a potential reason for the improved metrics in advanced models, as residual plots and cross-validation errors revealed discrepancies between training and validation performance.
Discussed the trade-off between complexity and generalizability, noting that while Gradient Boosting captured more nuanced patterns, it was prone to overfitting due to its sensitivity to noise in the training data.

#### Repository 

* `data` 
    - contains link to copy of the dataset (stored in a publicly accessible cloud storage)

* `notebooks`
    - contains all final notebooks involved in the project
    - also contains the dataframes used for modeling

* `.gitignore`
    - Part of Git, includes files and folders to be ignored by Git version control
    
* `README.md`
    - Project landing page (this page)

* `LICENSE`
    - Project license

#### Dataset

https://www.kaggle.com/datasets/fishhead/fantasy-football
