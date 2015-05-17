# Wearable Data

#### Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#### Purpose
Engineer the datasets to get a tidy dataset for later analysis

#### Scripts
run_analysis.R

#### How scripts works
###### The comments I put in the R scripts are explainatory, but here is a brief.
###### 1. Reads in the train and test set use rbind() to combine them
2 Extracts only the measurement on mean and std. I used a pattern match function grepl() to create a logical vector, which is then used to select the measures (79 in my case)
3 Label the dataset with the feature names extracted from "feature.txt". Note this stepped happened before step 2 (otherwise impossible to pattern match mean or std)
4 First I combined the labels from training and test. then I used one apply function to mapping from numbers (1, 2, etc.) to the name of the activities ("WALKING", "WALKING_UPSTAIRS", etc.)
5 This is the fun part. First I combined the subjects (from 1 to 30, representing 30 volunteers) from training and test set; then I appended subject/activity to the mean/std dataset; then I used a aggregate() function to create the tidy dataset. Lastly I renamed the column names of the tidy dataset for readablility purpose.
6 Writes the dataset.

