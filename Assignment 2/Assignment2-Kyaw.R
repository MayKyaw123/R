#Lab 2
#May Kyaw

#task 1
(v1 <- 1:10) 
typeof(v1)
is.vector(v1)

(v1 <- as.integer(v1))

typeof(v1)
is.vector(v1)

#task2
(s2 <- seq (10,100, by =+8))
typeof(s2)

#task3
(r2 <- rep(c("cool","cat","crisp","cola","hole","coke"),10))
typeof(r2)

#task4

(co1 <- matrix(1:4,nrow = 5))
typeof(co1)
is.matrix(co1)

(co2 <- as.data.frame(co1))
typeof(co2)
is.data.frame(co2)

#task5
(v1 <- as.factor(c(1:3)))

typeof(v1)

(w <- 1:20)

(df1 <- cbind.data.frame(v1,w))
df1$v1 <- factor(df4$v1,
                 levels = c(1,2,3,4),
                 labels = c("Slow","Fast","Medium", "Extra Slow"))
df1
typeof(df1$v1)
str(df1)

#task6
write.table(df1,"“export.txt",row.names=F,sep='\t')
exporttxt <- read.table("“export.txt")
exporttxt
#import 
exporttxt <- import("“export.txt")
head(exporttxt)

#task7
#export 
write.csv(df1,"export.csv",row.names=F) 
exportcsv <- read.csv("export.csv")
exportcsv
is.data.frame(exportcsv)
#import 
exportcsv <- import("export.csv")
head(exportcsv)
View(exportcsv)


