library(tidyr)
library(tidyverse)
library(ggplot2)
library(ggplotify)
library(ggpubr)
library(janitor)
library(dplyr)

setwd('..')
setwd("./Data_Course_GUNN")

ld <- read.csv("./Exam_2/landdata-states.csv")

un <- read.csv("./Exam_2/unicef-u5mr.csv")


#I.  Load the landdata-states.csv file into R
#Re-create the graph shown in "fig1.png"
#Export it to your Exam_2 folder as LASTNAME_Fig_1.jpg (note, that's a jpg, not a png)
        #To change the y-axis values to plain numeric, add options(scipen = 999) to your script

p <- ld %>% 
  group_by(region) %>% 
  ggplot(aes(x=Year, y=Land.Value, color=region))+
  labs(x="Year",y="Land Value (USU)")+
  scale_y_continuous(labels = function(x) format(x,scientific = FALSE))

p + geom_smooth()+
  theme_minimal()


ggsave(
  "fig1.jpeg",
  plot = last_plot(),
  device = "jpeg",
  path = "C:/Users/erika/Data_class/Data_Course_GUNN/Exam_2",
  width = 6,
  height = 5.5,
  dpi = 320)

#II.     What is "NA Region???"
#Write some code to show which state(s) are found in the "NA" region 

na_region <- ld[is.na(ld$region),]

#III.   The rest of the test uses another data set. 
# The unicef-u5mr.csv data. Get it loaded and take a look.
# It's not exactly tidy. You had better tidy it!

names(un) <- make_clean_names(names(un))

glimpse(un)


long_un <- un %>% 
  pivot_longer(cols = c(starts_with("u5mr_")),
               names_to = "year",
               values_to = "mortality_rate", names_prefix = "u5mr_", 
               values_drop_na = TRUE)
  


#IV.     Re-create the graph shown in fig2.png
#Export it to your Exam_2 folder as LASTNAME_Fig_2.jpg 
#(note, that's a jpg, not a png)


long_un$year <- as.numeric(long_un$year)


long_un %>% 
  ggplot(aes(x=year, y=mortality_rate, color = continent))+
  geom_point(size = 2)+
  coord_cartesian(xlim=c(1950,2015), ylim=c(0,450))+
  scale_x_continuous(breaks = seq(1960, 2000, 20))+
  scale_color_discrete("Continent")+
  labs(x="Year",y="Mortality Rate")+
  theme_minimal()
  
getwd()

ggsave(
  "fig2.jpeg",
  plot = last_plot(),
  device = "jpeg",
  path = "C:/Users/erika/Data_class/Data_Course_GUNN/Exam_2",
  width = 6,
  height = 5.5,
  dpi = 320)

#export -> save as image -> drop down jpeg

#IV.     Re-create the graph shown in fig3.png
#Note: This is a line graph of average mortality rate over time for each continent 
#(i.e., all countries in each continent, yearly average), this is NOT a geom_smooth() 
#Export it to your Exam_2 folder as LASTNAME_Fig_3.jpg (note, that's a jpg, not a png)

long_un %>%
  group_by(continent,year) %>% 
  mutate(mean_mortality = mean(mortality_rate)) %>% 
  ggplot(aes(x=year, y=mean_mortality, color = continent))+
  geom_line(size = 2)+
  coord_cartesian(xlim=c(1950,2015), ylim=c(0,300))+
  scale_x_continuous(breaks = seq(1960, 2000, 20))+
  scale_color_discrete("Continent")+
  labs(x="Year",y="Mean Mortality Rate (deaths per 1000 live births)")+
  theme_minimal()

ggsave(
  "fig3.jpeg",
  plot = last_plot(),
  device = "jpeg",
  path = "C:/Users/erika/Data_class/Data_Course_GUNN/Exam_2",
  width = 5.9,
  height = 5.3,
  dpi = 320)



#V.      Re-create the graph shown in fig4.png
#Note: The y-axis shows proportions, not raw numbers
#This is a scatterplot, faceted by region
#Export it to your Exam_2 folder as LASTNAME_Fig_3.jpg (note, that's a jpg, not a png)

long_un %>%
  group_by(country_name) %>% 
  mutate(proportion = proportions(year, margin = mortality_rate)) %>% 
  ggplot(aes(x=year, y=mortality_rate/sum(mortality_rate), color = continent))+
  geom_point(size = 2)+
  geom_smooth(method = "lm", se= FALSE)+
  facet_wrap(region)+
  coord_cartesian(xlim=c(1950,2015), ylim=c(0,300))+
  scale_x_continuous(breaks = seq(1960, 2000, 20))+
  scale_color_discrete("Continent")+
  labs(x="Year",y="Mean Mortality ")+
  theme_minimal()


p4 = ggplot(midwest, aes(x=area/max(midwest$area), y=log10(poptotal))) + 
  

#VI.		Commit and push all your code and files to GitHub. I'll pull your repository at 9:30pm sharp and grade what I find.
