

MyFirstVector <- c(1, 2, 33, 4, 55)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(12L, 322L, 0L, 499L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a", "r32", "assd2", "sit")
V3
is.character(V3)
is.numeric(V3)

seq() #sequence - like ':'
rep() #replicate

seq(1,15)
1:15

seq(1,15,2)
z <- seq(1,15,4)
z

rep(3, 50)
d <- rep(3, 50)
d

rep("a", 5)

x <- c(80,20)
y <- rep(x,10)
y
