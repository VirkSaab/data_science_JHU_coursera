library('dplyr')

trainpath <- 'UCI HAR Dataset/train/X_train.txt'
testpath <- 'UCI HAR Dataset/test/X_test.txt'
features_info <- 'UCI HAR Dataset/features.txt'

trainlabels_path <- 'UCI HAR Dataset/train/y_train.txt'
testlabels_path <- 'UCI HAR Dataset/test/y_test.txt'
activity_labelspath <- 'UCI HAR Dataset/activity_labels.txt'

subject_trainpath <- 'UCI HAR Dataset/train/subject_train.txt'
subject_testpath <- 'UCI HAR Dataset/test/subject_test.txt'

# Step 1: Merges the training and the test sets to create one data set.
train <- read.table(trainpath)
test <- read.table(testpath)
data <- rbind(train, test)

# Step 4: Appropriately labels the data set with descriptive variable names. 
info <- read.table(features_info)
names(data) <- info$V2
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
data <- data[grepl("mean|std", names(data))]

# Step 3: Uses descriptive activity names to name the activities in the data set
trainlabels <- read.table(trainlabels_path)
testlabels <- read.table(testlabels_path)
labels <- rbind(trainlabels, testlabels)
activity_label <- read.table(activity_labelspath)
activities <- as.character(activity_label$V2)
names(activities) <- seq(length(activities))
for (i in seq(nrow(labels))){
    labels[i,] <- activities[labels[i,]]
}

# Adding labels column to data
data['activities'] <- labels

# Step 5: From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable for each
# activity and each subject.
train_subjects <- read.table(subject_trainpath)
test_subjects <- read.table(subject_testpath)
subjects <- rbind(train_subjects, test_subjects)
data['subjects'] <- subjects

new_dataset <- group_by(data, subjects, activities)
new_dataset <- summarise_all(new_dataset, mean)
write.table(new_dataset, 'tidy_dataset.txt', row.names = FALSE)


