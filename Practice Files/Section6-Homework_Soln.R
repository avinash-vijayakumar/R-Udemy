movies2 <- read.csv("Section6-Homework-Data.csv")
head(movies2)
colnames(movies2) <- c("DayofWeek","Director","Genre", "MovieTitle","ReleaseDate","Studio","AdjGrossMill","BudgetMill",
                 "GrossMill","IMDBRating","MovieLensRating","OverseasMill","OverseasPer","ProfitMill","ProfitPer",
                 "RuntimeMin","USMill","GrossUSPer")
head(movies2)
str(movies2)
library(ggplot2)

filt <- (movies2$Genre == "action") | (movies2$Genre =="adventure") | (movies2$Genre =="animation") | (movies2$Genre =="comedy") | (movies2$Genre =="drama")

movies2 <- movies2[filt,]
head(movies2)

filt2 <- movies2$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")

filt
filt2

mov <- movies2[filt & filt2,]
mov
 
#prepare the plot's data and aes layers:
p <- ggplot(data=mov,aes(x=Genre, y=GrossUSPer) )

#add geometries
q <- p + geom_jitter(aes(size = BudgetMill, color = Studio)) +
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 
q

#non-data ink
q <- q +
  xlab("Genre")+
  ylab("Gross % US")+
  ggtitle("Domestic Gross % by Genre")
q

#theme
q <- q+
  theme(axis.title.x = element_text(color="Blue", size = 30),
        axis.title.y = element_text(color="Blue", size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size = 20),
        
        plot.title = element_text(size =40),
        
        legend.title = element_text(size =20),
        legend.text = element_text(size = 20),
        
        text = element_text(family = "Comic Sans MS")
        )
        
q

#Final Touch
q$labels$size <- "Budget $M"
q



