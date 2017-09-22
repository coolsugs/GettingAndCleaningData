---
title: "README.md"
author: "Coolsugs"
date: "September 22, 2017"
---

## Project Description
Coursera course 3 - Getting and Cleaning Data requires a project submission. The data used for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site from where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Requirements:
R script called run_analysis.R should be created to complete following tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    

## Steps to reproduce this project
1. Open the R script run_analysis.R using a text editor or RStudio.
2. Change the parameter of the setwd function call to the working directory/folder (i.e. the folder where R script file is saved).
3. Run the R script run_analysis.R.
    

## Output file generated

1. Tidy dataset file: tidy_data_averages.txt (comma separated file)

