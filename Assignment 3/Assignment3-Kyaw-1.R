#Lab 3
#May Kyaw

# dplyr is a package for manipulating data (e.g., view, select, replace data)
# dplyr is a package in tidyverse
library(dplyr)

# tidyverse is a collection of packages that provide powerful functions 
# for preparing, cleaning, and visualizing data

library(tidyverse)

library(ggpubr)  # contains the "get_summary_stats()" function

library(rstatix)
#task 3
happydata = read.csv("happiness.csv")
head(happydata)

happydata = import("happiness.csv")

View(happydata)
#task 5
# Measures of central tendency
# mean function
mean(happydata$Happiness.Score, na.rm = TRUE) #na.rm removes the missing values from the input

# median 
median(happydata$Happiness.Score, na.rm = TRUE)

# mode
mode(happydata$Happiness.Score) 

#task 6
# Measures of spread

# standard deviation
sd(happydata$Happiness.Score)

# variance
var(happydata$Happiness.Score)

# min
min(happydata$Happiness.Score)

# max
max(happydata$Happiness.Score)

# range
range(happydata$Happiness.Score)

# quantile
quantile(happydata$Happiness.Score)

# sapply function gets specific measure for multiple variables in a data frame 
?sapply

sapply(happydata, mean,na.rm = TRUE) # note the warning message for non-numeric variables

sapply(happydata, sd,na.rm = TRUE)
#Task 8
# summary function gets a range of statistics at once
summary(happydata)

#task 9
happydata %>%
  group_by(Time) %>%
  get_summary_stats(Happiness.Score, type="mean_sd")
#From the result, I learned about the various standard devation 
#scores and how they might varry due to the region of focus 




