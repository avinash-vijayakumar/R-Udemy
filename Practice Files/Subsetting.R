


#Extracting from Vector
x <- c("a","b","c","d","e")
x
x[c(1,5)]
x[1]



#Extracting from Matrix
Games
Games[1:3,6:10]

Games[c(1,10)] #wrong

Games[c(1,10),] #correct

Games[,4:5] #only 2008 and 2009

Games[,c(4,5)] #another method to get 2008 and 2009

Games[,c("2008","2009")] #another method to do the same

Games[1,]

is.matrix(Games[1,])
is.vector(Games[1,]) 

Games[1,5]


Games[1,,drop=F]
Games[1,5,drop=F]
