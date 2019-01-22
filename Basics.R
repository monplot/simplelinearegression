# Variable Assignments

x<-1
x=2
x<-y<-3
4->x

# Removing variables
rm(x)
rm(y)

# Data Types
# Numbers
print(x)
# Integer
x<-'xyz'
typeof(x)
class(x)
is.integer(x)
as.integer(x)


# Numeric
y<-1.5
typeof(y)

rm(x)
rm(y)

# Character
y<-"Northeastern Univeristy"
typeof(y)
y<-c("Northeastern Univeristy","hello","Northeastern Univeristy")

y=factor(y)
print(y)
levels(y)=c("NU","H")
# Conversion from one type to another

x<-1L
typeof(x)
x<-as.numeric(x)
typeof(x)
print(x)
x<-as.integer(x)
typeof(x)

# numeric to integer by default rounds off to the lower side
y<-3.64
y<-as.integer(y)

# Number can be converted into characters
x<-1
x<-as.character(x)
x<-x+1

# Characters can be converted into numbers
x<-as.numeric(x)
x<-x+1

# Exception to the rule, "Characters can be converted into numbers" 
var1<-"a"
var1<-as.numeric(var1)

# Date Data Type
date1  <- as.Date("2012-06-28")
class(date1)
date2<-as.POSIXct("2012-06-28 17:42")
class(date2)

# Date Conversion
date1<-as.numeric(date1)
date1<-as.Date(date1)

# Logical Data Types

y<-TRUE
typeof(y)

# ??
y<-"TRUE"
typeof(y)

# Comparison of variables
x<-1
y<-2
x==y
x!=y
x>y
x<y
x>=y
x<=y

x<-"abc"
y<-"abc"
x==y

x<-"abc"
y<-"ABC"
x==y
seq(from =1 , to =5, by=2)

# Data Structures
# Vectors
x<-c(1L,2L,3L,4L,5L,6L,7L)
typeof(x)
x<-c(1,2,3,4,5,6,7)
typeof(x)
x<-c("a","b","c")
typeof(x)

# coercing vectors
x<-c(1,2,3,"a","b","c")

x<-c(1,2,3,TRUE,FALSE)

x<-c(1,2,3,"TRUE","FALSE")

# Acccesing/subsetting elements in a vector
x<-c(10,20,30,40,50,60,70)
x[2]
x[2:4]
x[-3]
x[c(1,3,5)]
x[-c(1,3,5)]
x[x>30]
x[x<30]
x[x<(30/2)]

# Changing elements in a vector
x[2]<-56

# Adding elements to a vector
x[8]<-80
x
x[9:11]<-c(90,100,110)
x

# Deleting elements vector
x<-x[-11]
x<-x[-c(8,9,10)]

# Generating Vectors
x<-1:40
y<-40:1
z<-2:-5

# generate a sequence of numbers from 1 to 21 by increments of 2
seq(from = 1, to = 21, by = 2)             

# generate a sequence of numbers from 1 to 21 that has 15 equal incremented numbers
seq(0, 21, length.out = 15) 

# replicates the values in x a specified number of times in a collated fashion

rep(1:2, each= 3)   

# replicates the values in x in an uncollated fashion
rep(1:4, each = 2) 

# Vector Operations
x<-1:10
x<-x*2
x<-1:10
x<-x+2
x<-x-2

x<-1:4
y<-1:4
x+y

# Calculate the length of vectors
length(x)

# Comparing vectors
x==y
x!=y
x>y

any(x>y)

# Data Structures
# Matrix
m1 <- matrix(0, nrow = 2, ncol = 3)
m2 <- matrix(1:6, nrow = 2, ncol = 3)
typeof(m2)
m3<- matrix(letters[1:6], nrow = 2, ncol = 3)
typeof(m3)
dim(m2)
m3
# Accessing/Subsetting Matrix Elements
m2[1,2]
m2[1:2,1:2]
m2[1,]
m2[,3]
m2[1,c(1,3)]
m2[1:2,c(1,3)]

# Changing Matrix Elements
m3[1,1]<-20L
m3
# Adding row and column names
colnames(m2)<-c("A","B","C")
rownames(m2)<-c("D","E")

# Check row and column names
rownames(m2)
colnames(m2)

# Coercing matrix
m2[1,2]<-"20"
typeof(m2)

# Data Types
# Data Frames
name<-letters[1:10]
age<-11:20
height<-61:70
attendance<-c(TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE)


df<-data.frame(name,age,height,attendance)

dim(df)
head(df)
summary(df)

# Accessing/Subsetting Data Frame
df[1,2]
df[1,2:4]
df[1:3,2:4]
df[1,c(2,4)]

df$name  

df$age
df$attendance

df$age[1:5]
df$age[c(1,3,5,7)]

x=matrix(1:6,nrow=3,ncol=3)
typeof(x)
as.character(x)
x
as.integer(x)
class(x)
