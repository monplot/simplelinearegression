install.packages("twitteR")
install.packages("ROAuth")
library("twitteR")
library("ROAuth")
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")


cred <- OAuthFactory$new(consumerKey='dTUZl4mwdzwj5qQOd6Xdh1pUU',consumerSecret='dHPSO3shbNvRaUMoCfSkIpNBJK00eQFCheT0fS1Q6I8zeYukfk',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

cred$handshake(cainfo="cacert.pem")
save(cred, file="twitter authentication.Rdata")
load("twitter authentication.Rdata")
registerTwitterOAuth(cred)
setup_twitter_oauth('dTUZl4mwdzwj5qQOd6Xdh1pUU','dHPSO3shbNvRaUMoCfSkIpNBJK00eQFCheT0fS1Q6I8zeYukfk','752724411258540032-PvqKVVMI3LBq7oUr0MGrOPWVUjDLSVJ','zzIAAe4RLE3a23xs8EeH7F0Wda0oeYS9lHLEOoWJhE56m')
# harvest some tweets
some_tweets = searchTwitter("starbucks", n=1500, lang="en")

# get the text
some_txt = sapply(some_tweets, function(x) x$getText())

# remove retweet entities
some_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", some_txt)
# remove at people
some_txt = gsub("@\\w+", "", some_txt)
# remove punctuation
some_txt = gsub("[[:punct:]]", "", some_txt)
# remove numbers
some_txt = gsub("[[:digit:]]", "", some_txt)
# remove html links
some_txt = gsub("http\\w+", "", some_txt)
# remove unnecessary spaces
some_txt = gsub("[ \t]{2,}", "", some_txt)
some_txt = gsub("^\\s+|\\s+$", "", some_txt)

# define "tolower error handling" function 
try.error = function(x)
{
  # create missing value
  y = NA
  # tryCatch error
  try_error = tryCatch(tolower(x), error=function(e) e)
  # if not an error
  if (!inherits(try_error, "error"))
    y = tolower(x)
  # result
  return(y)
}
# lower case using try.error with sapply 
some_txt = sapply(some_txt, try.error)

# remove NAs in some_txt
some_txt = some_txt[!is.na(some_txt)]
names(some_txt) = NULL


# classify emotion
class_emo = classify_emotion(some_txt, algorithm="bayes", prior=1.0)
# get emotion best fit
emotion = class_emo[,7]
# substitute NA's by "unknown"
emotion[is.na(emotion)] = "unknown"

# classify polarity
class_pol = classify_polarity(some_txt, algorithm="bayes")
# get polarity best fit
polarity = class_pol[,4]

# data frame with results
sent_df = data.frame(text=some_txt, emotion=emotion,
                     polarity=polarity, stringsAsFactors=FALSE)

# sort data frame
sent_df = within(sent_df,
                 emotion <- factor(emotion, levels=names(sort(table(emotion), decreasing=TRUE))))

# plot distribution of emotions
ggplot(sent_df, aes(x=emotion)) +
  geom_bar(aes(y=..count.., fill=emotion)) +
  scale_fill_brewer(palette="Dark2") +
  labs(x="emotion categories", y="number of tweets") +
  opts(title = "Sentiment Analysis of Tweets about Starbucks\n(classification by emotion)",
       plot.title = theme_text(size=12))


# plot distribution of polarity
ggplot(sent_df, aes(x=polarity)) +
  geom_bar(aes(y=..count.., fill=polarity)) +
  scale_fill_brewer(palette="RdGy") +
  labs(x="polarity categories", y="number of tweets") +
  opts(title = "Sentiment Analysis of Tweets about Starbucks\n(classification by polarity)",
       plot.title = theme_text(size=12))
