library(tidyverse)
library(ggplot2)
library(ggpubr)
options(scipen = 999)



#1
df <- read_csv("cleaned_covid_data.csv")

#2
A_States <- df[grepl("^A", df$Province_State),]

#3 active cases over time
A_States %>% 
  ggplot(aes(x=Last_Update, y=Active))+
  geom_point()+
  geom_smooth(se=FALSE)+
  facet_wrap(~Province_State,scales = "free")

#4 new data frame 2 columns
State_Max_Fatality_Rate <- df %>% 
  group_by(Province_State) %>% 
  summarize(Max_Fatality = max(Case_Fatality_Ratio,na.rm =TRUE)) %>% 
  arrange(desc(Max_Fatality))

#5
State_Max_Fatality_Rate %>% 
  ggplot(aes(x=reorder(Province_State,-Max_Fatality),y=Max_Fatality))+
  geom_col()+
  theme(axis.text.x = element_text(angle = 90,hjust = 1))

#6 cummulative deaths over time
df %>% 
  group_by(Last_Update) %>% 
  summarize(Cumulative= sum(Deaths)) %>% 
  ggplot(aes(x=Last_Update,y=Cumulative))+
  geom_point()








