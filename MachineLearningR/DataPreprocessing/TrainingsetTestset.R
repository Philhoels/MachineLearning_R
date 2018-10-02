# splitting the data into Training set and Test set

#install needed packages
install.packages("caTools")
library(caTools)

# random number generator - set.seed will create the same output
set.seed(123)

# create a sample set of the data
split <- sample.split(dataset$Purchased, SplitRatio = 0.8) 
# Y - the dependent variable is Purchased 
# split ratio based on test set
# creates a vector - TRUE = Training set & FALSE = Test set

# create training set and test set
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

