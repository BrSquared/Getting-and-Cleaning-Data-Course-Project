## y train has all the acitivities for each row of 
## x train. Each column of x train is a feature
## Subject train has the subject for each row

setwd("C:/Users/brend/Desktop/datasciencecoursera/03 Getting and Cleaning Data/Getting-and-Cleaning-Data-Course-Project")

##Establishing initial objects
xtrain <- read.table("./data/X_train.txt")
ytrain <- read.table("./data/y_train.txt")
xtest <- read.table("./data/X_test.txt")
ytest <- read.table("./data/y_test.txt")
subjecttest <- read.table("./data/subject_test.txt")
subjecttrain <- read.table("./data/subject_train.txt")
featurenames <- read.table("./data/features.txt")

##Needed features: After 166 may not be necessary   
features <- c(1:6,41:46,81:86,121:126,161:166) ##,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517, 529:530,542:543)

##Extracting the necessary data and adding some formatting
traindf <- xtrain[,features]
traindf <- mutate(traindf, subject = subjecttrain[,1], activity = ytrain[,1], .before = 1)
testdf <- xtest[,features]
testdf <- mutate(testdf, subject = subjecttest[,1], activity = ytest[,1], .before = 1)

## Combining the two datasets data
alldata <- rbind(traindf,testdf)

## Gets the column names from the features.txt from the original data
names(alldata) <- c("subject","activity",featurenames[features,2])

## Formatting the activity column with descriptive names
alldata$activity <- as.factor(alldata$activity)
levels(alldata$activity) <- c("walking","walking.upstairs","walking.downstairs","sitting","standing","laying")

## Creating the summary table
summarydata <- aggregate(alldata[,3:ncol(alldata)],list(activity = alldata$activity
                                                ,subject = alldata$subject),mean)
##Exporting the data into a file
write.table(alldata, file = "./data/mergeddata.txt")
write.table(summarydata, file = "./data/summarydata.txt", row.names = FALSE)
