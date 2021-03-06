<<<<<<< HEAD
# Chapter 2 Gas mileage, horsepower, and other information for cars.

Auto <- read.table("Auto.data") # reads the table without takein the column labels
Auto <- read.table("Auto.data", header = T) # takes the first row as column header
Auto <-read.table("Auto.data", header =  T, na.strings = "?") #na.strings treats the "?" as missing element.
Auto <- read.table("Auto.data", header = T, na.strings = "?", stringsAsFactors = T) #stringsAsFactors = T considers strings as variables 
#Auto <- read.csv("Auto.csv")
dim(Auto) # prints the dimentions of the table
Auto <- na.omit(Auto) # removes the incomplete rows
dim(Auto)
names(Auto)# Prints the headder names
plot(cylinders, mpg) #plot(x,y) but values are not taken form data table
plot(Auto$cylinders,Auto$mpg) # $ after the table name connects the data under the table header
cylinders <- as.factor(Auto$cylinders) # as.factor converts 
plot(cylinders,Auto$mpg)
=======
# Chapter 2 Gas mileage, horsepower, and other information for cars.

Auto <- read.table("Auto.data") # reads the table without takein the column labels
Auto <- read.table("Auto.data", header = T) # takes the first row as column header
Auto <-read.table("Auto.data", header =  T, na.strings = "?") #na.strings treats the "?" as missing element.
Auto <- read.table("Auto.data", header = T, na.strings = "?", stringsAsFactors = T) #stringsAsFactors = T considers strings as variables 
#Auto <- read.csv("Auto.csv")
dim(Auto) # prints the dimentions of the table
Auto <- na.omit(Auto) # removes the incomplete rows
dim(Auto)
names(Auto)# Prints the headder names
plot(cylinders, mpg) #plot(x,y) but values are not taken form data table
plot(Auto$cylinders,Auto$mpg) # $ after the table name connects the data under the table header
attach(Auto) #attach he database is attached to the R search path
cylinders <- as.factor(cylinders) # as.factor converts
plot(cylinders,mpg, xlab="Number of Cylinders", ylab="MPG", main="Effect of numberof cylinders on milage", col="orange", varwidth=T ) # variable width of box plot

plot(cylinders,mpg, xlab="MPG", ylab="Number of Cylinders", main="Effect of number of cylinders on milage", col="orange", varwidth=T, horizontal=T ) 
hist(mpg, col=8, breaks= 15) #histogram with width of 15
pairs(Auto) # plots scatter plot for every pair
pairs(
  ~mpg + displacement + horsepower + weight + acceleration,
  data=Auto
  )
plot(horsepower,mpg)
identify(horsepower,mpg, name) #identify(select on plot) print the name(variable) corresponding to horsepower, mpg

summary(mpg)

>>>>>>> 01ffd6a78208a5b738c3d4cb4897e8c4ef3ea1b4
