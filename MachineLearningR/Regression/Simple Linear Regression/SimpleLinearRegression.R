# Simple linear regression

# set working directory 
setwd("~/Documents/GitHub/MachineLearning_R/MachineLearningR/Regression/Simple Linear Regression")

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling - don´t need to take care of, slr package takes care of this 

# Fitting Simple Linear Regression to the training set
regressor <- lm(formula = Salary ~ YearsExperience, 
                data = training_set) 
summary(regressor)
### outout - *** highly statistical significant
### output - p value - indicator of statistical significant (lower - more significant)
### stress level of p value - under 5%, high significant - over 5%, less significant

# predict the test set result
y_pred <- predict(regressor, test_set)

# Visulasing the training set result
library(ggplot2)

# Training set
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = "red") + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, training_set)),
            color = "blue") +
  ggtitle("Salary vs experience (Training set)") +
  xlab("Years of experience") +
  ylab("Salary")


# Visulasing the test set result
# Test set
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = "red") + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, training_set)),
            color = "blue") +
  ggtitle("Salary vs experience (Test set)") +
  xlab("Years of experience") +
  ylab("Salary")


