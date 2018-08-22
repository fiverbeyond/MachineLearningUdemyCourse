# Data Preprocessing Template

# Importing the dataset

dataset = read.csv('Data.csv')
dataset = dataset[, 2:3]

# Splitting the dataset into the Training set and Test set
install.packages('caTools') #Commented out as you only need to install it once.
library(caTools)
set.seed(0) # seed used for random sampling
# Note that the SplitRatio value here is for the training set, whereas in Python it is usually the test set
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set =  subset(dataset, split == FALSE)


# Feature Scaling
# training_set[, 2:3] = scale(training_set[,2:3])
# test_set[, 2:3] = scale(test_set[,2:3])
