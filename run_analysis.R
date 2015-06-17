#Load needed libraries
library(data.table) 
library(reshape2) 

#Load test datasets
features_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Load train datasets
features_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Bind the different training and test datasets together
features <- rbind(features_test, features_train)
activity <- rbind(activity_test, activity_train)
subject <- rbind(subject_test, subject_train)

#Load the names for the features
feature_names <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- feature_names[,2]

#Extract only the mean and the standard deviation measurements
features <- features[,grep("mean\\(\\)|std\\(\\)", feature_names[,2])]

#Load the descriptive activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[,2] <- activity_labels[activity[,1],2]
names(activity) <- c("Activity_ID", "Activity_Label")

#Define the name of the subject column
names(subject) <- c("Subject_ID")

#Combine all data into one data set
data <- cbind(subject, features, activity)

#Define the correct id labels
id_labels <- c("Subject_ID", "Activity_ID", "Activity_Label") 

#Determine the non-id labels
data_labels <- setdiff(colnames(data), id_labels) 

#Merge the data using the id labels
melt_data <- melt(data, id = id_labels, measure.vars = data_labels) 

#Appropriately label the data set with descriptive variable names
melt_data$variable<-gsub("^t", "Time ", melt_data$variable)
melt_data$variable<-gsub("^f", "Frequency ", melt_data$variable)
melt_data$variable<-gsub("Acc", "Accelerometer ", melt_data$variable)
melt_data$variable<-gsub("Gyro", "Gyroscope ", melt_data$variable)
melt_data$variable<-gsub("Mag", "Magnitude ", melt_data$variable)
melt_data$variable<-gsub("Body", "Body ", melt_data$variable)
melt_data$variable<-gsub("Gravity", "Gravity ", melt_data$variable)
melt_data$variable<-gsub("-", " ", melt_data$variable)
melt_data$variable<-gsub("mean()", "mean", melt_data$variable)
melt_data$variable<-gsub("std()", "std", melt_data$variable)
melt_data$variable<-gsub("JerkMagnitude", "Jerk Magnitude", melt_data$variable)

#Create the tidy data set with the average of each variable for each activity and each subject
tidy_data <- dcast(melt_data, Subject_ID + Activity_Label ~ variable, mean)

#Write the tidy data set to a text file
write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)