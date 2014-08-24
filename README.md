#coursera-data-cleaning


Describes an R method of obtaining and cleaning raw data for further analysis

#Functions performed by run_analysis.R

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement.

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive activity names.

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Script's Dependences

1. data.table Library

2. reshape2 Library

3. Large enough RAM memory to handle data processing

#Guidelines for a successful run of the script

1. Download and Unzip the source zip file to create a UCI HAR dataset into your local drive but if the data does not exist, just run run_analysis.R and it will obtain the data from the source onto your current working directory

2. Make sure run_analysis.R is in your current working directory

3. Run the code by using: source("run_analysis.R")

4. The R script will read the dataset and produce a new file called tidy_data.txt which is the clean data required.

5. The tidy_data.txt produced is about 0.261Mb in size

6. The script runs for ~16 seconds depending on user systems RAM and specification


