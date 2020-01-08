#install and load plyr package
install.packages("plyr")
library(plyr)

#download data from the internet
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "dataset.zip")

#unzip zip file
files <- unzip("dataset.zip")

#extract the needed data from downloaded files - only need train/test data and labels
activity_labels <- read.table(files[1])
features <- read.table(files[2])
subject_test <- read.table(files[14])
X_test <- read.table(files[15])
y_test <- read.table(files[16])
subject_train <- read.table(files[26])
X_train <- read.table(files[27])
y_train <- read.table(files[28])

#create data frames for the train/test data and give them the appropriate feature names
testData <- X_test
names(testData) <- features$V2
trainData <- X_train
names(trainData) <- features$V2

#combine train/test data and filter out the columns we don't want (only need mean and std for each variable). Rename columns to cleaner names
allData <- rbind(trainData, testData)
measures <- names(allData)[grep("mean[^Freq]|std", names(allData))]
ourData <- subset(allData, select = measures)
measures <- sub("\\()", "", measures)
measures <- gsub("-", ".", measures)
names(ourData) <- measures

#combine train/test subject/activities data, and add to the dataset. Change the numbers of the activity to actual name of the activity
activities <- rbind(y_test, y_train)
subjects <- rbind(subject_test, subject_train)
ourData$activity <- activities[,1]
ourData$activity <- activity_labels$V2[ourData$activity]
ourData$subject <- subjects[,1]

#create the independent tidy data set that has the mean of each variable for each activity and subject
avgData <- aggregate(x=list(ourData[1:66]), by=list(ourData$subject, ourData$activity), FUN=mean)

#rename columns to appropriate names and arrange by subject ascending
names(avgData)[1:2] <- c("subject", "activity")
avgData <- arrange(avgData, subject)

#view the finalized tidy data set
View(avgData)
