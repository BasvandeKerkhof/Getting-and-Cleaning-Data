#Codebook file for the programming assignment of the online course "Getting and Cleaning Data" 
# Instructors: Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

#Working of the script
- The script "run_analysis.R" first load some libraries. 
- Next it loads all relevant datasets using the 'read.table' function.
- It binds the different training and test datasets together using 'rbind'. 
- It loads the names for the features. 
- Extracts only the mean and the standard deviation measurements using the 'grep'function and corresponding subsetting.
- Loads the descriptive activity labels. 
- Combines all data into one data set using c bind. 
- Merges the data using the id labels in the 'melt' function
- Appropriately labels the data set by substituting some strings using gsub.
- And creates a tidy data set with the average of each variable for each activity and each subject using the 'dcast' function.
- Finally it writes this data set to a text file using the 'write.table' function.

#Variables
- 'X_test.txt', 'y_test.txt', 'subject_test.txt', 'X_train.txt', 'y_train.txt', 'subject_train.txt', 'features.txt' and 'activity_labels.txt' are the downloaded files containing all the relevant data.
- These files were loaded into their respective variables 'features_test', 'activity_test', 'subject_test', 'features_train', 'activity_train', 'subject_train', 'feature_names' and 'activity_labels'.
- 'features', 'activity' and 'subject' are merged datasets of the test and training data.
- 'data' is the dataset in which all 'features', 'activity' and 'subject' are merged together.
- 'id_labels' are the names of the columns which are used to melt the data.
- 'data_labels' are the names of the columns of the measurements
- 'melt_data' is the melted version of 'data'
- 'tidy_data' is the dataset containg the averages of all measurements for each subject and activity. this dataset is written to the file 'tidy_data.txt'