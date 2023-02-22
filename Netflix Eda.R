library(lattice)
library(ggplot2)
library(dplyr)
library(MASS)
library(tidyverse)
df2 <- read.csv('Best Show by Year Netflix.csv')
View(df2)

#summary
summary(df2)
str(df2)

#charater to categorical
df2$MAIN_GENRE=as.factor(df2$MAIN_GENRE)
df2$MAIN_PRODUCTION=as.factor(df2$MAIN_PRODUCTION)
sapply(df2)
summary(df2)
str(df2)

#checking null values
colSums(is.na(df2))

#dimensions
dim(df2)

#Subsetting
df3<-subset(df2,MAIN_GENRE=='drama'&SCORE>8.5,select=c(MAIN_GENRE,SCORE))
head(df3)
df4<-subset(df2,MAIN_GENRE=='scifi'&SCORE<8.5,select=c(MAIN_GENRE,SCORE))
head(df4)
df5<-subset(df2,MAIN_PRODUCTION=='US'&SCORE<8.5,select=c(MAIN_PRODUCTION,SCORE))
head(df5)

#histogram
histogram(~SCORE,data=df3,col="darkmagenta",main="Score wise analysis")
histogram(~SCORE|MAIN_GENRE,data=df2,col=c("blue","pink"),main="Genre wise score analysis")
histogram(~SCORE|MAIN_PRODUCTION,data=df2,col=c("blue","pink"),main="Production wise score analysis")

#boxplot
boxplot(SCORE~NUMBER_OF_SEASONS,data=df2,col=c("violet","blue"),main="Boxplot for season and score wise analysis")
p <=ggplot(df2,aes(x=SCORE,y=NUMBER_OF_SEASON))+
  geom_boxplot()
p

#scatterplot
ggplot(df2, aes(x = SCORE, y = NUMBER_OF_SEASONS)) +
  geom_point()
