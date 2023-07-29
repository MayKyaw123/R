
#May Kyaw
#INST354
#LAB 8

tidyverse
kickstarter <- read.csv('~/Downloads/kickstarter354.csv', header = TRUE)

#1
#There are 497 rows and 14 columns

dim(kickstarter) # this is for the dimensions (rows, columns)

#2
#The variables in the kickstarter dataset are 
summary(kickstarter)

#3
#These are the variables that have NA and one that might be relvant to 
#trying to determine whether a kickstarter was successful or not would be 
#states
which(is.na(kickstarter))

#4
#The average number of people who backed a kickstarter is 80.42857
mean(kickstarter$backers)
#The highest number of "usd.pledged" for a kickstarter is 303877
max(kickstarter$usd.pledged)

#5
kickstarter_clean <- kickstarter[!is.na(kickstarter$states),]
dim(kickstarter_clean)
