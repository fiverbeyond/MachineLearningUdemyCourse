# Data Preprocessing Template

# Importing the dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3] # Second column inclusive.

# Splitting the dataset into the Training set and Test set
# install.packages('caTools') #Commented out as you only need to install it once.

library(caTools)

# Feature Scaling
# training_set[, 2:3] = scale(training_set[,2:3])
# test_set[, 2:3] = scale(test_set[,2:3])
regressor = lm(formula = Salary ~ .,  # Specify the relationship being examined
               data = dataset)                 # The data that will be used for learning.

# Fit polynomial regression model to the dataset.

# Create a new column
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

poly_reg = lm(formula = Salary ~ .,
              data = dataset)


# Visuallize the regressor.
library(ggplot2)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), # show the data as a set of points.
            colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, new_data = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') + 
  xlab('Level') +
  ylab('Salary')

# Predict a value for a particular data point
# Note how, when making the dataframe, we still need to specify a 'Level'  column.
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3,
                                       Level4 = 6.5^4))


