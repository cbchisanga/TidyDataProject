##### Tidy Data Project
##### The run_analysis.R script does the following:
###### Source of data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###### A full description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# The run_analysis.R does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(reshape2)
getwd()

### Merges the training and the test sets to create one data set.

X_train <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/train/X_train.txt")
X_test <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/test/X_test.txt")
X_train_test <- rbind(X_train, X_test)

subject_train <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/train/subject_train.txt")
subject_test <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/test/subject_test.txt")
subject_train_test <- rbind(subject_train, subject_test)

y_train <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/train/y_train.txt")
y_test <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/test/y_test.txt")
y_train_test <- rbind(y_train, y_test)

#### Extracts only the measurements on the mean and standard deviation for each measurement.
# mean
features <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/features.txt")

mean_sd_measurement <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
mean_sd_measurement

X_train_test <- X_train_test[, mean_sd_measurement] #####
names(X_train_test) <- features[mean_sd_measurement, 2]
names(X_train_test) <- gsub("\\(|\\)", "", names(X_train_test))
names(X_train_test) <- tolower(names(X_train_test))

#### Uses descriptive activity names to name the activities in the data set.

activity_names <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/activity_labels.txt")
activity_names[, 2] = gsub("_", "", tolower(as.character(activity_names[, 2])))
y_train_test[,1] = activity_names[y_train_test[,1], 2]
names(y_train_test) <- "activity"

#### Appropriately labels the data set with descriptive activity names.

names(subject_train_test) <- "subject"
cleaned <- cbind(subject_train_test, y_train_test, X_train_test)
write.table(cleaned, "clean_data_merged.txt")

##### Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(subject_train_test)[,1]
numSubjects = length(unique(subject_train_test)[,1])
numActivities = length(activity_names[,1]) ######
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activity_names[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activity_names[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, row.names = FALSE, "Second_independent_tidy_data_av.txt")

