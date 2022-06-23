#carsears data analysis, data part of ISLR2 library
# predict the sales of child seat sales in 400 locations
carseats<-read.csv("carseats.csv")
head(carseats)
View(carseats)
linear.fit<-lm(Sales ~. + Income:Advertising + Price:Age, data=carseats)#linear fitting all varaiables with considering interraction terms
summary(linear.fit)
attach(carseats)
contrasts(ShelveLoc)
#shelving locations conditions are given in the data set. 
#R has created dymmy variables to quantify the qualitative predictors.
par(mfrow=c(2,2))
plot(linear.fit)
confint(linear.fit, level = 0.95)
