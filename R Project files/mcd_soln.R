getwd()
setwd("D:\\R Udemy\\R Project files\\nutrition-facts-for-mcdonald-s-menu")
getwd()
mcd <- read.csv("menu.csv")
head(mcd)
colnames(mcd)
colnames(mcd)[7] <- "Total.fat.DV"
colnames(mcd)
colnames(mcd)[9] <- "Saturated.fat.DV"
colnames(mcd)[12] <- "Cholesterol.DV"
colnames(mcd)[14] <- "Sodium.DV"
colnames(mcd)[16] <- "Carbohydrates.DV"
colnames(mcd)[18] <- "Dietary.Fiber.DV"
colnames(mcd)[21] <- "Vitamin.A.DV"
colnames(mcd)[22] <- "Vitamin.C.DV"
colnames(mcd)[23] <- "Calcium.DV"
colnames(mcd)[24] <- "Iron.DV"
colnames(mcd)
head(mcd)
library(ggplot2)
b <- ggplot(data = mcd, aes(x = Category, y = Calories, color = Category)) 
  
b + geom_jitter() + geom_boxplot(size = 1.1, alpha = 0.5) 


#facets
c <- ggplot(data = mcd, aes(x= Calories))
c + geom_histogram(binwidth = 10, aes(fill=Category),color="Black")

c + geom_histogram(binwidth = 10, aes(fill=Category),color="Black") +
  facet_grid(Category~., scales = "free")

c + geom_histogram(binwidth = 10, aes(fill=Category),color="Black") +
  facet_grid(Category)

#scatterplot:
d <- ggplot(data=mcd, aes(x=Category, y=Calories, color = Sugars))
d + geom_point(size = 3)

#facets:
d + geom_point(size = 3) + 
  facet_grid(Sugars~.)

str(mcd)
