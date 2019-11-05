
install.packages("revgeo")
install.packages("rtweet")
install.packages("devtools")
install.packages("maptools")
install.packages("mapproj")
devtools::install_github("wmurphyrd/fiftystater",force=TRUE)

library(ggplot2)
library(ggmap)
library(plyr)
library(dplyr)
library(fiftystater)
library(revgeo)
library(rtweet)
library(twitteR)

key1 <- 'Google_API_Key'
register_google(key=key1)

#FLU

df1 <-read.csv("./Flu.csv")
extracted_flu_tweets1<-as.data.frame(df1)

#Extracting geo codes of flu tweets data frame
flu_geocode <- geocode(as.character(extracted_flu_tweets1$place_full_name), output = "latlon",source="google")

#Extracting reversing geo-codes of flu tweets data frame to get only state names
reverse_flu_geocode <- do.call(rbind,lapply(1:nrow(flu_geocode),function(i)revgeo(flu_geocode[i,1],flu_geocode[i,2], output = "frame")))

#State names of all the tweets saved in list
STATENAME<- reverse_flu_geocode$state

#Created new data frame containing state names of flu tweets
df0<-cbind(extracted_flu_tweets1,STATENAME)
flu_df<-subset(df0, df0$STATENAME != "State Not Found") #Data Cleaned
flu_df$STATENAME <- tolower(flu_df$STATENAME)

#Created new data frame containing Frequency of tweets for each state
f1<-data.frame(table(flu_df$STATENAME))
Var1 <-tolower(c(state.name))
statenew = data.frame(Var1)

#Merging flu tweets state names and 50 state names and creating new data frame containing Freq, range and state names
states1<- merge(x =statenew , y = f1, by = "Var1", all = TRUE)
states1[is.na(states1)] <- 0 #Converted NA values to 0
states1$range<-cut(states1$Freq, c(-1,10,20,30,40,50,100,150,200,250))

#Heat Map Plot:-
# map_id creates the aesthetic mapping to the state name column in flu data
p <- ggplot(states1, aes(map_id=Var1)) + 
  # map points to the fifty_states shape data
  geom_map( aes(fill=range),map = fifty_states,color="black") + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  ggtitle("Heat Map for Tweets collected for FLU keyword 
            from Feb 21-March 3,2019 ")+
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(fill="Total=1911")+
  labs(x = "", y = "") +
  theme(legend.position = "right", 
        panel.background = element_blank())
p



#FEVER
df2 <-read.csv("Fever.csv")
extracted_fever_tweets<-as.data.frame(df2)

#Extracting geo codes of fever tweets data frame
fever_geocode <- geocode(as.character(extracted_fever_tweets$place_full_name), output = "latlon",source="google")

#Extracting reversing geo-codes of fever tweets data frame to get only state names
reverse_fever_geocode <- do.call(rbind,lapply(1:nrow(fever_geocode),function(i)revgeo(fever_geocode[i,1],fever_geocode[i,2], output = "frame")))

#State names of all the tweets saved in list
STATENAME<- reverse_fever_geocode$state

#Created new data frame containing state names of fever tweets
df_st2<-cbind(extracted_fever_tweets,STATENAME)
fever_df<-subset(df_st2, df_st2$STATENAME != "State Not Found")  #Data Cleaned
fever_df$STATENAME <- tolower(fever_df$STATENAME)

#Created new data frame containing Frequency of tweets for each state
f2<-data.frame(table(fever_df$STATENAME))
Var1 <-tolower(c(state.name))
statenew2 = data.frame(Var1)

#Merging fever tweets state names and 50 state names and creating new data frame containing Freq, range and state names
states2<- merge(x =statenew2 , y = f2, by = "Var1", all = TRUE)
states2[is.na(states2)] <- 0 #Converting NA Values to 0
states2$range<-cut(states2$Freq, c(-1,10,30,50,100,150,200,250,300,350))

#Heat Map Plot:-
# map_id creates the aesthetic mapping to the state name column in fever data
p <- ggplot(states2, aes(map_id=Var1)) + 
  # map points to the fifty_states shape data
  geom_map( aes(fill=range),map = fifty_states,color="black") + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  ggtitle("Heat Map for Tweets collected for FEVER keyword 
           from Feb 21-March 3, 2019")+
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(fill="Total=2070")+
  labs(x = "", y = "") +
  theme(legend.position = "right", 
        panel.background = element_blank())
p

#INFLUENZA
df3 <-read.csv("Influenza.csv")
extracted_influ_tweets<-as.data.frame(df3)

#Extracting geo codes of influenza tweets data frame
influ_geocode <- geocode(as.character(extracted_influ_tweets$place_full_name), output = "latlon",source="google")

#Extracting reversing geo-codes of influenza tweets data frame to get only state names
reverse_influ_geocode <- do.call(rbind,lapply(1:nrow(influ_geocode),function(i)revgeo(influ_geocode[i,1],influ_geocode[i,2], output = "frame")))

#State names of all the tweets saved in list
STATENAME<- reverse_influ_geocode$state

#Created new data frame containing state names of influenza tweets
df_st3<-cbind(extracted_influ_tweets,STATENAME)
influ_df<-subset(df_st3, df_st3$STATENAME != "State Not Found")  #Data Cleaned
influ_df$STATENAME <- tolower(influ_df$STATENAME)

#Created new data frame containing Frequency of tweets for each state
f3<-data.frame(table(influ_df$STATENAME))
Var1 <-tolower(c(state.name))
statenew3 = data.frame(Var1)

#Merging influenza tweets state names and 50 state names and creating new data frame containing Freq, range and state names
states3<- merge(x =statenew3 , y = f3, by = "Var1", all = TRUE)
states3[is.na(states3)] <- 0
#states3$range<-cut(states3$Freq, c(-1,10,20,30,40,50,60,70,80))

#Heat Map Plot:-
# map_id creates the aesthetic mapping to the state name column in influenza data
p <- ggplot(states3, aes(map_id=Var1)) + 
  # map points to the fifty_states shape data
  geom_map( aes(fill=as.factor(Freq)),map = fifty_states,color="black") + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  ggtitle("Heat Map for Tweets collected for INFLUENZA keyword 
           from Feb 21-March 3, 2019")+
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(fill="Total=70")+
  labs(x = "", y = "") +
  theme(legend.position = "right", 
        panel.background = element_blank())
p


#ALL Keywords
temp_df<- do.call(rbind,list(flu_df,fever_df)) #Concatenating Flu and fever data frames
names(influ_df)[names(influ_df) == "user_id"] <- "ï..user_id" #Renaming column to match column names in all data frames
all_df<- do.call(rbind,list(temp_df,influ_df)) #Concatenating Flu, Fever and Influenza data frames
all_df$STATENAME <- tolower(all_df$STATENAME)

#Created new data frame containing Frequency of tweets for each state
f4<-data.frame(table(all_df$STATENAME))
Var1 <-tolower(c(state.name))
statenew4 = data.frame(Var1)

#Merging All tweets state names and 50 state names and creating new data frame containing Freq, range and state names
states4<- merge(x =statenew4 , y = f4, by = "Var1", all = TRUE)
states4[is.na(states4)] <- 0
states4$range<-cut(states4$Freq, c(-1,50,100,150,200,250,300,350,400,450,500,550))


#Heat Map Plot:-
# map_id creates the aesthetic mapping to the state name column in all data
p <- ggplot(states4, aes(map_id=Var1)) + 
  # map points to the fifty_states shape data
  geom_map( aes(fill=range),map = fifty_states,color="black") + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  ggtitle("Heat Map for Tweets collected for ALL keywords 
           from Feb 21-March 3, 2019")+
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(fill = "Total=4051")+
  labs(x = "", y = "") +
  theme(legend.position = "right",
        panel.background = element_blank())
p
