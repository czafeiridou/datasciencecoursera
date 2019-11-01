---
title: "README"
author: "Christina Z."
date: "11/1/2019"
output: word_document
---

## README
1. This folder has data from UCI HAR Dataset, which is a database that represents the human activity recognition using smartphone dataset. It is based on a Samsung smartphone experiment of a group of 30 volunteers, split into a test and trial group.  

2. The code _run_analysis.R_ merges the data for the trial and test datasets, cleans the variable names, and keeps only the mean and standard deviation for each variable. the steps are: 
    * Merge the training and the test sets to create one data set.
    * Extract only the measurements on the mean and standard deviation for each measurement.
    * Use descriptive activity names to name the activities in the data set
    * Appropriately label the data set with descriptive variable names
    * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The final outcome is a FinalData.txt table.

3. The _CodeBook.md_ describes in more detail the variables, the data, and the data manipulation steps.
