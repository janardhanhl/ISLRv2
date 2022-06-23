#lmdfit
library(MASS)
boston<- read.csv('Boston.csv')
View(boston)
attach(boston)
lm.fit <-lm(medv ~ lstat) # define linear fit x ~y 
lm.fit # fit linear 
names(lm.fit) # different name values of lm.fit
summary(lm.fit)
confint(lm.fit)# confidence interval
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="confidence") # confidance interval
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="prediction") # preiction interval
plot(lstat, medv)#plot medv v/s lstat
abline(lm.fit, lwd=3, col="red")
lstat[10]
plot(lstat, medv, col='red')
plot(lstat, medv, pch=20, col='red')#pch 20 plots the 20th symbol 
plot(lstat, medv, pch='+', col='red')#can give different symbols to pch
plot(1:20, 1:20, pch=1:20)# plots the different symbol code
anova(lm.fit)
plot(lm.fit) #plots fitting results in different plots one after other 
par(mfrow=c(2,2)) #splits the ploting screen into 2x2 panels
plot(lm.fit) #now the 4 plots genereted will be in 2x2 panels
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))#hatvalues() function can be used to compute leverage statistics
which.max(hatvalues(lm.fit))#finding index for hat values maximum

