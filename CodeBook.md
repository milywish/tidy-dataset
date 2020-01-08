CodeBook

fileUrl: string of URL containing the original data sets
files: list of files extracted from the zip files
activity_labels: data frame of activity_labels.txt file extracted - provides the activity name for the number
features: data frame of features.txt file extracted - provides column names as descriptors for the dataset (various statistics on variables)
subject_test: data frame of subject_test.txt file extracted - provides the subject number for each row of the dataset
X_test: data frame of X_test.txt file extracted - contains data from the test group for each of the variables
y_test: data frame of y_test.txt file extracted - contains the number of the activity for each row in the dataset
subject_train: data frame of subject_train.txt file extracted - same as subject_test but for training data
X_train: data frame of X_train.txt file extracted - same as X_test but for training data
y_train: data frame of y_train.txt file extracted - same as y_test but for training data
testData: copy of X_test, but given the feature names as the column names
trainData: copy of X_train, but given the feature names as the column names
allData: combined testData and trainData (rowbind)
measures: list of the column names that we actually want (means and standard deviations only)
ourData: subset of allData to only include the columns in measures. Adds subject and activity columns
activities: combined y_test and y_train (rowbind) - creates a single column that we can add to ourData
subjects: combined subject_test and subject_train (rowbind) - creates a single column that we can add to ourData
avgData: our final dataset - averages the variables for every subject and every activity in ourData
