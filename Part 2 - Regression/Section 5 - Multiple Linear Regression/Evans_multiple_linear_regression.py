# Data Preprocessing Template

# Importing the libraries
import numpy 
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('50_Startups.csv')
X = dataset.iloc[:, :-1].values
Y = dataset.iloc[:, 4].values




# Encoding categorical data
# Encoding the Independent Variable
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:, 3] = labelencoder_X.fit_transform(X[:, 3])
onehotencoder = OneHotEncoder(categorical_features = [3])
X = onehotencoder.fit_transform(X).toarray()



# Avoid the dummy variable trap
# Not necessary for this python library, just a useful practice line.
X = X[:,1:]

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)

# Feature Scaling for Multiple Linear Regression is handled by the python library.


# Fit our Multiple Linear Regression to our training set.

from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, Y_train)

Y_pred = regressor.predict(X_test)


#Use Backward Elimination to build an optimal model.

import statsmodels.formula.api as sm
# We need to add a column of ones, as this library otherwise doesn't take into account
# a constant term in the multiple linear regression.

X = numpy.append( arr = numpy.ones(shape=(50,1)).astype(int), values = X, axis = 1)

X_opt = X[:, [0, 1, 2, 3, 4, 5]]

regressor_OLS =  sm.OLS(endog = Y, exog = X_opt).fit()

regressor_OLS.summary()


X_opt = X[:, [0, 3]]

regressor_OLS =  sm.OLS(endog = Y, exog = X_opt).fit()

regressor_OLS.summary()


