library(tidyverse)
library(readxl)
library(tidyr)
library(patchwork)
library(ggpubr)
library(VennDiagram)
library(ggplot2)


setwd("./Data_class/Data_Course")
dat <- read.csv("../../Data/BioLog_Plate_Data.csv")
glimpse(dat)


dat2 <- dat %>% 
  pivot_longer(cols = c("Hr_24","Hr_48","Hr_144"),
               names_to = "Time",
               values_to = "Absorbance", names_prefix = "Hr_") %>% 
  arrange(desc(Dilution)) %>% 
  mutate(Sample_Type = case_when(Sample.ID == "Soil_1" ~ "Soil", 
                                 Sample.ID == "Soil_2" ~ "Soil", TRUE ~ "Water"))

dat2$Time <- str_remove(dat2$Time, "Hr_")
dat2$Time <- as.numeric(dat2$Time)


Dil <- dat2[c(1:1152),]
  
Dil1 <- dat2[grepl("^0.1", dat2$Dilution),]


Dil1 %>% 
  group_by(Substrate) %>% 
  ggplot(aes(x=Time, y=Absorbance, color=Sample_Type))+ 
  geom_point()+
  geom_smooth(se=FALSE)+
  facet_wrap(~Substrate,scales = "free")



  Soil <- dat2[c(865:2592),]
  water <- dat2[c(1:864,2593:3456),]


p + theme_minimal()
View()
#case_when for assignment 6
#desc for descending

# desc(Chonk) for reverse order

#take data from plates and make it do those things
#case when comes in handy bc theres 4 types soil if sample id contains soil then soil true water
#will also use ggannimate 

