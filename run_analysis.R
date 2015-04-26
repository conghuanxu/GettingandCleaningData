library(plyr)
## Merges the training and the test sets to create one data set.

# read train data and test data
traindata_X <- read.table("train/X_train.txt")
traindata_y <- read.table("train/y_train.txt")
traindata_subject <- read.table("train/subject_train.txt")
testdata_X <- read.table("test/X_test.txt")
testdata_y <- read.table("test/y_test.txt")
testdata_subject <- read.table("test/subject_test.txt")
# combine test data and train data
mergeddata_X <- rbind(traindata_X, testdata_X)
mergeddata_y <- rbind(traindata_y, testdata_y)
mergeddata_subject <- rbind(traindata_subject, testdata_subject)


## Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
# exact keyword with mean() and std()
indices <- grep("mean\\()|std\\()", features[, 2])
extracteddata_X <- mergeddata_X[,indices]
# name the col
names(extracteddata_X) <- gsub("\\()", "", features[indices, 2])
names(extracteddata_X) <- tolower(gsub("-", "", names(extracteddata_X)))


## Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activity_y <- activity[mergeddata_y[, 1], 2]
mergeddata_y[, 1] <- activity_y
names(mergeddata_y) <- "activity"


## Appropriately labels the data set with descriptive variable names. 
names(mergeddata_subject) <- "subject"
cleanedData <- cbind(mergeddata_subject, mergeddata_y, extracteddata_X)
write.table(cleanedData, "merged_data.txt")


## From the data set in step 4, creates a second, independent tidy data set
#  with the average of each variable for each activity and each subject.
averageddata <- ddply(cleanedData, .(subject, activity), function(x) colMeans(x[, 3:68]))
write.table(averageddata, "averageddata.txt", row.name=FALSE)
