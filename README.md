# TidyDataProject
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis.
---
Getting and Cleaning Data
---
This is a repository for any and all code written for the Getting and Cleaning Data - Tidy Data Project
## Course Project
(find all project-related materials in the UCI_HAR_Dataset directory, however, copies of the important files have been put into this main directory to fulfill the submission requirement)

* Unzip source data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say "/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject"
* Put run_analysis.R into /home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset/
* In RStudio: setwd("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/CourseProject/UCI_HAR_Dataset"), followed by: source("run_analysis.R")
* Use data <- read.table("/home/cchisanga/RProgramming_coursera/3.Getting_and_Cleaning_Data/Second_independent_tidy_data_av.txt") to read the data. It is 180x68, 30 subjects and 6 activities, hence "for each activity and each subject" means 30 * 6 = 180 rows.
