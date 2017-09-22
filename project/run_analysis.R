library(plyr)

# set up defualt directory
setwd('D:/Coursera/Course3_GettingAndCleaningData/project')


zipfile <- "UCI_HAR_Dataset.zip"
datazip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(zipfile)) {
    download.file(datazip_url, zipfile)

    unzip(zipfile)

}

###########################################################################################################
# 1. Merges the training and the test sets to create one data set.

# load train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

dim(x_train)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

dim(y_train)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

dim(subject_train)

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
dim(x_test)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
dim(y_test)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
dim(subject_test)

# merge and create one data set for x training set and test set
x_combined_data <- rbind(x_train, x_test)

dim(x_combined_data)

# merge and create one data set for y training set and test set
y_combined_data <- rbind(y_train, y_test)

dim(y_combined_data)

# merge and create one data set for y training set and test set
subject_combined_data <- rbind(subject_train, subject_test)

dim(subject_combined_data)



###########################################################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement
# Load features
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

dim(features)

head(features)

# get only columns with mean() or std() in their names
mean_std_cols <- grep("-(mean|std)\\(\\)", features[, 2])

mean_std_cols

# subset the desired columns
x_combined_subset <- x_combined_data[, mean_std_cols]

dim(x_combined_subset)

# correct the column names
names(x_combined_subset) <- features[mean_std_cols, 2]



###########################################################################################################
# 3. Uses descriptive activity names to name the activities in the data set

# Load activity labels  
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

activity_labels


# update values with correct activity names
y_combined_data[, 1] <- activity_labels[y_combined_data[, 1], 2]



###########################################################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
# column name changed from V1 to activity
names(y_combined_data) <- "activity"

# column name changed from v1 to subject
names(subject_combined_data) <- "subject"



# bind all the data in a single data set
all_data <- cbind(x_combined_subset, y_combined_data, subject_combined_data)

dim(all_data)


###########################################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

names(all_data)

# total 68 columns but last two are activity & subject so need to select only 66 cols
averages_data <- ddply(all_data, .(subject, activity), function(fx) colMeans(fx[, 1:66]))
dim(averages_data)

write.table(averages_data, "tidy_data_averages.txt", sep = ',', row.name=FALSE)

