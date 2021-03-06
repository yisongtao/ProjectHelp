#This is my DataViz project

#This is where I obtained my dataset http://archive.ics.uci.edu/ml/datasets/News+Aggregator#

#If you put the data files in the working directory the code should work


#set working directory and loack packages
setwd("Projects_NYCDSA7/DataViz")
library(dplyr)
library(ggplot2)

##read data
data1 <- read.csv("newsCorpora.csv", header = FALSE, sep = "\t") 
data2 <- read.csv("2pageSessions.csv", header = FALSE, sep = "\t") 

#rename header
colnames(data1) <- c("id", "hdline", "url", "publisher", "category", "clusterid", "hostname", "timestamp")
colnames(data2) <- c("clusterid", "hostname", "category", "url")

#Inner Join based on clusterid
MergedNews <- inner_join(data1, data2, by=c("clusterid", "category"))

#Plot graph category, number of publications
newsplot <- ggplot(data = MergedNews,aes(x = category))
newsplot + geom_bar(aes(fill = category))
                                                       