## Setting up the packages and directory
library(dplyr)
setwd("C:/Users/brend/Desktop/datasciencecoursera/03 Getting and Cleaning Data/Getting-and-Cleaning-Data-Course-Project")

## Section 1: Getting the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipped <- "Zippeddata.zip"
download.file(url, zipped)
unzip(zipped)

## Section 2: Establishing r objects
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
featurenames <- read.table("UCI HAR Dataset/features.txt")

##Needed features: After 166 may not be necessary   
features <- c(1:6,41:46,81:86,121:126,161:166) 

## Section 3: Extracting the necessary data
traindf <- xtrain[,features]
traindf <- mutate(traindf, subject = subjecttrain[,1], activity = ytrain[,1], .before = 1)
testdf <- xtest[,features]
testdf <- mutate(testdf, subject = subjecttest[,1], activity = ytest[,1], .before = 1)

## Combining the data 
alldata <- rbind(traindf,testdf)

## Section 4: Formatiing
names(alldata) <- c("subject","activity",featurenames[features,2])
alldata$activity <- as.factor(alldata$activity)
levels(alldata$activity) <- c("walking","walking upstairs","walking downstairs","sitting","standing","laying")

## Section 5: Exporting
summarydata <- aggregate(alldata[,3:ncol(alldata)],list(activity = alldata$activity
                                                ,subject = alldata$subject),mean)
##Exporting the data into a file
write.table(alldata, file = "./data/mergeddata.txt")
write.table(summarydata, file = "./data/summarydata.txt", row.names = FALSE)
