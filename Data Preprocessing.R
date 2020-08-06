## DATA VISUALIZATION PROJECT
## TAMILNADU GDP

##import libraries
library(ggplot2)
library(stringr)
library(viridis)
library(dplyr)
library(tidyr)

#read data
data <- read.csv(file.choose()) #read the data

# Exploring data
class(data) #data frame

dim(data) #view number of rows and columns

names(data) #view column names

head(data) #view first few observations

str(data) #view the structure of data

summary(data) #view summary of data

##clean data
colSums(is.na(data))
data <- data[complete.cases(data),]

colSums(is.na(data))
str(data)

##converting character data to factor
data$Year <- as.factor(data$Year)
data$Description <- as.factor(data$Description)

