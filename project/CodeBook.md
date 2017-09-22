---
title: "Codebook"
author: "Coolsugs"
date: "September 22, 2017"
---

## Project Description
Coursera course 3 - Getting and Cleaning Data requires a project submission. The data used for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Requirements:
R script called run_analysis.R should be created to complete following tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
## Study design and data processing
The script run_analysis.R performs the 5 steps as mentioned in the requirements of the project.

### Collection of the raw data
Data was downloaded from the url provided in the requirements.

## Variables

### Variables used in run_analysis.R

    x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
    x_combined_data, y_combined_data and subject_combined_data merge the previous datasets to further analysis.For example: x_combined_data merges data from x_train and x_test.
    features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_std_cols.
    subset of x_combined_data is created as x_combined_subset that contains only mean or std values.
    Column names of x_combined_data changed with column names from mean_std_cols.
    A similar approach is taken with activity names through the activities variable.
    all_data merges x_combined_subset, y_combined_data, subject_combined_data in a big dataset.
    averages_data contains average of each variable (total 66 variables) for each activity and each subject. 
    This final dataset is used to generate tidy_data_averages.txt.


### Variables in averages_data dataset

    subject: ID 0f the subject who performed the activity for each window sample. Its range is from 1 to 30.
    activity: Activity name. The data contains 6 activities viz. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
    Acc: This feature denotes acceleration signal of body or gravity
    Jerk: This feature denotes jerk signal of body or gravity
    Gyro: This feature denotes gyro sensors (angular rate sensors or angular velocity sensors) of body or gravity
    Mag: Magnitude of the signals calculated using the Euclidean norm

