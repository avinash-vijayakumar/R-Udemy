

read.csv()

#Method 1: Reading the file manually
stats <- read.csv(file.choose())
stats

#Method 2: Set WD and Read Data 
getwd()
#Windows:
setwd("D:\\R Udemy\\Online Files")
getwd()
rm(stats)
stats<-read.csv("DemographicData.csv")
stats


#-------------------------------------------------------- Exploring Data
stats
nrow(stats) #number of rows
ncol(stats) #number of columns
head(stats, n=10) #gives first six values by default, n=10, 10 values
tail(stats, n=8) #gives last six values by default
str(stats) #structure of dataset
summary(stats) #gives a summary of the dataset
 
#-------------------------------------------------------- Using the $ sign
stats
head(stats)
stats[3,3]
stats["3","Birth.rate"]
stats$Internet.users # $ used to access data in a dataframe
stats$Internet.users[2] # we will get the 2nd row in Internet users
stats[,"Internet.users"]# $ is identical to this operation
levels(stats$Income.Group) #gives the level of the column specified 
#------------------------------------------------------ Basic Operations with a DF
stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),] # to see specific rows, here, 4th and 100th

#Remember how the [] work
is.data.frame(stats[1,])
#no need for drop = F when extracting rows in data frame
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F]) #drop needed when extracting a column in data frame

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users  

#add column 
head(stats)
stats$Mycalc <- stats$Birth.rate * stats$Internet.users

#test of knowledge
stats$xyz <- 1:4 #if 1:4 is given, error will occur
head(stats, n=10)  

#remove a column
head(stats)
stats$Mycalc <- NULL
stats$xyz <- NULL

#-------------------------------------------------------- Filtering Data Frames -dealing with rows
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]

#-------------------------------------------------------- Introduction to qplot()
library(ggplot2)
?qplot
qplot(data = stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), colour=I("red"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom = "boxplot")

#-------------------------------------------------------- Visualizing what we need
qplot(data = stats, x = Internet.users, y= Birth.rate)
qplot(data = stats, x = Internet.users, y= Birth.rate, size=I(4))
qplot(data = stats, x = Internet.users, y= Birth.rate, 
                        size=I(4), color = I("red"))
qplot(data = stats, x = Internet.users, y= Birth.rate, 
      size=I(5), color = Income.Group)

#-------------------------------------------------------- Creating Data Frames
mydf <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset,
                   Region = Regions_2012_Dataset) #new approach of naming; can also be used in rbind and cbind
head(mydf)
#colnames(mydf) <- c("Country","Code","Region") # old approach of naming
tail(mydf)
summary(mydf)

#-------------------------------------------------------- Merging Data Frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code") #by.x means left side data frame, here x means stats, and y means mydf
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)


 
#-------------------------------------------------------- Visualizing with new Split

library(ggplot2)
qplot(data = merged, x = Internet.users, y = Birth.rate)
qplot(data = merged, x = Internet.users, y = Birth.rate, color=Region)

#1. Shapes
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color=Region, size =I(5), shape = I(23))

#2. Transparency
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color=Region, size =I(5), shape = I(19), alpha = I(0.6))

#3. Title
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color=Region, size =I(5), shape = I(19), alpha = I(0.6),
      main = "Birth Rate vs Internet Users")

