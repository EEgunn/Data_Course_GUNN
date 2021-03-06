library(tidyverse)
library(ggplot2)

https://www.kaggle.com/wsj/college-salaries


# For my final project, I will be analyzing data on salaries by region, major and type of college. 
# There are potentially many sources I could use to gather data. One source I have already found is 
# from kaggle.com but I can also use data.gov and many others. 

setwd('..')
read.csv(file = "degrees-that-pay-back.csv")
read.csv(file = "salaries-by-college-type.csv")
read.csv(file = "salaries-by-region.csv")
degree_salaries <- read.csv(file = "degrees-that-pay-back.csv")
salaries_college <- read.csv(file = "salaries-by-college-type.csv")
salaries_region <- read.csv(file = "salaries-by-region.csv")

degree_salaries <- read.csv(file = "degrees-that-pay-back.csv")
df <- degree_salaries[c(7,9,10,11,13,14,20,32,38,39,45),]

df %>%
  ggplot(aes(x=Undergraduate.Major,y=Starting.Median.Salary, 
             color = Undergraduate.Major, fill = Undergraduate.Major)) +
  geom_bar(stat="identity", width = 0.5)+
  geom_smooth(method = "lm", se = FALSE)+
  theme_minimal() +
  labs(x = "Undergraduate Major", y= "Starting Median Salary", caption = "Data from https://www.kaggle.com/wsj/college-salaries", 
       title = "Starting Salaries of Undergraduate STEM Majors") +
  theme(plot.caption = element_text(size = 6), 
        plot.title = element_text(hjust = .5,colour = "black", face = "bold"), 
        axis.text = element_text(hjust = 1), axis.text.x = element_text(hjust = 1,angle = 90),
        legend.position = 'none',
        plot.background = element_rect(fill = "papayawhip"))
