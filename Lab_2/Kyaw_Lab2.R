#May Kyaw
#INST354
#LAB 9

library(tidyverse)
library(ggpubr)
library(rstatix)
kickstarter <- read.csv('~/Downloads/kickstarter_lab9.csv', header = TRUE)

#1
#From the results of data we can examine the categories of Music and Art 
#interms of the USD.pledged 
kickstarter$category2cat[kickstarter$category == "Music"]
kickstarter$category2cat[kickstarter$category == "Art"] 
kickstarter$category2cat <- as.factor(kickstarter$category2cat)
t.test(kickstarter$usd.pledged,kickstarter$category2cat,na.rm=TRUE)


#2
#From the results of the chi-square test there is a diffrence in music and art
# as music failed= 8 successful=12 while art failed= 6 successful=6
kickstarter$state <- as.factor(kickstarter$state)
kickstarter$category <- as.factor(kickstarter$category)
results_table <- table(kickstarter$category, kickstarter$state)
rownames(results_table) <- c("Art","Music")
colnames(results_table) <- c("failed","successful")
results_table
chisq.test(results_table) 

#3
#from the results we are able to examine  there seems to be a positive 
#relationship between the two variables (r=.73). 
cor(kickstarter$backers, kickstarter$usd.pledged)
cor.test(kickstarter$backers, kickstarter$usd.pledged)

#4
#It looks like there is still a positive relationship between the  number of 
#of backers and the amount of money that is pledged, after controlling 
#for the location of the kickstarter campaign
kickstarter$country <- as.factor(kickstarter$country)
mod1 <- lm(kickstarter$backers ~ kickstarter$usd.pledged + kickstarter$country)
summary(mod1)


