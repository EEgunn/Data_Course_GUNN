library(tidyverse)
library(ggplot2)
library(modelr)
library(broom)
library(tidyr)


# I.

df <- read.csv("FacultySalaries_1995.csv")
df[df == "VIIB"] <- "IIB"

names(df)

assistant <- df %>% 
  select("FedID","UnivName","State","Tier", contains("Assist")) %>% 
  pivot_longer(AvgAssistProfSalary,
               names_to = "Rank",
               values_to = "Salary",
               values_drop_na = TRUE) %>% 
  select(-starts_with("num")) %>% 
  select(-starts_with("avg")) %>% 
  mutate(Rank = "Assist")

associate <- df %>% 
  select("FedID","UnivName","State","Tier", contains("Assoc"))%>% 
  pivot_longer(AvgAssocProfSalary,
               names_to = "Rank",
               values_to = "Salary",
               values_drop_na = TRUE) %>% 
  select(-starts_with("num")) %>% 
  select(-starts_with("avg")) %>% 
  mutate(Rank = "Assoc")

full <- df %>% 
  select("FedID","UnivName","State","Tier", contains("Full"))%>% 
  pivot_longer(AvgFullProfSalary,
               names_to = "Rank",
               values_to = "Salary",
               values_drop_na = TRUE) %>% 
  select(-starts_with("num")) %>% 
  select(-starts_with("avg")) %>% 
  mutate(Rank = "Full")


complete <- rbind(assistant,associate,full)

complete %>% 
  filter(!is.na(Salary)) %>% 
  ggplot(aes(x=Rank,y=Salary,fill=Rank))+
  geom_boxplot()+
  facet_wrap(~Tier, shrink = TRUE)+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 63,hjust = 1),  
        axis.ticks.x = element_blank())

ggsave("GUNN_fig_1.jpeg",
  plot = last_plot(),
  device = "jpeg",
  path = "C:/Users/erika/Data_class/Data_Course_GUNN/Exam_3",
  width = 3.5,
  height = 4.5,
  dpi = 320)  



# II. Export an ANOVA table to a file called "Salary_ANOVA_Summary.txt"
  
mod.aov <- aov(formula = Salary ~ Rank + Tier + State,
                   data = complete)

sal.mod.aov <- summary(mod.aov)

capture.output(sal.mod.aov, file = "Salary_ANOVA_Summary.txt")


# III.

df1 <- read.csv("Juniper_Oils.csv")

long_df1 <- df1 %>%
  pivot_longer(cols = c("alpha.pinene","para.cymene","alpha.terpineol","cedr.9.ene",
                        "alpha.cedrene","beta.cedrene","cis.thujopsene",
                        "alpha.himachalene","beta.chamigrene","cuparene","compound.1",
                        "alpha.chamigrene","widdrol","cedrol","beta.acorenol",
                        "alpha.acorenol","gamma.eudesmol","beta.eudesmol",
                        "alpha.eudesmol","cedr.8.en.13.ol","cedr.8.en.15.ol",
                        "compound.2","thujopsenal"),
               names_to = "Chemical",
               values_to = "Concentration",
               values_drop_na = TRUE) %>% 
  select("YearsSinceBurn","Chemical","Concentration")


# IV.     

long_df1 %>% 
  ggplot(aes(x= YearsSinceBurn, y= Concentration))+
  geom_smooth(se= TRUE)+
  facet_wrap(~Chemical, scales = "free")+
  theme_minimal()

ggsave("GUNN_fig_2.jpeg",
       plot = last_plot(),
       device = "jpeg",
       path = "C:/Users/erika/Data_class/Data_Course_GUNN/Exam_3",
       width = 7.8,
       height = 4.8,
       dpi = 320) 

# V. Use a generalized linear model to find which chemicals show concentrations that 
#are significantly (significant, as in P < 0.05) affected by "Years Since Burn".Use the
#tidy() function from the broom R package in order to produce a data frame showing JUST
#the significant chemicals and their model output (coefficient estimates, p-values, etc)     


mod <- glm(formula = Concentration ~ YearsSinceBurn*Chemical, data = long_df1)
summary(mod)

tidymod <- tidy(mod)

tidymod %>% 
  filter(p.value < 0.5) %>% 
  mutate(term = str_remove_all(term, "Chemical"))

#not sure why my tibble shows 14 variables and not 6 and when the numbers are the same




