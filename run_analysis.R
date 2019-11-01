# set working directory
setwd("C:/Users/czafe/Desktop/R lessons/getting and cleaning data project")
# install relevant packages
#install.packages("dplyr")
#library(dplyr)

# read the txt data
# the features should be the column names for x_train and y_train, the other data sets have one column
features <- read.table("UCI HAR Dataset/features.txt")
# There is a problem with this dataset because many columns have the same names, so I am amending the names with numbers to fix the problem
features <- mutate(features, v3 = paste0(V1,V2))
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(subject_train) <- "group"
colnames(x_train) <- features$v3
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(y_train) <- "activity"

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) <- "group"
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(x_test) <- features$v3
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(y_test) <- "activity"

# Question 1: Merge the training and the test sets to create one data set.
test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
data <- rbind(test, train)

# Question 2: Extract only the measurements on the mean and standard deviation for each measurement.
data_std_mean <- select(data, group, activity, contains("mean"), contains("std"))

# Question 3: Use descriptive activity names to name the activities in the data set
data_std_mean$activity <- activity[data_std_mean$activity, 2]

# Question 4: Appropriately label the data set with descriptive variable names
# rename t for time and f for frequency
names(data_std_mean)<-gsub("[0-9]t", " time ", names(data_std_mean))
names(data_std_mean)<-gsub("[0-9]f", " frequency ", names(data_std_mean))
names(data_std_mean)<-gsub("[0-9]", "", names(data_std_mean))

# rename Acc for Acceleration  and Gyro fro angular Velocity 
names(data_std_mean)<-gsub("Acc", " Acceleration ", names(data_std_mean))
names(data_std_mean)<-gsub("Gyro", " Angular Velocity ", names(data_std_mean))

# rename jerk for Jerk and Mag for Magnitude 
names(data_std_mean)<-gsub("Jerk", "Jerk ", names(data_std_mean))
names(data_std_mean)<-gsub("Mag", " Magnitude ", names(data_std_mean))

# rename BodyBody to Body
names(data_std_mean)<-gsub("BodyBody", "Body", names(data_std_mean))

# remove the space at the beginning
names(data_std_mean)<-gsub("^ ", "", names(data_std_mean))
# chnage two spaces into one
names(data_std_mean)<-gsub("  ", " ", names(data_std_mean))

# Question 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalData <- data_std_mean %>% 
    group_by(group, activity) %>%
    summarise_all(mean, na.rm = TRUE)
write.table(FinalData, "FinalData.txt", row.name=FALSE)

