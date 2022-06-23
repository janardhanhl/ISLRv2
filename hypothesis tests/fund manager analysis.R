#fundmanager performance
#A data frame containing the returns of hedge fund managers over 50 months.
fund <- read.csv("Fund.csv", stringsAsFactors = TRUE )
View(fund)
fund <- fund[,-1]
dim(fund)
View(fund)
summary(fund)
