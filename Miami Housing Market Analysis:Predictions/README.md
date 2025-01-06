# **Miami Market Insights: Predicting Housing Prices with Machine Learning**

**Overview**
- 

This project analyzes the Miami housing market to predict property sale prices using machine learning models. By leveraging exploratory data analysis (EDA) and predictive modeling, the project identifies key factors influencing housing prices and develops a robust framework to estimate property values. The models include linear regression as a baseline and XGBoost as an advanced model to handle non-linear relationships and complex feature interactions.

Note: A Tableau story is being developed to visually showcase key insights and findings. This is currently a work in progress and will be updated soon.

**Goals**
- 

Analyze the Miami housing market to uncover patterns and relationships in the data.
Develop a machine learning framework to predict property sale prices.
Provide actionable insights for real estate professionals, developers, and policymakers.


**Business Implications**
- 

**Accurate predictions of housing prices have significant real-world applications:**

Real Estate Professionals: Optimize pricing strategies and identify undervalued or overvalued properties.

Developers: Understand market trends to guide investment and construction decisions.

Buyers and Sellers: Gain clarity on fair property valuations to facilitate informed transactions.

Policymakers: Leverage insights for urban planning and resource allocation.

**Dataset**
- 

The dataset contains 13,932 rows and 20 features, including:

Target Variable: SALE_PRC (property sale price).

Key Predictors: TOT_LVG_AREA (total living area), LND_SQFOOT (land area), CNTR_DIST (distance to city center), and structure_quality.

Geographic Features: Latitude, longitude, and distances to railways, water bodies, and highways.

Temporal Feature: month_sold.


**Methods**
- 

**Exploratory Data Analysis (EDA):**

Examined feature distributions, correlations, and outliers.
Created new features like Suburban (urban vs. suburban classification) and Land_Utilization (land area utilization).

**Feature Engineering:**

K-means clustering to group neighborhoods (10 clusters).

Addressed multicollinearity through feature selection and dimensionality reduction using PCA.

**Modeling:**

Baseline Model: Linear regression (R² = 0.72, MAE = ~$110,000).

Advanced Model: XGBoost (R² = 0.91, MAE = ~$47,000), which significantly improved prediction accuracy.

**Residual Analysis:**

Evaluated model performance across different price ranges, noting stronger performance for lower prices but residual variance for higher prices.

**Limitations:**

Hyperparameter tuning and grid search cross-validation were not conducted due to computational constraints (excessive runtime on available hardware).

**Results**
- 

Linear Regression: Established baseline performance but struggled with non-linear relationships.

R²: ~0.72
MAE: ~$109,610

XGBoost: Captured complex feature interactions, reduced prediction errors, and improved performance significantly.

R²: ~0.91
MAE: ~$47,000

The advanced model performed well across most price ranges, though it did not perform as well with higher-priced properties.

**Future Work**
- 
Explore cloud-based resources to enable hyperparameter tuning and grid search for advanced modeling.
Incorporate additional location-specific features (e.g., proximity to schools or amenities) to improve high-price property predictions.
Investigate alternative advanced models such as Random Forests or Neural Networks for further performance gains.

**Technologies Used**

Programming Language: Python

Libraries: pandas, numpy, matplotlib, seaborn, scikit-learn, XGBoost

Machine Learning Techniques:

Linear Regression
Gradient Boosting (XGBoost)
Principal Component Analysis (PCA)
K-means Clustering

**Conclusion**
- 
This project demonstrates the power of machine learning in analyzing complex markets like real estate. By combining EDA, feature engineering, and advanced modeling, it provides valuable insights into the Miami housing market while highlighting opportunities for further optimization. The XGBoost model stands out for its ability to handle non-linear relationships, delivering highly accurate predictions and actionable results.

