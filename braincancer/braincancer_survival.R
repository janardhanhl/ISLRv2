braincancer <- read.csv("BrainCancer.csv", stringsAsFactors = TRUE)
View(braincancer)
braincancer <- braincancer[,-1]
names(braincancer)
attach(braincancer)
table(diagnosis)
table(loc)
table(sex)
table(status)
library(survival)
fit.surv <- survfit(Surv(time, status)~1)
plot(fit.surv, xlab = "Months",
     ylab="Estimated Probability of Survival")
fit.gender <- survfit(Surv(time, status)~ sex)
plot(fit.gender,xlab="Months",
     ylab="Estimated Propbability of survival", col = c(2,4))
legend("bottomleft", levels(sex), col=c(2,4), lty = 1)
logrank.test <- survdiff(Surv(time,status)~sex)
logrank.test
logrank.test$chisq
# Cox proportional hazards models using the coxph() 
fit.cox <- coxph(Surv(time,status)~sex)
summary(fit.cox)
summary(fit.cox)$logtest[1]
summary(fit.cox)$waldtest[1]
summary(fit.cox)$sctest[1]
fit.all <- coxph(Surv(time, status) ~ sex + diagnosis + loc +  ki + gtv  + stereo)
fit.all
summary(fit.all)


modaldata <- data.frame(
  diagnosis = levels(diagnosis),
  sex=rep("Female",4),
  loc=rep("Supratentorial", 4),
  ki= rep(mean(ki), 4),
  gtv=rep(mean(gtv), 4),
  stereo=rep("SRT", 4)
)
survplots <- survfit(fit.all, newdata = modaldata)
plot(survplots, xlab="months",
      ylab="survival Probability", col=3:6)
legend("bottomleft", levels(diagnosis), col=3:6, lty = 1, bty = 'n' )
