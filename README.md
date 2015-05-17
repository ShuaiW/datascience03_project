# Wearable Data Jujitsu

#### Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#### Purpose
Engineer the datasets to get a tidy dataset for later analysis

#### Scripts
run_analysis.R

#### How scripts work

1. Reads in the training and test sets and uses rbind() to combine them

2. Extracts only the measurements on mean and std. I use a pattern match function grepl() to create a logical vector, which is then used to select the measurements (79 in my case)

3. Labels the dataset with the feature names extracted from "feature.txt". Note this step happens before step 2 (otherwise impossible to pattern match mean or std)

4. First I combine the labels from training and test sets. then I use an apply() function to map from numbers (1, 2, etc.) to the name of the activities ("WALKING", "WALKING_UPSTAIRS", etc.)

5. This is the fun part. First I combine the subjects (from 1 to 30, representing 30 volunteers) from training and test set; then I append subject/activity to the mean/std dataset; after that I use an aggregate() function to create the tidy dataset. Lastly I rename the column of the tidy dataset for readablility purpose.

6. Writes the dataset.

#### Result
tidy.txt