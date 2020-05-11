### SWIRL INSTALLATION

install.packages("swirl")
packageVersion("swirl")
library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()


### DATASCIENCE JOHN HOPKINS QUIZ 1

filename <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(filename,"./Idaho_state_housing.csv", sep = ",")