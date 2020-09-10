# Getting and Cleaning Data Final Project
# Jonathan Moul

# First, download the data and unzip the file.
curr_dir <- getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "messyData.zip")
unzip("messyData.zip")

# Grab the training data.
setwd(file.path(curr_dir, "UCI HAR Dataset/train"))
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
y_train <- y_train[,1]
sub_train <- read.table("subject_train.txt")
sub_train <- sub_train[,1]
# Then, use y_train to add the activity associated with each observation.
train_levs <- factor(y_train)
x_train$Activity <- train_levs
# Then, use sub_train to add the subject associated with each observation.
train_sub_levs <- factor(sub_train)
x_train$Subject <- train_sub_levs

# Now, grab the testing data.
setwd(file.path(curr_dir, "UCI HAR Dataset/test"))
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
y_test <- y_test[,1]
sub_test <- read.table("subject_test.txt")
sub_test <- sub_test[,1]
# Then, use y_test to add the activity associated with each observation.
test_levs <- factor(y_test)
x_test$Activity <- test_levs
# Then, use sub_test to add the subject associated with each observation.
test_sub_levs <- factor(sub_test)
x_test$Subject <- test_sub_levs

# Next, row bind the testing and training data together. Note that the subject factor
# levels are non-overlapping, so there is no potential for testing subject ids and training
# subject ids to be confused for each other. Additionally, the activity labels are
# consistent between the testing and training data, so there is no potential for
# confusion there either.
data <- rbind(x_test, x_train)
# Now, get the feature and activity labels.
setwd(file.path(curr_dir, "UCI HAR Dataset"))
features <- read.table("features.txt")
features <- features[,2]
activity_labels <- read.table("activity_labels.txt")
activity_labels <- activity_labels[,2]
# Set the colnames of data to the feature names and the created extra columns.
colnames(data) <- c(features, "Activity", "Subject")
# Find the cols with means and sds, and add the two last cols.
indices <- grep("mean\\(\\)|std\\(\\)", colnames(data))
indices <- c(indices, 562, 563)
data2 <- data[,indices]

# Now, use the activity labels to make the activity levels descriptive.
levels(data2$Activity) <- activity_labels

# From this data, we want to make a new tidy dataset with the average of each variable for
# each activity and subject.
# To do this, we use dplyr.
library(dplyr)
# Group data2 by subject and by activity.
tidyData <- group_by(data2, Subject, Activity)
# Then, use summarize_at() to get the mean of each column for each group as desired.
newData <- tidyData %>%
    summarize_at(vars(contains(c("mean", "std"))), mean)
