#Polynomial Regression 

#importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


#splitting the dataset into traning and testing sets
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = .8)
# training_set = subset(dataset, split == TRUE)
# testing_set = subset(dataset, split == FALSE)

#Fitting a linear regression modelto the dataset to comapre 
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

#Fitting the polynomial regression model to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~.,
              data = dataset)

#summary(poly_reg)

#plotting Linear Regression results 
library(ggplot2)
#plot + actual points + polynomial regression model + title + x label and y label
ggplot() +
  geom_point(aes(x = dataset$Level, y =dataset$Salary ),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Truth or Bluff(Linear Regression)')+
  xlab('Level')+
  ylab('Salary')


#plotting polynomial Regression results 
#plot + actual points + polynomial regression model + title + x label and y label
ggplot() +
  geom_point(aes(x = dataset$Level, y =dataset$Salary ),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Truth or Bluff (Polynomial Regression)')+
  xlab('Level')+
  ylab('Salary')
#summary (poly_reg)


#Predicting a new  result with the created linear regression model
y_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))

#Predicting a new  result with the created polynomial regression model
y_pred = predict(poly_reg, newdata = data.frame(Level = 6.5,
                                                Level2 = 6.5^2,
                                                Level3 = 6.5^3,
                                                Level4 = 6.5^4))
                                              

