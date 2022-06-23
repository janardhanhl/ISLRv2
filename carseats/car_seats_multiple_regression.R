#chapter 3 excercise multiple liner regression to predict car seat sales
seats<-read.csv("Carseats.csv")
View(seats)
multi.fit<-lm(Sales ~ Price + Urban + US, data=seats)
summary(multi.fit)
par(mfrow=c(2,2))
plot(multi.fit)
contrasts(seats$Urban)
contrasts(seats$US)
