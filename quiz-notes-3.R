library(datasets)
data("iris") 
## "iris" is a dataset containing 150 observations of 3 species of plant. 
## There are 4 columns of variable data, labeled "Sepal.Length", "Sepal.Width", 
## "Petal.Length", and "Petal.Width". There is one column of attribute data, 
## labeled "Species" which is provided as one of three values: "setosa", 
## "versicolor", and "virginica". We can summarize the structure of "iris" 
## using "str(iris)".
str(iris) 
## We can also gain insight into "iris" using "summary.data.frame(iris)"
summary.data.frame(iris) 
## BUT for the purpose of this quiz, we want to know 
## the mean of "Sepal.Length" by species...
tapply(iris$Sepal.Length, iris$Species,mean)
## We should now be presented with three seperate means, one for each species.
## I'll assign this function to a variable in case there's a need to call it
## again. I've chosen "slxsm" because it's easy for me to remember as 
## "Sepal.Length by Species, Mean".
slxsm<-tapply(iris$Sepal.Length, iris$Species,mean)
## We have the mean values for each column from before, but the quiz won't let
## us take such a convenient shortcut. We'll spell out what we want specifically
## with "apply"
apply(iris[, 1:4], 2, mean)
## On to the next dataset. Let's take a look at 'mtcars' and get an idea of what 
## we're working with.
library(datasets)
data(mtcars)
summary.data.frame(mtcars)
## 11 car-specific variables, with 32 observations.
## From the set we just described, we want to look at a few functions 
## that provide a relationship between average miles per gallon and number of 
## cylinders. You may remember plotting this from the swirl exercise with
## "boxplot(mpg~cyl,data = mtcars)".
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))
## A bit blunt, but they do the trick.
## We'll look at the absolute difference in average horsepower between 
## 4 and 8 cylinder cars. I'll assign it to a variable, "chpd" (it's easy for
## me to remember as "cylinder, horsepower, difference")
chpd <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(chpd[3]-chpd[1]))
## The last question is literally the first line from the debug help page's 
## "details section"
?debug
