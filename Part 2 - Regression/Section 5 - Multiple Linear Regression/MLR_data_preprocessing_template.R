#multiple Linear Regression 


#importing the dataset 
dataset = read.csv('50_Startups.csv')


#Encode categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York','California','Florida'),
                       labels = c(1,2,3))


#splitting the dataset into training and testing set 
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#Feature scaling not manually needed to be done


#building optimal model using backward elimination 
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor)


#predicting the test set results 
y_pred = predict(regressor, newdata = test_set)

