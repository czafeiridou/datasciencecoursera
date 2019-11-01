---
title: "CodeBook"
author: "Christina Z."
date: "11/1/2019"
output: word_document
---

# UCI HAR Dataset

This database represents the human activity recognition using smartphone dataset. It is based on a Samsung smartphone experiment of a group of 30 volunteers, split into a test and trial group.  
The code _run_analysis.R_ merges the data for the trial and test datasets, cleans the variable names, and keeps only the mean and standard deviation for each variable.  

# Dataset and Variable Description

1. features_info and features  
    * Feautures info shows information about the 561 time and frequency domain variables in features file.
2. activity_labels
    * Contains the labels for the 6 activities
3. X_train and y_train, X_test and y_test
    * y_train contains the activity numerical code and x_train the values for each one of the 561 variables, for the train subset
    * y_test contains the activity numerical code and x_test the values for each one of the 561 variables, for the test subset
4. subject_train and subject_test
    * contains the participant id between 1-30 for each row of data

# Code Summary

1. Merge the training and the test sets to create one data set.
    * First use _cbind_ to bind subect, y, and x information for the test subset. Name the table _test_ . 
    * Second use _cbind_ to bind subect, y, and x information for the train subset. Name the table _train_ .
    * Third, bind the _test_ and _train_ by columns. The _data_ table will contain the information for all experiment participants for each one of the 561 variables.

2. Extract only the measurements on the mean and standard deviation for each measurement.
    * use the select() function and specify that the column names contain the words mean and std.

3. Use descriptive activity names to name the activities in the data set
    * assign the activity test values to the activity numericals

4. Appropriately label the data set with descriptive variable names
    * Rename t for time and f for frequency
    * Rename Acc for Acceleration  and Gyro fro angular Velocity 
    * Rename jerk for Jerk and Mag for Magnitude 
    * Rename BodyBody to Body
    * Remove the space at the beginning
    * Chnage two spaces into one

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    * Group by activity and group, and then summarise all variables using mean. Exclude NAs. 
    * Create a new txt table with a _write.table_ function.
