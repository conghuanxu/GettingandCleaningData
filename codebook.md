---
title: "Getting and Cleaning Data Project Code Book"
author: "Conghuan Xu"
date: "April 24, 2015"
output: html_document
---
# Getting Data
The data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). And the data is from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

# Processing Data
1. Download data and unzip it to current workspace.
2. Read X_train.txt, y_train.txt and subject_train.txt in the train folder and name them as traindata_X, traindata_y and traindata_subject.
3. Read X_test.txt, y_test.txt and subject_test.txt in the test folder and name them as testdata_X, testdata_y, and testdata_subject.
4. Combine traindata_X data and testdata_X to mergeddata_X; combine traindata_y and testdata_y to mergeddata_y; combine traindata_subject and testdata_subject to mergedata_subject.
5. Read features.txt from data. Extracts only the measurements on the mean() and std() for each measurement. Change all the features' names to lower letter.
6. Read activity_labels.txt in current folder, earse the '_' in the names and change all the activities to lower letters denote it as activity.
7. Transform the value of mergeddata_y to the corresponding activities in the activity.
8. Name mergeddata_subject as subject, put mergeddata_subject, mergeddata_y and extracteddata_X together by column and save it to current workspace as merged_data.txt, and this is our cleanedData.
9. Compute the column mean based on each subject and activity, this is averageddata. Save it to our current workspace as averageddata.txt.
