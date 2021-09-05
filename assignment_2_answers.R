list.files(path = "Data", pattern = ".csv", full.names = TRUE, recursive = TRUE)
csv_files <- list.files(path = "Data", pattern = ".csv", full.names = TRUE, recursive = TRUE)
length(csv_files)


read.csv("wingspan_vs_mass.csv")
read.csv(csv_files[140])
df <- read.csv(csv_files[140])

head(csv_files[140])
head(df, n=5)

list.files(path = "Data", pattern = "b", full.names = TRUE, recursive = TRUE)

library(tidyverse)
list.files("Data",pattern = "*.csv",full.names = TRUE)


csv_files <- list.files("Data",pattern = "*.csv",full.names = TRUE)


df <- read.csv(csv_files[29])


head(df, n=5)

list.files(path = "Data", pattern = "b",full.names = TRUE, recursive = TRUE)

for (i in 1:29) {
  df_loop <- read.csv(file = csv_files[i])
  print(head(df_loop,5))
  }  
  

  
