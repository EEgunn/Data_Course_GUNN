# YOUR REMAINING HOMEWORK ASSIGNMENT (Fill in with code) ####



# 1.  Get a subset of the "iris" data frame where it's just even-numbered rows
library(tidyverse)
data("iris")
dat <- iris
seq(2,150,2) # here's the code to get a list of the even numbers between 2 and 150
data.frame("dat",seq(2,150,2))




# 2.  Create a new object called iris_chr which is a copy of iris, except where every column is a character class

iris_chr <- (as.character(iris))
print(ls())



# 3.  Create a new numeric vector object named "Sepal.Area" which is the product of Sepal.Length and Sepal.Width
Sepal.W <- c(dat$Sepal.Width)
Sepal.L <- c(dat$Sepal.Length)
Sepal.Area <- c(Sepal.L*Sepal.W)



# 4.  Add Sepal.Area to the iris data frame as a new column
names(iris)
iris$Sepal.Area <- Sepal.Area



# 5.  Create a new dataframe that is a subset of iris using only rows where Sepal.Area is greater than 20 
# (name it big_area_iris)

big_area_iris <- subset(x = iris,subset = Sepal.Area>20,select = c(Sepal.Area) )


# 6.  Upload the last numbered section of this R script (with all answers filled in and tasks completed) 
# to canvas
# I should be able to run your R script and get all the right objects generated

