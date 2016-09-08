mtcars

plot(mtcars$wt, mtcars$mpg)
qplot(mtcars$wt, mtcars$mpg)

# plot scatter 
ggplot(mtcars, aes(x=wt,y=mpg)) + geom_point()
# plot line
ggplot(pressure,aes(x=temperature,y=pressure))+geom_line()

# plot line with points 
ggplot(pressure,aes(x=temperature,y=pressure))+
  geom_line()+
  geom_point()

# plot bar chart 
head(BOD)
ggplot(BOD,aes(x=Time, y=demand))+geom_bar(stat ="identity")
  
head(mtcars)
ggplot(mtcars,aes(x=factor(cyl)))+geom_bar()

# plot histogram 
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth=4)

# plot box chart 
head(ToothGrowth)
ggplot(ToothGrowth, aes(x=interaction(supp,dose),y=len))+geom_boxplot()

# plot a funtion curve 
# define the function 
myfun <- function(x){
  1/(1+exp(-x+10))
}

myfun2 <- function(x){
  1- 1/(1+exp(-x+10))
}


ggplot(data.frame(x=c(0,20)),aes(x=x)) + 
  stat_function(fun=myfun, geom="line") + 
  stat_function(fun=myfun2, geom="line", colour="blue") 

p<- ggplot(data.frame(x=c(-3,3)),aes(x=x))  
p + stat_function(fun=dnorm)
p + stat_function(fun=rnorm, n= 500)

p + stat_function(fun=dt, args=list(df=2))

another_function <- function(x){
  1/(1+exp(-x+10))
}

q <- ggplot(data.frame(x=c(0,20)),aes(x))
q
q + stat_function(fun=another_function, n=200) # n for calculating points 

# shading a subregion under a function curve 

dnorm_limit <- function(x){
  y<-dnorm(x)
  y[x<0|x>2] <- NA
  return(y)
}

p<- ggplot(data.frame(x=c(-3,3)),aes(x=x))
p
p + stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha = 0.2) +
  stat_function(fun=dnorm)

# passing function to another 
limitRange<- function(fun,min,max){
  function(x){
    y<- fun(x)
    y[x<min|x>max]<-NA
    return(y)
  }
}

dlimit <- limitRange(dnorm,0,2)
p<- ggplot(data.frame(x=c(-3,3)),aes(x=x))
p
p + stat_function(fun=dnorm)+
  stat_function(fun= dlimit, geom="area", fill="blue",alpha=0.2, n=900)

# plotting a network 

library("igraph")
# with direct 
gd <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(gd)
# with no direct 
gu <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
# no lables 
plot(gu, vertex.label=NA)
str(gd)
str(gu)

set.seed(229)
plot(gu)

head(madmen2)
g <- graph.data.frame(madmen2,directed=TRUE)
par(mar=c(0,0,0,0))

plot(g, layout=layout.fruchterman.reingold,vertex.size=8, edge.arrow.size=0.5  )

#circle graph 
head(madmen)
g2 <- graph.data.frame(madmen2,directed=F)
par(mar=c(0,0,0,0))
plot(g2,layout=layout.circle,vertex.size =6)



