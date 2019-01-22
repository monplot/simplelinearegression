# fetching housing data
housingdf= read.csv("C:\\Users\\monis\\Desktop\\R programming\\R\\Data Sets\\West Roxbury.csv",header=TRUE)
# summary of hosuing data
summary(housingdf)
# removing missing values by replacing with median
i=1
for(i in i:length(housingdf$BEDROOMS))
  if(is.na(housingdf$BEDROOMS[i])==TRUE)
  {
    housingdf$BEDROOMS[i]=median(housing.df$BEDROOMS, na.rm = TRUE)
  }
  

# segregating data into : training data [ 50% ], validation data [ 30% ], test data [ 20% ]
set.seed(5)
train.rows=sample(rownames(housingdf), dim(housingdf)[1]*0.5)
train.data=housingdf[train.rows,]
valid.rows=sample(rownames(setdiff(housingdf,train.rows)), dim(housingdf)[1]*0.3)
valid.data=housingdf[valid.rows,]
test.rows <- setdiff(rownames(housingdf), union(train.rows, valid.rows))
test.data=housingdf[test.rows,]

# drawing a linear regrassion model
housingdf$TOTAL.VALUE
reg <- lm(TOTAL.VALUE ~ ., data = housingdf, subset = train.rows)
tr.res <- data.frame(train.data$TOTAL.VALUE, reg$fitted.values, reg$residuals)
head(tr.res)
