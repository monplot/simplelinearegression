
#1. Give examples of datatypes in R

#2. Give examples of data structures used in R

#3. The code and its respective output is given below.
#Generate the same dataframe using alternative code different from the one used here

x=1:21
x=x[which(x %% 2 != 0)]
df_new=data.frame(var1= append(x,6,after=3),var2=rep(1:4, each= 3),var3=c(1:4) )
head(df_new)

#4. Download the "crime" data (Boston crime) from project1 folder. 
#Read the data using "read.csv" function. 
#Set "stringsAsfactors=FALSE". 
#The dataframe has 17 columns. 
#Add 18th column with "for" loop where the iteration will start from 1 and go on till the end of the dataframe. 
#At each iteration assign value 1 to each cell of the 18th variable.
#Compute the time taken to complete the for" loop.

crime = read.csv("C:\\Users\\monis\\Desktop\\R programming\\R\\Data Sets\\crime.csv",stringsAsFactors = F)
i=1
start_time=as.POSIXct(Sys.time())
for(i in 1:length(crime$INCIDENT_NUMBER))
{
  crime[[length(crime)]][i]=1
  i=i+1
  print(i)

}
end_time=as.POSIXct(Sys.time())
end_time-start_time

#5. The "crime" data frame has a column named "OFFENSE_CODE_GROUP".
#Design a "for" loop to caclulate how many times the word "Medical Assistance" repeats in the "OFFENSE_CODE_GROUP" column. 
#Compute the time taken to complete the for" loop

crime = read.csv("C:\\Users\\monis\\Desktop\\R programming\\R\\Data Sets\\crime.csv",stringsAsFactors = F)
i=1
k=0
start_time=as.POSIXct(Sys.time())
for(i in 1:length(crime$OFFENSE_CODE_GROUP))
{
  if(crime$OFFENSE_CODE_GROUP[i]=="Medical Assistance")
  {
    print(crime$OFFENSE_CODE_GROUP[i])
    k=k+1
  }
  i=i+1
}
print(paste0("number of times medical assistance is repeated in crime$OFFENSE_CODE_GROUP = " , k))
end_time=as.POSIXct(Sys.time())
end_time-start_time
