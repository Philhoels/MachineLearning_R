# Feature scalling

# --- example 
# take the values of row 2 and 8, look at the value of age and salary
dataset[2,]
dataset[8,]
age1 <- dataset[2,"Age"]
age2 <- dataset[8,"Age"]
salary1 <- dataset[2,"Salary"]
salary2 <- dataset[8,"Salary"]

# the euclidean discatnce of the values 
age_distance <- (age2 - age1)^2
salary_distance <- (salary2 - salary1)^2
print(age_distance)
print(salary_distance)

# --> we see the salary distance is way bigger - the salary distance dominates 
# --- example is over

# error message
# training_set <- scale(training_set) - "Country" & "Purchased" is a factor
training_set[,2:3] <- scale(training_set[,2:3])
test_set[,2:3] <- scale(test_set[,2:3])



