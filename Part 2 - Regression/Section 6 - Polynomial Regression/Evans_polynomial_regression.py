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


print("Hello World")


# Importing the dataset.

dataset = pandas.read_csv('Position_Salaries.csv')

# Not the notation here: we pick our X as '1:2' rather than '1', even though these grab the same
# data (the end column is exclusive), because using this notation forces X to be treated as
# a matrix (of one column), rather than a vector.
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values


# The library that handles linear regressions automatically handles feature scaling, so we don't need
# to worry about it.
 
# Comparing linear regression to polynomial regression.

from sklearn.linear_model import LinearRegression

linReg = LinearRegression()
linReg.fit(X, y)


from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
X_poly = poly_reg.fit_transform(X)

# Recall that polynomial regression models can still simultaneously be linear
# Linear refers to the coefficients, not the variables
linReg2 = LinearRegression()
linReg2.fit(X_poly, y)

#Compare regressions by visualizing the results.
# Simple linear regression
plt.scatter(X, y, color = 'red')
plt.plot(X, linReg.predict(X), color = 'blue')
plt.title('Truth or Bluff (Simple Linear Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

# Polynomial regression
X_grid = numpy.arange(min(X), max(X), 0.1)
X_gridReshaped = X_grid.reshape(((len(X_grid), 1)))

plt.scatter(X, y, color = 'red')
plt.plot(X_grid, linReg2.predict(poly_reg.fit_transform(X_gridReshaped)), color = 'blue')
plt.title('Truth or Bluff (Polynomial Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()


# An employee is 'level 6.5'. Predict his salary.
# Predict a result given a value using the linear model
linReg.predict(6.5)

# Make the same prediction
linReg2.predict(poly_reg.fit_transform(6.5))



