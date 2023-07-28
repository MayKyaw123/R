#Lab 5
#May Kyaw
library(tidyverse)
library(ggpubr)
library(rstatix)
library(datarium)

#task 1
# Import the dataset 

iristtest <- read.csv("iristtest.csv")
view(iristtest)
#task 2
iristtest %>%
  group_by(Species) %>%
  get_summary_stats(Petal.Length, type="mean_sd")

# visualization using box plot
ggboxplot(iristtest,x="Species",y="Petal.Length")

#Task 3
# checking assumptions

## check for outliers
iristtest %>%
  group_by(Species) %>%
  identify_outliers(Petal.Length)

#outliers were identified But they are not extreme outliers. 
#So it's ok to run the test

# check normality using the Shapiro Wilk test
iristtest %>%
  group_by(Species) %>%
  shapiro_test(Petal.Length)

# the p values that are present for both groups are
# non-significant, indicating the data is normally distributed

# draw a qq plot to illustrate the result. 
ggqqplot(iristtest, x = "Petal.Length", facet.by = "Species")


# check homogeneity assumption using Levene's test. 

iristtest %>%
  levene_test(Petal.Length ~ Species)

# p is non-significant. 
#assumption:Met 

# Compute t
IToutput <- iristtest %>%
  t_test(Petal.Length ~ Species) %>%
  add_significance()
IToutput

#task 4
# importing weightTtest dataset
weightTtest <- read.csv("weightTtest.csv")
view(weightTtest)

#task 5
#descriptive statistics
#creating a boxplot

ggboxplot(weightTtest, x="before", y="after")

# checking if there are any outliers
weightTtest %>%
  group_by(before) %>%
  identify_outliers(after)

# data manipulation
weightTtest <- weightTtest[,t(1,2,3)]
view(weightTtest)

weightTtest.long <- weightTtest %>%
  gather(key = "before", value = "after", t1, t2)
view(weightTtest.long)

#task 6
# check for assumptions, outliers, and difference
weightTtest <- weightTtest %>% mutate(differences = t1 - t2)
head(weightTtest, 5)
weightTtest %>% identify_outliers(differences)

# checking assumption using Shapiro Wilk test
weightTtest %>% shapiro_test(differences)

# assumptions vizualized using the qq plot
ggqqplot(weightTtest, "differences")

# state if paired parameter is true
PToutput <- weightTtest.long %>%
  t_test(score ~ before, paired = TRUE) %>%
  add_significance()
PToutput

#task 7
#ANOVA TEST
#import iris dataset
iris <- read.csv("iris.csv")
view(iris)

#task 8
# descriptive statistics
# creating box plot for sepal length and species
ggboxplot(iris, x="Sepal.Length", y="Species")
# computing t tests and summary statistics
iris %>%
  group_by(Sepal.Length) %>%
  get_summary_stats(Species, type="mean_sd")
# visualization using box plot
ggboxplot(iris,x="Sepal.Length",y="Species")

#task 9
# checking assumptions and outliers
iris %>%
  group_by(Sepal.Length) %>%
  identify_outliers(Species)
# checking the normality assumption by building linear models
model <- lm(weight ~group, data = iris)
#qq plot
ggqqplot(residuals(model))
# checking assumption using Shapiro Wilk test
shapiro_test(residuals(model))
# checking homogeneity assumption using the Levene's test
iris %>%
  levene_test(Sepal.length ~ Species)
# run anova test
pg.aov <- iris %>% anova_test(Sepal.length ~ Species)

#task 10 
#Import the weightanova dataset
weightanova <- read.csv("weightanova.csv")
view(weightanova)

#Compute descriptive statistics and create boxplot 
ggboxplot(weightanova, x="t1", y="t2")
data("weightanova",package= "datarium")
view(weightanova)


weightanova <- weightanova %>%
  gather(key = "t1", value = "t2", t1, t2, t3) %>%
  convert_as_factor(id, time)
view(weightanova)
weightanova %>%

  group_by(time) %>%
  get_summary_stats(id, type = "mean_sd")

#task 12
# checking assumptions and outliers
weightanova %>%
  group_by(time) %>%
  identify_outliers(id)

# checking assumption using Shapiro Wilk test
weightanova %>%
  group_by(time) %>%
  shapiro_test(id)

#gg plot
ggqqplot(weightanova, "id", facet.by = "time")

# computing the repeated measures
res.aov <- anova_test(data = weightanova, dv = id, within = time, wid = id)
get_anova_table(res.aov)

