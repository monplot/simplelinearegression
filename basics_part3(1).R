# Basics of functions
# Creating a function
# Including a function
# Installing packages
# Including libraries
# Using help for functions
setwd("C:\\Users\\monis\\Desktop\\R programming\\R")
x=1:10
y=1:10
source("rmse_func.R")
rmse(x,y)
# Data frame based coding approaches
# Read data
# Explore data
head(crime)
summary(crime)
# Check data quality
is.na(crime$SHOOTING)
which(is.na(crime$SHOOTING))
is.na.data.frame(crime)

library(dataQualityR)
num.file <- paste("/Users/Sri/Desktop/IE6600", "/numerical.csv", sep= "")
cat.file <- paste("/Users/Sri/Desktop/IE6600", "/categorical.csv", sep= "")
checkDataQuality(data= crime, out.file.num= num.file, out.file.cat= cat.file)
# Select or replace variable values
# Numerical variables
t<-crime$REPORTING_AREA[1:10]
t<-crime$REPORTING_AREA[crime$REPORTING_AREA>300]
t<-crime[1:10,1:10]
# String variables
t<-any(crime$OFFENSE_CODE_GROUP=="Medical Assistance")
t<-crime$OFFENSE_CODE_GROUP[crime$OFFENSE_CODE_GROUP=="Medical Assistance"]
t<-which(crime$OFFENSE_CODE_GROUP=="Medical Assistance")
t<-unique(crime$OFFENSE_CODE_GROUP)

library(stringr)
t<-str_which(crime$OFFENSE_CODE_GROUP, "Medical Assistance")
t<-str_detect(crime$OFFENSE_CODE_GROUP, "Medical Assistance")
t<-str_extract(crime$OFFENSE_CODE_GROUP, "Assistance")
crime$OFFENSE_CODE_GROUP<-str_to_lower(crime$OFFENSE_CODE_GROUP)
# Create new variables 
crime$classification<-"a"

# Loop-dataframe
# Loop-row

for (i in 1:length(crime$INCIDENT_NUMBER)){
  
}

# Write a for loop to loop over first 1000 values of variable
# OFFENSE_CODE_GROUP and print "yes" if you encounter the value "Medical Assistance"

# Write a for loop to print first 10 values in each column
crime<-data
# Order 
crime<-crime[order(crime$YEAR),]

# Subset
result_df<-data.frame("a",1)
colnames(result_df)<-c("code group","frequency")
result_df$`code group`<-as.character(result_df$`code group`)
u<-unique(crime$OFFENSE_CODE_GROUP)
for (i in 1:length(u)){
  temp<-subset(crime,crime$OFFENSE_CODE_GROUP==u[i])
  result_df[i,1]<-u[i]
  result_df[i,2]<-length(temp$OFFENSE_CODE_GROUP)
  
}
#factor causes warning


# repeat the above subset operation using "which" function

# Calculate the highest number of Offenses for each year that took place in
# MASSACHUSETTS AVE

library(plyr)
t<-plyr::count(crime$OFFENSE_CODE_GROUP)

library(dplyr)

# Binding Datasets

df1<-data.frame(name=c("George","Ann"), GPA=c(3.85,4.0))
df2<-data.frame(names=c("Mengkai","Aditi","Amal"), GPA=c(3.8,3.9,4.0 ))
rbind(df1,df2)
cbind(df1,df2)


data<-read.csv("C:\\Users\\monis\\Desktop\\R programming\\R\\Data Sets\\crime.csv")
head(data)
data<-read.csv("C:\\Users\\monis\\Desktop\\R programming\\R\\Data Sets\\crime.csv",na.string="",stringsAsFactors = FALSE)
install.packages("dataQualityR")
library(dataQualityR)
num.file<-paste("fp","fn",sep="")
cat.file<-paste("","",sep="")
#x=0
#k=1
for(i in 1:1000)
{
  if(data$OFFENSE_CODE_GROUP[i]=="Medical Assistance")
    {x[i]=print("yes")
# introduce k
    #k=k+1
  }
}

i=0
while(i<18)
{
  print(data[[i]][1:10])
  i=i+1
}

for(i in 1:18)
{
  print(data[[i]][1:10])
  
}



