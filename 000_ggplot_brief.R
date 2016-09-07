# reading_cookbook_plot
#install packages 

install.packages("ggplot2")
install.packages("gcookbook")

#load the library 

library(ggplot2)
library(gcookbook)

simpledat
barplot(simpledat,beside=TRUE)
barplot(t(simpledat),beside=TRUE)
plot(simpledat[1,],type="l") # plot the first row as line 
lines(simpledat[2,],type="l",col="blue") # adding the second row of data as line 

simpledat_long


# "+" for adding components to the plot 
# plot bar chart from long table 
ggplot(simpledat_long,aes(x=Aval,y=value, fill=Bval)) + geom_bar(stat="identity",position="dodge")
ggplot(simpledat_long,aes(x=Bval,y=value, fill=Aval)) + geom_bar(stat="identity",position="dodge")

# plot line chart from long table 
ggplot(simpledat_long,aes(x=Aval,y=value, colour=Bval, group=Bval)) + geom_line()

# terminology and theory
# geoms = geometric object 
# aesthetic attributes --> aes 
# plot is actually mapping from data values to aesthetics
# scales control the mapping from data spcae to aesthetic space
# guide are tick marks and labels 

# note : in ggplot2, 
# categorical vars are called discrete 
# numeric variables are called continuous

# ggplot2 data must be stored in data frames 
# variable must be stored in column 

# making a datafram 

dat <- data.frame( xval=1:4,yval=c(3,5,6,9), group=c("A","B","A","B"))
dat

# a basic ggplot 
ggplot(dat, aes(x=xval,y=yval))

# a basic scatter plot 
ggplot(dat, aes(x=xval,y=yval)) + geom_point()

p<- ggplot(dat,aes(x=xval,y=yval))
p + geom_point()

# colour the dots by group 
p + geom_point(aes(colour=group))

p + geom_point(colour="blue")

# scale x range
p + geom_point() + 
  scale_x_continuous(limits = c(0,8))

# always leave the + at the end of the lines instead of adding it to beginning 
p + geom_point() + 
  scale_colour_manual(values=c("orange","blue"))

