#This problem focuses on collinearity problem
set.seed(1)#set random seed
x1<-runif(100)
x2<-0.5*x1+rnorm(100)/10
y<- 2+2 * x1 + 0.3 *x2+rnorm(100)
linear.fit<-lm(y ~ x1 + x2)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)
linear.fit<-lm(y ~ x1 + x2+x1:x2)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)
plot(x2,y)
plot(x1,y)
plot(x1,x2)
linear.fit<-lm(y ~ x1)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)
linear.fit<-lm(y ~ x2)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)

x1<-c(x1,0.1)
x2<-c(x2,0.8)
y<-c(y,6)

linear.fit<-lm(y ~ x1 + x2)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)

linear.fit<-lm(y ~ x1 + x2+x1:x2)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)

linear.fit<-lm(y ~ x1)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)

linear.fit<-lm(y ~ x2)
par(mfrow=c(2,2))
plot(linear.fit)
summary(linear.fit)
#simple linear regression shows x1 and x2 are corelated.
#with the addition of an outlier it is observed that correlation is -ve.