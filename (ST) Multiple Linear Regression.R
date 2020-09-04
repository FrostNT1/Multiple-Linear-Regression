#  setwd("D:/Code/ML_AI_Course/Machine Learning A-Z New/Part 2 - Regression/Section 5 - Multiple Linear Regression")

data = read.csv("50_Startups.csv")

# Encoding categorical data
data$State = factor(data$State,
                    levels = c('New York', "California", "Florida"),
                    labels =c(1,2,3))

# splititng the data
library(caTools)
set.seed(123)
split = sample.split(data$Profit, SplitRatio = 0.8)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)

# fitting multiple linear regression to training set
# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)

regressor = lm(formula = Profit ~ .,
               data = training_set)

summary(regressor)

# predicting the test results
y_pred = predict(regressor, newdata = test_set)


# using backward elemination

regressor = lm(formula = Profit ~ .,
               data = data)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = data)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = data)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = data)
summary(regressor)

y_bck_elem_pred = predict(regressor, newdata = test_set)