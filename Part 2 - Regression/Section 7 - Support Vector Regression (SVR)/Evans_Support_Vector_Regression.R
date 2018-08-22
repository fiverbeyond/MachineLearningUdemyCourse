# Data Preprocessing Template

# Importing the dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3] # Second column inclusive.

# Splitting the dataset into the Training set and Test set
# install.packages('caTools') #Commented out as you only need to install it once.

library(caTools)

# Fit support vector regression model to the dataset.
# Create regressor here. If polynomial, add the polynomial columns to the dataset first.
# install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
              data = dataset,
              type = 'eps-regression')

# Predict a value for a particular data point
# Note how, when making the dataframe, we still need to specify a 'Level'  column.
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visuallize the regressor.
library(ggplot2)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), # show the data as a set of points.
            colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, new_data = dataset)),
            colour = 'blue') +
  ggtitle('Support Vector Regression') + 
  xlab('Level') +
  ylab('Salary')

# Smoother resulotion version.

# define range and increment to produce the sequence.
X_grid = seq(min(dataset$Level), max(dataset$Salary), 0.1)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), # show the data as a set of points.
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, new_data = data.frame(Level = X_grid))),
            colour = 'blue') +
  ggtitle('Support Vector Regression') + 
  xlab('Level') +
  ylab('Salary')

