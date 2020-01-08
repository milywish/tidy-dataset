# tidy-dataset
Repository for Coursera Getting and Cleaning Data project

README

This script takes the data from the following file
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(accelerometer data from Samsung Galaxy S smartphones) and creates a tidy data set with the following conditions:

1. Train and test data are combined
2. Only the mean and standard deviation columns from the metrics are used
3. The final tidy dataset takes the average of each used metric for each individual and each activity

Additional information and licensing information about the data files are included in the zip file provided.

This script makes use of the plyr package, specifically for the arrange function

Step-by-step description of script:

1. Install and load plyr package
2. Download dataset from  the internet
3. Unzip zip file
4. Extract the need data from downloaded files - we only need the train/test data and the labels
5. Create data frames for the train/test data and give appropriate feature names
6. Combine train/test data and filter out the columns we don't want (only need the mean and std for each variable), rename the columns to cleaner names
7. Combine train/test subject/activites data, and add to the dataset. Change the numbers of the activity to the actual name of the activity
8. Create the independent tidy data set that has the average of each variable for each activity and each subject
9. Rename columns to appropriate names and arrange by subject ascending
10. View the finalized tidy dataset
