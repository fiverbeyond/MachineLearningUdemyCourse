# Data Preprocessing Template

# Importing the dataset

dataset = read.csv('Data.csv')

# Take care of missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)


# Encoding categorical data
dataset$Country = factor(dataset$Country, 
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1,2,3)) # The labels we associate with our levels
                         
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))


# Splitting the dataset into the Training set and Test set
#install.packages('caTools') #Commented out as you only need to install it once.
library(caTools)
set.seed(0) # seed used for random sampling
# Note that the SplitRatio value here is for the training set, whereas in Python it is usually the test set
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set =  subset(dataset, split == FALSE)


# Feature Scaling
training_set[, 2:3] = scale(training_set[,2:3])
test_set[, 2:3] = scale(test_set[,2:3])
