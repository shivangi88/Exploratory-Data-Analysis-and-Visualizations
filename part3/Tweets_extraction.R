
# Name: SHIVANGI TRIPATHI
# Team Member: PRATIK SANGHVI

install.packages("ggmap")
install.packages("twitteR")
install.packages("rtweet")

library(rtweet)
library(dplyr)
library(twitteR)
library(ggplot2)
library(ggmap)

API_key<-"API_Key"
API_secret<-"APi_Secret"
Access_token<-"Access_token"
Access_secret<-"Access_Secret"
setup_twitter_oauth(API_key, API_secret, Access_token, Access_secret)

#FLU:-

tweets<- search_tweets("flu", n = 2000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-03-06")
tweets_df <- as.data.frame(tweets)

extracted_flu_tweets <- select(tweets_df, user_id, screen_name, source , place_full_name , country , country_code  , location, created_at )
extracted_flu_tweets <- subset(extracted_flu_tweets , extracted_flu_tweets$country_code == "US")
extracted_flu_tweets <- subset(extracted_flu_tweets , extracted_flu_tweets$source != "Instagram")


write.csv(extracted_flu_tweets, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\LAB_1\\Data\\Part3_Data\\tweet_refined_flu5.csv" , row.names = FALSE)


#FEVER:- 
fever_tweets<- search_tweets("fever", n = 2000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-03-06")
fever_tweets_df <- as.data.frame(fever_tweets)

extracted_fever_tweets <- select(fever_tweets_df, user_id, screen_name, source , place_full_name , country , country_code  , location, created_at )
extracted_fever_tweets <- subset(extracted_fever_tweets , extracted_fever_tweets$country_code == "US")
extracted_fever_tweets <- subset(extracted_fever_tweets , extracted_fever_tweets$source != "Instagram")


write.csv(extracted_fever_tweets, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\LAB_1\\Data\\Part3_Data\\tweet_refined_fever5.csv" , row.names = FALSE)

#FLU SEASON:- 
fs_tweets<- search_tweets("flu season", n = 2000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-03-06")
fs_tweets_df <- as.data.frame(fs_tweets)

extracted_fs_tweets <- select(fs_tweets_df, user_id, screen_name, source , place_full_name , country , country_code  , location, created_at )
extracted_fs_tweets <- subset(extracted_fs_tweets , extracted_fs_tweets$country_code == "US")
extracted_fs_tweets <- subset(extracted_fs_tweets , extracted_fs_tweets$source != "Instagram")


write.csv(extracted_fs_tweets, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\LAB_1\\Data\\Part3_Data\\tweet_refined_fluseason21_05.csv" , row.names = FALSE)


#INFLUENZA:- 
influ_tweets<- search_tweets("influenza", n = 2000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-03-06")
influ_tweets_df <- as.data.frame(influ_tweets)

extracted_influ_tweets <- select(influ_tweets_df, user_id, screen_name, source , place_full_name , country , country_code  , location, created_at )
extracted_influ_tweets <- subset(extracted_influ_tweets , extracted_influ_tweets$country_code == "US")
extracted_influ_tweets <- subset(extracted_influ_tweets , extracted_influ_tweets$source != "Instagram")


write.csv(extracted_influ_tweets, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\LAB_1\\Data\\Part3_Data\\tweet_refined_influenza6.csv" , row.names = FALSE)
