# Polynomial Regression

# set working directory 
setwd("~/Documents/GitHub/MachineLearning_R/MachineLearningR/Regression/Polynomial Regression")

# Import data set
dataset = read.csv("Position_salaries.csv")
dataset = dataset[2:3] # don´t need the categorical variable "position" - encoded to the level

# Split into training and test set
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary , SplitRatio = 0.7) # vector - dependent variable
# training_set = subset(dataset, split = TRUE)
# test_set = subset(dataset, split = FALSE)
# ------------ the dataset is so small, don´t gonna split


# fitting linear regression to dataset
lin_reg = lm(Salary ~ Level,
             data = dataset)
summary(lin_reg)



# fitting polynomial regression to dataset
dataset["Level2"] = dataset$Level^2
dataset["Level3"] = dataset$Level^3
poly_reg = lm(Salary ~ .,
              data = dataset)
summary(poly_reg)

# Visualizing the linear regression model
library(ggplot2)
ggplot(dataset) + geom_point(aes(x = dataset$Level, y = dataset$Salary),
                             colour = "blue") +
                  geom_line(aes(x = dataset$Level, y =predict(lin_reg, dataset)),
                            colour = "red") + 
                  xlab("Level") + ylab("Salary") + 
                  ggtitle("linear regression model") 


# Visualizing the polynomial regression model
ggplot(dataset) + geom_point(aes(x = dataset$Level, y = dataset$Salary),
                             colour = "blue") +
                  geom_path(aes(x = dataset$Level, y =predict(poly_reg, dataset)),
                  colour = "red") + 
                  xlab("Level") + ylab("Salary") + 
                  ggtitle("polynomial regression model")

# Visualizing both models together
ggplot(dataset) + geom_point(aes(x = dataset$Level, y = dataset$Salary),
                             colour = "blue") +
                  geom_line(aes(x = dataset$Level, y =predict(lin_reg, dataset)),
                  colour = "red") + 
                  xlab("Level") + ylab("Salary") + 
                  ggtitle("linear regression model & polynomial regression model") +
                  geom_path(aes(x = dataset$Level, y =predict(poly_reg, dataset)),
                  colour = "green")

# Predict result with linear regression
y_pred_lin  = predict(lin_reg, data.frame(Level = 6.5))

# Predict result with polynomial regression
y_pred_poly  = predict(poly_reg, data.frame(Level = 6.5, 
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3))
