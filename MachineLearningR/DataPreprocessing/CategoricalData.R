# Categorical Data

# encoding categorical data

# encoding the countries by numbers 
dataset$Country <- factor(dataset$Country,
                          levels = c("France", "Spain", "Germany"), #unique(dataset$Country) - don´t know the order
                          labels = c(1:length(unique(dataset$Country)))) # levels = the names of the countries in the country c

# encoding the purchased by numbers
dataset$Purchased <- factor(dataset$Purchased,
                            levels = c("Yes", "No"),
                            labels = c(0,1))
