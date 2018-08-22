# Data Preprocessing Template

# Importing the dataset

dataset = read.csv('50_Startups.csv')


# Feature Scaling
# training_set[, 2:3] = scale(training_set[,2:3])
# test_set[, 2:3] = scale(test_set[,2:3])

# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('California', 'New York', 'Florida'),
                         labels = c(1, 2, 3))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools') #Commented out as you only need to install it once.
library(caTools)
set.seed(0) # seed used for random sampling
# Note that the SplitRatio value here is for the training set, whereas in Python it is usually the test set
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set =  subset(dataset, split == FALSE)

# Fit the Multiple Linear Regression to the data.

# In R, the single '.' represents " all the other variables".
regressor = lm(formula = Profit ~ ., 
               data = training_set)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration, 
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend, 
               data = dataset)
summary(regressor)
