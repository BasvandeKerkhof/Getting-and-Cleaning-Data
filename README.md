#README file for the programming assignment of the online course "Getting and Cleaning Data" 
# Instructors: Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

The programming assignment uses the script "run_analysis.R". This script performs all the steps of the assignment. More explanatory lines are included within this script. Also a codebook is given in "CodeBook.md".

The script "run_analysis.R" first load some libraries. Next it loads all relevant datasets. Binds the different training and test datasets together. Loads the names for the features. Extracts only the mean and the standard deviation measurements. Loads the descriptive activity labels. Combines all data into one data set. Merges the data using the id labels. Appropriately labels the data set and creates a tidy data set with the average of each variable for each activity and each subject. It writes this data set to a text file.