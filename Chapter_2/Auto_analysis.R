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
