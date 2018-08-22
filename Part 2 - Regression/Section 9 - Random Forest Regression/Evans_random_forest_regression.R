# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3] # Second column inclusive.

#install.packages('randomForest') #Commented out as you only need to install it once.
library(randomForest)
set.seed(1234)

# A random forest creates several decision trees, and then averages their results for a final answer.
# Fit random forest regression model to the dataset.
regressor = randomForest(x = dataset[1],  # Note in the description for this object, x is a dataframe...
                         y = dataset$Salary, #... but Y is a vector. Why? I don't know.
                         ntree = 500) # Number of trees in the forest.

# Predict a value for a particular data point
# Note how, when making the dataframe, we still need to specify a 'Level'  column.
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visuallize the regressor.
library(ggplot2)

# We'll use the higher-resolution display, since this is a non-contiguous model.
# define range and increment to produce the sequence.
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), # show the data as a set of points.
             colour = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
            colour = 'blue') +
  ggtitle('Polynomial Regression') + 
  xlab('Level') +
  ylab('Salary')

