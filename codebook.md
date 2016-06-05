---
title: "codebook.md"
author: "SamDavid"
date: "June 5, 2016"
output: html_document
---


## The data

The dataset includes the following files:

'README.txt'

'features_info.txt': variables used on the feature vector.

'features.txt': all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'train/subject_train.txt': Lists the subject who performed the activity. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## How run_analysis.R implements the above steps:

Require reshape2 and data.table librareis.

Load both test and train data

Load the features and activity labels.

Extract the mean and standard deviation column names and data.

Process the data. There are two parts processing test and train data respectively.

Merge data set.


Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
