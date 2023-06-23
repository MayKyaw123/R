#Lab 4
#May Kyaw

#task 1

library(dplyr)
library(tidyverse)
library(ggpubr)  
library(rstatix)

happydata = read.csv("happiness.csv")
head(happydata)

happydata = import("happiness.csv")

#task 3
#for categorical variable,generate bar chart the counts 
# of number of countries in each region
plot(happydata$Region) 
#From the bar chart I learned about the different countries that are present
#in each of the regions with Africa having the highest number of countries 
#in the region

#task 4
# quantitative x quantitative, scatter plot
plot(happydata$row.ID,happydata$Happiness.Score)
# The scatter plot exemplify the relationship between the row ID to the 
#happiness score, displaying the trends of the data

#task 5
# for Categorical x quantitative, generate a box plot
plot(happydata$Region,happydata$Happiness.Score)
# The box plot displayed the quantitative density of the happiness score 
#in relations to the Region

#task 6
# the following function uses package ggpubr and ggplot2
# Creating box plot to study difference between groups
?ggboxplot
ggboxplot(happydata, x="Region", y="Happiness.Score")
#The box plot showed a different relationship of the data compared to the box 
#plot prior. Examining the diffrences between the region and the happiness score

#task 7
hist(happydata$Happiness.Score) 
#Display the score constancy

#task 8
hist(happydata$Health) 
#exhibit the commonness of the data points descending into each of the ranges 

#task 9
# quantitative x quantitative, scatter plot
plot(happydata$Health,happydata$Happiness.Score)
#The scatter plot display the frequency of the data points in terms of the 
#trend of where data points fall between the relationship of health and 
#happiness score

