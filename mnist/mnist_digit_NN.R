#NN mnist digit data----
#multilayer neural network
# load Required Library----
library(keras)

#prepare Data ----
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y
dim(x_train)
dim(x_test)

#reshape data
x_train <- array_reshape(x_train, c(nrow(x_train), 784))
x_test <- array_reshape(x_test,c(nrow(x_test),784))
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test,10)
x_train <- x_train /255
y_test <- y_test /255

# NN ----
# Define NN
modelnn <- keras_model_sequential()
modelnn %>% 
  layer_dense(units = 256, activation = "relu", input_shape = c(784)) %>%
  layer_dropout(rate = 0.4) %>%
  layer_dense(units = 128, activation = "relu") %>%
  layer_dropout(rate=0.3) %>%
  layer_dense(units=10, activation = "softmax")
summary(modelnn)

# fit NN
modelnn %>% compile(loss="categorical_crossentropy",
                    optimizer= optimizer_rmsprop(),metrics=c("accuracy"))
system.time(
  history <- modelnn %>%
    fit(x_train,y_train, epochs=30, batch_size=128, validation_split=0.2)
)

plot(history, smooth = FALSE)
accuracy <- function(pred, truth)
  mean(drop(pred)==drop(truth))
#modelnn %>% predict_classes(x_test) %>% accuracy(y_test) #depreciated
modelnn %>% predict(x_test) %>% accuracy(y_test)


modeller <- keras_model_sequential() %>% 
  layer_dense(input_shape = 784, units = 10,
              activation = "softmax")
summary(modeller)
modeller %>% compile (loss="categorical_crossentropy",
      optimizer=optimizer_rmsprop(), metrics = c("accuracy"))
modeller %>% fit(x_train, y_train, epoch=30,
                 batch_size=128, validation_split=0.2)
modeller %>% predict(x_test) %>% accuracy(y_test)

#CNN ----
library(keras)
library(reticulate)
cifar100 <-  dataset_cifar100()
names(cifar100)
x_train <- cifar100$train$x
y_train <- cifar100$train$y
x_test  <-  cifar100$test$x
y_test <- cifar100$test$y
dim(x_train)
range(x_train[1,,, 1])
x_train <- x_train/255
x_test <- x_test/255
range(x_train[1,,, 1])
y_train <- to_categorical(y_train, 100)
dim (y_train)

#load the jpeg library to view images
library(jpeg)
par(mar=c(0,0,0,0), mfrow=c(5,5))
index <- sample(seq(50000),25)
for (i in index) plot(as.raster(x_train[i,,, ]))

# Building CNN
modelcnn <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), padding = 'same', activation = "relu", input_shape = c(32,32,3)) %>% 
  layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
  layer_conv_2d(filters = 64, kernel_size = c(3,3), padding = 'same', activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
  layer_conv_2d(filters = 128, kernel_size = c (3,3),padding = 'same', activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
  layer_conv_2d(filters = 256, kernel_size = c (3,3),padding = 'same', activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
  layer_flatten() %>%
  layer_dropout(rate=0.5) %>%
  layer_dense(units = 512, activation = "relu") %>%
  layer_dense(units = 100, activation = "softmax")
modelcnn%>% compile(loss="categorical_crossentropy", optimizer="adam", metrics=c("accuracy"))
history <- modelcnn%>% fit(x_train, y_train, epochs=30, batch_size=128, validation_split=0.2)
plot(history)

modelcnn_back <- modelcnn
# using trained NN for prediction ----
img_dir <- "book_images"
image_names <- list.files(img_dir)
num_images <- length(image_names)
img_path <- "flamingo.jpg"
img <- image_load(img_path,target_size = c(32,32))
x <- image_to_array(img)
#x <- array(dim = c(num_images, 244, 244, 3))
#for (i in 1:num_images) {
#  img_path <- paste(img_dir, image_names[i], sep = "/")
#  img <- image_load(img_path, target_size = c(244, 244))
#  x[i,,, ] <- image_to_array(img)
#}
x <- array_reshape(x,c(1,dim(x)))
x <- imagenet_preprocess_input(x)  
model <- modelcnn
summary(model)
model %>% predict(x)
pred6 <- modelcnn %>% predict(x)
imagenet_decode_predictions(pred6, top = 3)
names(pred6) <- image_names
print(pred6)

summary(modelcnn)
