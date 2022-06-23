#multiple linear regression can use lm() fiunction
#syntax lm(y~x1+x2+x3)
library(MASS) # has various data sets 
boston<-read.csv("boston.csv") 
boston<-boston[-1]
attach(boston)
lm.fit<-lm(medv~lstat+age)
summary(lm.fit)
anova(lm.fit)
summary(lm.fit)$sigma #RSE
summary(lm.fit)$r.sq #R2
par(mfrow=c(2,2))
plot(lm.fit) # plots
library(car)#library car data. 
vif(lm.fit) #computes variance inflation factors.

lm.fit<-lm(medv ~ ., data=boston ) # if we want to use all the data (predictors) for
# fitting dot operator can be used.
summary(lm.fit)
par(mfrow=c(2,2))
plot(lm.fit)
summary(lm.fit)
vif(lm.fit) #computes variance inflation factors.

lm.fit <- lm(medv ~. -age, data = boston)# use -ve sign infront of predector 
summary(lm.fit)
par(mfrow=c(2,2))
plot(lm.fit)
lm.fit <- lm(medv ~. , data = boston)
library(car)
vif(lm.fit)
lm.fit1 <- update(lm.fit, ~ . -age, data=boston)
summary(lm.fit)
summary(lm.fit1)
# interaction terms in linear model
lm.fit2<-lm(medv ~ lstat + age + lstat:age, data=boston) #lstat:age tells R to include an
#interaction term between lstat and age.
summary(lm.fit2)
lm.fit2<-lm(medv ~ lstat*age, data=boston) #lstat*age is the short hand representation of previous caculation
summary(lm.fit2)
# non linear transformation of linear regression
lm.fit3<- lm(medv~lstat+I(lstat^2), data=boston) # predictor lstat^2 is created with the wraper I()
summary(lm.fit3)
par(mfrow=c(2,2))
plot(lm.fit3)
linear.fit<-lm(medv ~lstat, data=boston)#linear fit
anova(linear.fit, lm.fit3)
cubic.fit<-lm(medv~ lstat+ I(lstat^2), I(lstat^3), data=boston)#cubic fit by including I(lstat^3)
summary(cubic.fit)
par(mfrow=c(2,2))
plot(cubic.fit)
polyn.fith<-lm(medv ~ poly(lstat, 5), data=boston) # plolynomial fit fifth order 
summary(polyn.fith)
par(mfrow=c(2,2))
plot(polyn.fith)
polyn.fith<-lm(medv ~ poly(lstat, 5, raw=TRUE), data=boston) # to obtain raw polynomials
summary(polyn.fith)
par(mfrow=c(2,2))
plot(polyn.fith)
polyn.log<-lm(medv~ log(lstat), data=boston) # log polymonial 
summary(polyn.log)
par(mfrow=c(2,2))
plot(polyn.log)
