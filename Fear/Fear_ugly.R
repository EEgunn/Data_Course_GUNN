library(tidyverse)
library(ggplot2)
library(ggpubr)
library(scales)

Fp <- read.csv("./Data_Course_GUNN/Fear/FearPilot.csv")
Fs <- read.csv("./Data_Course_GUNN/Fear/FearStudyData.csv")


Fs %>% 
  ggplot(aes(x=Fear,y=Embarrassed, fill = Encounter)) +
  geom_point( alpha = 0.5)+
  geom_segment(aes(x=Fear, xend=Impact, y=Embarrassed, yend=Encounter))+
  geom_smooth(method = "lm", se = FALSE)+
  theme_transparent() +
  labs(x = "Ahhh! ><", y= "iMpACt, EnCOunTeRs & R U also eMbaRraSsed?", caption = "Data from https://www.kaggle.com", 
       title = "R u aFrAiD!?", subtitle = "OF WHAT!?!")+
  theme(plot.caption = element_text(size = 6, colour = "green4"), 
        plot.subtitle = element_text(hjust = .2, colour = "orangered2", size = 16),
        plot.title = element_text(hjust = .5,colour = "springgreen", face = "bold", size = 20), 
        axis.text.x = element_text(hjust = 1, angle = 65, face = "bold",colour = "cyan2"), 
        axis.line = element_line(color = "cyan2"), 
        axis.ticks = element_line(colour = "yellow4"), 
       legend.position = "none",
        axis.title.y = element_text(colour = "green1", size = 18, face = "italic"),
        axis.title.x = element_text(colour = "yellow", size = 26, angle = 19, hjust =.2, face = "italic"),
        axis.text.y = element_text(hjust = 1,angle = 20, face = "bold", colour = "red"), 
        plot.background = element_rect(fill = "orange1"))

colors()

