library(datasets)
data(iris)

round(mean(iris[iris$Species == "virginica",]$Sepal.Length))

apply(iris[, 1:4], 2, mean)
rowMeans(iris[, 1:4])
colMeans(iris)
apply(iris[, 1:4], 1, mean)
apply(iris, 2, mean)


library(datasets)
data(mtcars)

apply(mtcars, 2, mean)

sapply(mtcars, cyl, mean)


mean(mtcars$mpg,mtcars$cyl)



lapply(mtcars,mean)

tapply(mtcars$cyl, mtcars$mpg, mean)

with(mtcars,tapply(mpg,cyl,mean))
tapply(mtcars$mpg, mtcars$cyl, mean)
install.package("caTools")
library(caTools)
sapply(split(mtcars$mpg,mtcars$cyl), mean)

split(mtcars,mtcars$cyl)


new <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(new[3]-new[1]))

debug(ls)