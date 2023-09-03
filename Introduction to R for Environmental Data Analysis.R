#installing required packages
install.packages('tidyverse') 
#Loading the Libraries
library(readr)
library(dplyr)
library(ggplot2)
#reading the data file
df=read_csv('C:/Users/vikra/Downloads/USW00093107.csv')
df
View(summary(df))
#Linearly Interpolating the missing values
#install.packages('remotes')
#remotes::install_github('SteffenMoritz/imputeTS')
#above code is alternative to 
install.packages('imputeTS')
library(imputeTS)
df$TAVG=na_interpolation(df$TAVG,option='linear')
#graphing the data using ggplot2
base=ggplot(data=df,aes(x=DATE,y=TAVG))
base
#adding the data points to the graph through adding another layer
base+
  geom_point()
#adding another layer
base+
  geom_point()+geom_line()
#Adding additional visual and aesthetic additional layers
ggplot(data=df,aes(x=DATE,y=TAVG,color=TAVG))+
  geom_point(size=4,alpha=0.7)+
  scale_color_gradient(name="C",low="#0096ff",high='#D22828')+
  ggtitle("Annual Mean temperature in San Diego from 1947 to Present")+
  xlab("Year")+
  ylab("annual mean temperature")

#Adding locally estimated scatterplot smoother to help visualize the increasing temperature
ggplot(data=df,aes(x=DATE,y=TAVG,color=TAVG))+
  geom_point(size=5,alpha=0.8)+
  geom_smooth(color='#365A77',se=F)+
  scale_color_gradient(name="C",low="#0096FF",high="#D22828")+
  ggtitle("Annual Mean Temperature in San Diego from 1947 to Present")+
  xlab("Year")+
  ylab("Annual Mean temperature")

#Graphing with Fahrenheit system
#F=(C*9/5)+32
df$TAVG=(df$TAVG*9/5)+32
ggplot(data=df,aes(x=DATE,y=TAVG,color=TAVG))+
  geom_point(size=5,alpha=0.8)+
  geom_smooth(color='#365A77',se=F)+
  scale_color_gradient(name="F",low="#0096FF",high="#D22828")+
  ggtitle("Annual Mean Temperature in San Diego from 1947 to Present")+
  xlab("Year")+
  ylab("Annual Mean temperature")

























