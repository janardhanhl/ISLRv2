#time to publication / survival analysis
publication <- read.csv("Publication.csv", stringsAsFactors = TRUE)
publication <- publication[,-1]
summary(publication)
View(publication)
attach(publication)
library(survival)
fit.posres <- survfit(Surv(time, status)~posres)
plot(fit.posres, xlab="Months", ylab="Probability of not being Published", col = 3:4)
legend('topright', c("negative result", "positive result"), col = 3:4, lty=1,bty = "n")

#p values from fitting coxs proportional hazards model
fit.pub <- coxph(Surv(time,status)~posres)
fit.pub
summary(fit.pub)
# As the p values are large for cox's proportional hazards model no evidence of a 
# difference in time to publication between studies with positive v/s negative results. 
# log rank test
logrank.test <- survdiff(Surv(time,status)~posres)
logrank.test
# log rank test also provides identical conclusion

# fitting with all other predictors excluding funding mechanism 
fit.pub2 <- coxph(Surv(time,status) ~ .-mech, data=publication)
fit.pub2
