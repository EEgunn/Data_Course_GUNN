library(tidyverse)
library(ggplot2)

setwd('../..')
setwd('..')

list.files("Data")
read.csv("./Data/iris.csv")
iris <- read.csv("./Data/iris.csv")

iris %>%
  ggplot(aes(x=Sepal.Length,y=Petal.Length, color = Species)) +
  geom_point( alpha = 0.5)+
  geom_smooth(method = "lm", se = FALSE)+
  theme_minimal() +
    labs(x = "Sepal Length", y= "Petal Length",  color = "Species", 
    title = "Sepal Length vs Pedal Length", subtitle = "For three iris species")+
    theme(plot.caption = element_text(size = 6), 
          plot.title = element_text(hjust = .5,colour = "Violetred4", face = "bold"), 
          axis.text = element_text(hjust = 1), 
          plot.background = element_rect(fill = "papayawhip"))

