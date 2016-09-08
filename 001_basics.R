#install.packages(c("ggplot2","gcookbook"))

library("ggplot2")
library("gcookbook")

# read data from csv
data <- read.csv("datafile.csv")
# data file does not have header
data <- read.csv("filename.csv", header=false)
# manually assign the header names
names(data) <- c("","","",... )

# set deliminater , string as factor off 
data <- read.csv("datafile.csv", sep="\t", stringAsFactors=FALSE)

# convert to factor 
data$col <- factor(data$col)
str(data)



