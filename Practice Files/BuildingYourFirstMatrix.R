



#matrix()


my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
A

A[2, 3]

B <- matrix(my.data, 4, 5, byrow = T)
B

B[2,5]


#rbind()
r1 <- c("My", "name", "is", "Avinash")
r2 <- c("India", "is", "my", "country")
r3 <- c(1,2,3,4)

C <- rbind(r1, r2, r3)
C

#cbind()
D <- cbind(r1, r2, r3)
D

c1<- 1:5
c2<- -1:-5
cbind(c1,c2)

