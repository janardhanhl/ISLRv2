ghitters <- read.csv("Hitters.csv")
ghitters <- na.omit(ghitters)
View(ghitters)
n <- nrow(ghitters)
set.seed(13)
ntest <- trunc(n/3)
testid <- sample(1:n, ntest)

# linear fit ----
linear.fit <- lm(Salary ~., data = ghitters[-testid,])
lpred <- predict(linear.fit, ghitters[testid,])
with(ghitters[testid,], mean(abs(lpred-Salary)))# the first argument is a dataframe, 
#with() and the second an expression that can refer to elements of the dataframeby name

# glmnet fit ----
library(glmnet)
x <- scale(model.matrix(Salary~. -1, data=ghitters))
y <- ghitters$Salary

cvfit <- cv.glmnet(x[-testid,], y[-testid], type.measure = "mae")
cpred <- predict(cvfit, x[testid,], s="lambda.min")
mean(abs(y[testid]-cpred))

#Neural Network ----
library(reticulate)
library(keras)
library(tensorflow)
modnn <- keras_model_sequential() %>%
  layer_dense(units = 50, activation = "relu", input_shape=ncol(x)) %>%
  layer_dropout(rate=0.4) %>%
  layer_dense(units = 1)
x <- scale(model.matrix(Salary ~. -1, data=ghitters))
x <- model.matrix(Salary ~. -1, data = ghitters) %>% scale()
modnn %>% compile(loss="mse",optimizer=optimizer_rmsprop (),
                  metrics = list ("mean_absolute_error"))
history <- modnn %>% fit (
  x[-testid , ], y[-testid], epochs = 1500, batch_size = 32,
  validation_data = list (x[testid , ], y[testid])
)
View(history)
plot(history)

