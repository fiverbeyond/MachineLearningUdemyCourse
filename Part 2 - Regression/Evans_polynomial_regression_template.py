#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 14 15:39:08 2018

@author: evan
"""

# Data Preprocessing

# Importing the libraries

import numpy
import matplotlib.pyplot as plt
import pandas  #Useful for importing datasets.

# Importing the dataset.

dataset = pandas.read_csv('Position_Salaries.csv')

# Not the notation here: we pick our X as '1:2' rather than '1', even though these grab the same
# data (the end column is exclusive), because using this notation forces X to be treated as
# a matrix (of one column), rather than a vector.
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Fit the  regression model to the dataset


#Compare regressions by visualizing the results.

# An employee is 'level 6.5'. Predict his salary.
# Predict a result given a value using the linear model
y_pred = regressor.predict(6.5)


# Visuallize the regression results
plt.scatter(X, y, color = 'red')
plt.plot(X, regressor.predict(X), color = 'blue')
plt.title('Truth or Bluff (Polynomial Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()


# Visuallize the regression results - Greater resolution
X_grid = np.arrange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid), 1)

plt.scatter(X, y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid), color = 'blue')
plt.title('Truth or Bluff (Polynomial Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()



