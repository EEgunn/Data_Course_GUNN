library(tidyverse)
library(tidyr)
library(ggpubr)
library(ggplot2)
library(gganimate)


setwd("../../../Data_Course_GUNN")

dat <- read.csv("./Assignments/Assignment_6/BioLog_Plate_Data.csv")
glimpse(dat)


#1 #2 #3 

dat_long <- dat %>%  
  pivot_longer(cols = c("Hr_24","Hr_48","Hr_144"),
               names_to = "Time",
               values_to = "Absorbance", names_prefix = "Hr_") %>%  
  arrange(desc(Dilution)) %>% 
  mutate(Sample_Type = case_when(Sample.ID == "Soil_1" ~ "Soil", 
                                 Sample.ID == "Soil_2" ~ "Soil", TRUE ~ "Water"))



dat_long$Time <- as.numeric(dat_long$Time)



Dil1 <- dat_long[grepl("^0.1", dat_long$Dilution),]


Dil1 %>% 
  group_by(Substrate) %>% 
  ggplot(aes(x=Time, y=Absorbance, color=Sample_Type))+ 
  ylim(0.0,2.0)+
  geom_smooth(se=FALSE)+
  facet_wrap(~Substrate,scales = "free")+
  theme_minimal()



#4

Ita <- dat_long[grepl("^Ita", dat_long$Substrate),]

Ita2 <- Ita %>%
  group_by(Time,Sample.ID) %>% 
  mutate(Mean_Absorbance = mean(Absorbance))

  
Ita2 %>% 
  group_by(Sample.ID) %>% 
  ggplot(aes(x=Time, y= Mean_Absorbance, color=Sample.ID))+ 
  geom_line()+
  ylim(0.0,2.5)+
  facet_wrap(~Dilution,scales = "free")+
  theme_minimal() + 
  transition_reveal(Time)


