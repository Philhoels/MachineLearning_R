# Multiple linear regression

# set working directory
setwd("~/Documents/GitHub/MachineLearning_R/MachineLearningR/Regression/Multiple Lineare Regression")

# Lead the data set 
dataset = read.csv("50_Startups.csv")

# encoding categorical data
unique(dataset$State) #check the categories 
dataset$State <- factor(dataset$State,
                        levels = c("New York", "California", "Florida"), #unique(dataset$State) 
                        labels = c(1:length(unique(dataset$State)))) # levels = the names of the states in numbers



# split the data set into training and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8) # dependent variable
test_set = subset(dataset, split == FALSE)
training_set = subset(dataset, split == TRUE)

# Fittig Multiple Linear Regression to the Training set
# regressor = lm(data = training_set,
#                formula = training_set$Profit ~ 
#                  training_set$R.D.Spend + 
#                  training_set$Administration +
#                  training_set$Marketing.Spend + 
#                  training_set$State)

regressor = lm(formula = training_set$Profit ~ .,
               data = training_set) # . symbole for implement all variables

regressor_info = summary(regressor)
# most important - p value and significance level

# Prediction the Test set result
y_pred = predict(regressor, test_set)
y_pred
test_set$Profit

result = y_pred - test_set$Profit # vector of the differences

# Building the optimal model using Backward Elimination
# step by step
# Step 1
regressor = lm(data = training_set,
               formula = training_set$Profit ~
                 training_set$R.D.Spend +
                 training_set$Administration +
                 training_set$Marketing.Spend +
                 training_set$State)
summary(regressor)
# remove State

# Step 2
regressor = lm(data = training_set,
               formula = training_set$Profit ~
                 training_set$R.D.Spend +
                 training_set$Administration +
                 training_set$Marketing.Spend)
summary(regressor)
# remove Administration

# Step 3
regressor = lm(data = training_set,
               formula = training_set$Profit ~
                 training_set$R.D.Spend +
                 training_set$Marketing.Spend)
summary(regressor)
# should remove Marketing.Spend

# Using the function step() to do all the steps on one
step(regressor, direction = "backward", trace = FALSE)


# Automatic Backward Elemenation 
# Code Hadelin
# backwardElimination <- function(x, sl) {
#   numVars = length(x)
#   for (i in c(1:numVars)){
#     regressor = lm(formula = Profit ~ ., data = x)
#     maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
#     if (maxVar > sl){
#       j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
#       x = x[, -j]
#     }
#     numVars = numVars - 1
#   }
#   return(summary(regressor))
# }
# 
# SL = 0.05
# dataset = dataset[, c(1,2,3,4,5)]
# backwardElimination(training_set, SL)
