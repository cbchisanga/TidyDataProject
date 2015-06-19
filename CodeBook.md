---
title: "CodeBook.md"
author: "Charles Chisanga"
date: "17/06/2015"
output: html_document
---

Source of data for the project:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description of the data:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Running the script run_analysis.R performs the following:
* Merges the training and test sets to create one data set 
*UCI_HAR_Dataset/train/X_train.txt and UCI_HAR_Dataset/test/X_test.txt gives 10299 x 561 data frame with column names V1 to V561
*UCI_HAR_Dataset/train/subject_train.txt and UCI_HAR_Dataset/test/subject_test.txt gives 10299 x 1 data frame with subject ID “V1”
*UCI_HAR_Dataset/train/y_train.txt and UCI_HAR_Dataset/test/y_test.txt gives 10299 x 1 with subject ID “V1”

* Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299 x 66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation.

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
walking
walkingupstairs
walkingdownstairs
sitting
standing
laying

* The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed. Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. The result is saved as clean_data_merged.txt, a 10299x68 data frame, first column contains subject IDs, second column activity names and the last 66 columns contain measurements. Subject IDs are integers between 1 and 30 inclusive. The names of the attributes are similar to the following:

tbodyacc-mean-x 
tbodyacc-mean-y 
tbodyacc-mean-z 
tbodyacc-std-x 
tbodyacc-std-y 
tbodyacc-std-z 
tgravityacc-mean-x 
tgravityacc-mean-y

* Finally, the script creates a second independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as Second_independent_tidy_data_av.txt, a 180x68 data frame. The averages for each of the 66 attributes are in columns 3 - 68. There are 30 subjects and 6 activities, hence 180 rows in this data set with averages.
