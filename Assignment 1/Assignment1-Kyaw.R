#Lab 1
#May Kyaw

#task 2
# set working directory
getwd()


#task 3
### numeric vector
v1 <-  c(11,13,12,11)
v1
typeof(v1)
is.vector(v1)

### character vector
v2 <-  c("j","k","s","a","e")
v2
typeof(v2)
is.vector(v2)

### logical vector
v3 <-  c(FALSE,TRUE,TRUE,FALSE,TRUE)
v3
typeof(v3)
is.vector(v3)

#task 4 
m1 <- matrix(c(1:9), nrow = 5)
m1
typeof(m1)
is.matrix(m1)

m2 <- matrix(c("Cool","Cat","Pur","Dog","Ruf","Raw","Bark"), nrow=3)
m2
typeof(m2)
is.matrix(m2)

#task 5 
a1 <- array(c(1:36),c(2,3,4))
a1
typeof(a1)
is.array(a1)

a2 <- array(c(1:32),c(4,3,2) )
a2
typeof(a2)
is.array(a2)

#task 6
df1 <- data.frame(col1 = c(2.5, 4.2, 3.2), 
                  col2 = c(4.5, 5.2, 7.2),
                  col3 = c(TRUE, FALSE, TRUE), 
                  col4 = c("hello", "cool", "cat"))


is.data.frame(df1)
typeof(df1)

typeof(df1$col1)
typeof(df1$col2)
typeof(df1$col3)
typeof(df1$col4)

#task 7
o1 <- c(1,2,3,4,5,6,7,8,9)
o2 <- c(F,F,T,T,F,F,F,T,T,F)
o3 <- c("a","b","d","e","f","g","h","i","j")
o4 <- c(T,F,T,T)

list1 <- list(o1,o2,o3,o4)
list1
is.list(list1)

#task 8
list2 <- list(o1,o2,o3,o4,list1)
list2

#clear environment
rm(list=ls())










