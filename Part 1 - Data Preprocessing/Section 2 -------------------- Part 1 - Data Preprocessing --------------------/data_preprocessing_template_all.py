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

dataset = pandas.read_csv('Data.csv')

X = dataset.iloc[:, :-1].values
Y = dataset.iloc[:, 3].values


# Split the data into training and test sets
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)


# Scale data
"""from sklearn.preprocessing import StandardScaler
scaler_X = StandardScaler()
X_train = scaler_X.fit_transform(X_train)
X_test = scaler_X.transform(X_test)
"""

