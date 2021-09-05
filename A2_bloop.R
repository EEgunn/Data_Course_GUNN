library(tidyverse)
list.files(path = "Data", pattern = "b", full.names = TRUE, recursive = TRUE)
b_files <- list.files(path = "Data", pattern = "b", full.names = TRUE, recursive = TRUE)

for (i in 1:29) {
  print(head(b_files,5))
}