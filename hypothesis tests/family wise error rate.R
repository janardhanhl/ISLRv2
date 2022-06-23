# Family wise error rate 
m <- 1:500
fwe1 <- 1-(1-0.05)^m
fwe2 <- 1-(1-0.01)^m
fwe3 <- 1-(1-0.001)^m
par(mfrow=c(1,1))
plot(m,fwe1, type = "l", log="x", ylim = c(0,1),col=2, ylab = "Family-Wise Error Rate",
     xlab = "Number of Hypothesis")
lines(m,fwe2, col=4)
lines(m, fwe3, col=3)
abline(h=0.05, lty=2)
