## Coursera Data Cleaning Course Project August 2014
## The goal of this script is to clean a raw data set and prepare tidy data that can be used for later analysis.
## The full description of the data set used is available at:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The script does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require("data.table")

download.data = function() {
    if (!file.exists("data")) {
        dir.create("data")
    }
    if (!file.exists("data/UCI HAR Dataset")) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipfile="data/UCI_HAR_data.zip"
        download.file(fileURL, destfile=zipfile, method="curl")
        unzip(zipfile, exdir="data")
    }
}


## store all test and training dataset into R memory
Xtest    <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest    <- read.table("./UCI HAR Dataset/test/y_test.txt")
subtest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Xtrain   <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain   <- read.table("./UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## store activity labels, data features and excerpt only the mean and standard
## deviation measurements for each of the data feature
labels   <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
grep_features <- grepl("mean|std", features)
names(Xtest)  <- features
names(Xtrain) <- features

## Extracts the mean and standard deviation for test and train X data measurement
Xtest  = Xtest[, grep_features]
Xtrain = Xtrain[, grep_features]

## labels the data set with descriptive activity names
ytest[,2]      = labels[ytest[,1]]
names(ytest)   = c("ID", "Activity")
names(subtest) = "SubjectID"
ytrain[,2]     = labels[ytrain[,1]]
names(ytrain)  = c("ID", "Activity")
names(subtrain)= "SubjectID"

## combine the X and y test and train data using cbind
testData  <- cbind(as.data.table(subtest), Xtest, ytest)
trainData <- cbind(as.data.table(subtrain), Xtrain, ytrain)

## combine the test and train dataset rows into using rbind and use melt 
## function to change it to long format data
require("reshape2")
data = rbind(testData, trainData)
labelsId   <- c("SubjectID", "ID", "Activity")
dataLabels <- setdiff(colnames(data), labelsId)
firstData   <- melt(data, id = labelsId, measure.vars = dataLabels)

## Apply dcast function to cast the data to a wide format for a second independent 
##data by the measured variable mean for each activity and subject
secondData   = dcast(firstData, SubjectID + Activity ~ variable, mean)

## write the independent data to a text file
write.table(secondData, file = "./tidy_data.txt", row.name = FALSE)
