Describes the variables, contents of the dataset and work carried out to transform the raw data to tidy data

##Source of Data

1 Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2 Dataset description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Content of Dataset

* README.txt

* test/X_test.txt and train/X_train.txt : test and training set for X respectively.

* test/y_test.txt and train/y_train.txt : Test and Training labels for y respectively.

* features.txt : List all features of the dataset.

* features_info.txt : Provides information about the feature variables.

* activity_labels.txt : Links the labels with their activity name.

##Provided method of cleaning the raw data

1 Merge the training and the test sets to create one data set.
2 Extract only the measurements on the mean and standard deviation for each measurement.
3 Use descriptive activity names to name the activities in the data set
4 Appropriately label the data set with descriptive activity names.
5 Create a second independent tidy data set with the average of each variable for each activity and each subject.

## run_analysis.R processing method

*Store all test and training dataset into memory using data.table
*Store activity labels and data features
*Extract only the mean and standard deviation measurements for each of the data feature
*Extract the mean and standard deviation for test and train X data measurement
*Label the data set with descriptive activity names
*Merge the test and training dataset
*Reshape the merged dataset using reshape2 library
*Write the independent data to a text file
