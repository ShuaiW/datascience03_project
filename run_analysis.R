# 1. Merges the training and the test sets to create one data set.
X_train <- read.table("../train/X_train.txt")
X_test <- read.table("../test/X_test.txt")
X <- rbind(X_train, X_test)


# 3. Appropriately labels the data set with descriptive variable names. 
features_df <- read.table("../features.txt")
features <- features_df[, 2]
colnames(X) <- features


# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement.
logical <- grepl("mean", features) | grepl("std", features)
X_mean_std <- X[, logical]


# 4. Uses descriptive activity names to name the activities in the data set.
y_train <- scan("../train/y_train.txt")
y_test <- scan("../test/y_test.txt")
y <- c(y_train, y_test)

activity <- read.table("../activity_labels.txt")
y_label <- sapply(y, function(x) activity[match(x, activity[[1]]), 2]) # mapping


# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
subject_train <- scan("../train/subject_train.txt")
subject_test <- scan("../test/subject_test.txt")
subject <- c(subject_train, subject_test)

combined <- cbind(X_mean_std, subject)
combined <- cbind(tidy, y_label)

tidy <- aggregate(tidy[, 1:79], by=list(subject, y_label), FUN=mean)

# Makes columns names more readable
colnames(tidy)[1:2] <- c("subject", "activity")
colnames(tidy)[3:81] <- paste(colnames(tidy)[3:81], "ave", sep = ".")


# Writes the tidy data to disk
write.table(tidy, "tidy.csv", row.name = FALSE)