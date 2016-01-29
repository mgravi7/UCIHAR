## The code in the file download_data.R needs to be run first
## before doing analysis with this file.
##
## Set the working directory properly. For example,
## the following code sets the working directory based
## on relative path:
## setwd("../onedrive/documents/training/projects/GCD")
## The above needs to be the same as the one used for
## download_data.R.
##
## This code validates the root directory of unzip file exists.
##
## Observations on data:
##		561		features
##		1-30	range of subjects
##		128		number of vctors per row for inertial signal
##
##		53		features with mean/Mean in the name
##		33		features with std() in the name
##		6		activity labels
##
##		7352	rows in Train Subjects file (21 unique train subjects)
##		7352	rows in Train.Y file (train labels)
##		7352	rows and 561 columns in Train.X file (train set)
##
##		2947	rows in Test Subjects file (9 unqiue test subjects)
##		2947	rows in Test.Y file (test labels)
##		2947	rows and 561 columns in Test.X file (test set)

# It is always a good idea to first clear the workspace:
rm(list = ls())

# needed libraries
library(dplyr)

## FUNCTION: AddMeanToTidyDataNames
##
## ARGS:
##      variableNames   - a vector of variable names (CHARACTER)
##						  this vector is NOT modified by the function
##		startIndex		- index where mean needs to be added (INTEGER)
##
## RETURNS:
##      a vector of variable names (CHARACTER) that have
##		mean added from the startIndex. Note that the entire
##		vector is returned (return vector size is the same as
##		the input vector)
##
## Original Data is all CAPS with "_". They will be changed
##		to lower case and "_" changed to "."
##
AddMeanToTidyDataNames <- function(variableNames, startIndex)
{
	## make a copy
	result <- variableNames
	
	## make the changes to the subset
	changedNames <- sub("$", ".mean", variableNames[startIndex: length(variableNames)])
	
	## copy the changed values back to result
	result[startIndex: length(variableNames)] <- changedNames
	
	return (result)
}

## FUNCTION: MakeDescriptiveActivityNames
##
## ARGS:
##      activityNames   - a vector of activity names (CHARACTER)
##						 this vector is NOT modified by the function
##
## RETURNS:
##      a vector of activity names (CHARACTER) that have
##		descriptive names
##
## Original Data is all CAPS with "_". They will be changed
##		to lower case and "_" changed to "."
##
MakeDescriptiveActivityNames <- function(activityNames)
{
	## make everything to lower case
	result <- tolower(activityNames)
	
	## change "_" to "."
	result <- sub("_", ".", result)
	
	return (result)
}

## FUNCTION: MakeDescriptiveFeatureNames
##
## ARGS:
##      featureNames   - a vector of feature names (CHARACTER)
##						 this vector is NOT modified by the function
##
## RETURNS:
##      a vector of feature names (CHARACTER) that have
##		descriptive names
##
## Original Data: abbreviation/prefix to what they mean:
##		prefix "t"	- Time Domain Signal
##		prefix "f"	- Frequency Domain Signal
##		Acc			- Accelerometer
##		Gyro		- Gyroscope
##		Mag			- Magnitude
##
MakeDescriptiveFeatureNames <- function(featureNames)
{
	## change "t" prefix to "timeDomain" prefix
	## and "f" prefix to "frequencyDomain."
	##
	## BEFORE:	"tBodyAcc-mean()-X"
	## AFTER:	"timeDomain.BodyAcc-mean()-X"
	result <- sub("^t", "timeDomain.", featureNames)
	result <- sub("^f", "frequencyDomain.", result)
	
	## change "Body" and "Gravity" to "body" and "gravity"
	## to adhere to variable naming convention
	##
	## BEFORE:	"timeDomain.BodyAcc-mean()-X"
	## AFTER:	"timeDomain.bodyAcc-mean()-X"	
	result <- sub("Body", "body", result)
	result <- sub("Gravity", "gravity", result)
	
	## Expand abbreviations: "Acc", "Gyro" and "Mag"
	##
	## BEFORE:	"timeDomain.bodyAcc-mean()-X"
	## AFTER:	"timeDomain.bodyAccelerometer-mean()-X"
	result <- sub("Acc", "Accelerometer", result)
	result <- sub("Gyro", "Gyroscope", result)
	result <- sub("Mag", "Magnitude", result)
	
	## replace first occurrence of "-" with "Signal"
	##
	## BEFORE:	"timeDomain.bodyAccelerometer-mean()-X"
	## AFTER:	"timeDomain.bodyAccelerometerSignalmean()-X"
	result <- sub("-", "Signal", result)
	
	## change "mean()" to ".Mean"
	## and "std()" to ".StandardDeviation"
	##
	## BEFORE:	"timeDomain.bodyAccelerometerSignalmean()-X"
	## AFTER:	"timeDomain.bodyAccelerometerSignal.mean-X"
	result <- sub("mean\\(\\)", ".mean", result)
	result <- sub("std\\(\\)", ".standardDeviation", result)
	
	## change "mean-X" to ".x.mean", "mean-Y" to ".y.mean" and "mean-Z" to ".z.Mean"
	## (regardless of capital/small letter XYZ).
	## Do the same for StandardDeviation.
	##
	## BEFORE:	"timeDomain.bodyAccelerometerSignal.mean-X"
	## AFTER:	"timeDomain.bodyAccelerometerSignal.x.mean"
	result <- sub("mean-[Xx]$", "x.mean", result)
	result <- sub("mean-[Yy]$", "y.mean", result)
	result <- sub("mean-[Zz]$", "z.mean", result)
	result <- sub("standardDeviation-[Xx]$", "x.standardDeviation", result)
	result <- sub("standardDeviation-[Yy]$", "y.standardDeviation", result)
	result <- sub("standardDeviation-[Zz]$", "z.standardDeviation", result)
	
	return (result)
}

## constants
unzippedDirPath <- "./data/UCI HAR Dataset"
activityLabelsFile <- paste0(unzippedDirPath, "/", "activity_labels.txt")
featuresFile <- paste0(unzippedDirPath, "/", "features.txt")

trainSubjectsFile <- paste0(unzippedDirPath, "/train/", "subject_train.txt")
trainXFile <- paste0(unzippedDirPath, "/train/", "X_train.txt")
trainYFile <- paste0(unzippedDirPath, "/train/", "Y_train.txt")

testSubjectsFile <- paste0(unzippedDirPath, "/test/", "subject_test.txt")
testXFile <- paste0(unzippedDirPath, "/test/", "X_test.txt")
testYFile <- paste0(unzippedDirPath, "/test/", "Y_test.txt")

## does the data directory exist?
if (!file.exists(unzippedDirPath))
{
	print(paste0("Directory '", unzippedDirPath, "' does not exist"))
	print(paste0("Ensure file '", "download_data.R", "' is run first."))
}

## identify the features that are mean and std deviation
featureNames <- (read.table(featuresFile, stringsAsFactors = FALSE))$V2
meanStdFeatureIndices <- grepl("mean\\(\\)|std\\(\\)", featureNames)
meanStdDevFeatureNames <- subset(featureNames, meanStdFeatureIndices)

## read the activity names
activityNames <- (read.table(activityLabelsFile, stringsAsFactors = FALSE))$V2

## read the subject identifiers for index into train/test sets
trainSubjectIndex <- (read.table(trainSubjectsFile, stringsAsFactors = FALSE))$V1
testSubjectIndex <- (read.table(testSubjectsFile, stringsAsFactors = FALSE))$V1

## read the activity identifiers for index into train/test sets
trainActivityIndex <- (read.table(trainYFile, stringsAsFactors = FALSE))$V1
testActivityIndex <- (read.table(testYFile, stringsAsFactors = FALSE))$V1

## read the train/test sets
trainset <- read.table(trainXFile, stringsAsFactors = FALSE)
testset <- read.table(testXFile, stringsAsFactors = FALSE)

## MERGE TRAINING AND TEST DATA SET INTO ONE
## *** ITEM 1 in the request ***
fullData <- rbind(trainset, testset)
fullSubjectIndex <- c(trainSubjectIndex, testSubjectIndex)
fullActivityIndex <- c(trainActivityIndex, testActivityIndex)

## KEEP ONLY COLUMN NAMES IN meanStdDevFeatureNames
## *** ITEM 2 in the request ***
fullData <- subset(fullData, select = meanStdFeatureIndices)
names(fullData) <- meanStdDevFeatureNames

## GIVE DESCRIPTIVE ACTIVITY NAMES
## *** ITEM 3 in the request ***
activityNames <- MakeDescriptiveActivityNames(activityNames)

## APPROPRIATELY LABEL THE DATASET WITH DESCRIPTIVE VARIABLE NAMES
## *** ITEM 4 in the request ***
names(fullData) <- MakeDescriptiveFeatureNames(names(fullData))

## CREATE TIDY DATASET WITH AVERAGE OF EACH VARIABLE FOR
## EACH ACTIVITY AND EACH SUBJECT
## *** ITEM 5 in the request ***
fullData$subject <- fullSubjectIndex
fullData$activity <- fullActivityIndex
tidyData <- fullData %>%
	group_by(activity, subject) %>%
	summarize_each(funs(mean))
	
## since we took the mean for variables, need to update the names
## for everything except the first two (activity, subject)
names(tidyData) <- AddMeanToTidyDataNames(names(tidyData), 3)

## save the datasets
tidyDataDirPath <- "./data/tidyData"
tidyDataFile <- paste0(tidyDataDirPath, "/", "HAR_Data.txt")
tidyActivityFile <- paste0(tidyDataDirPath, "/", "activity_labels.txt")

if (!file.exists(tidyDataDirPath))
{
	dir.create(tidyDataDirPath)
}
write.table(tidyData, tidyDataFile)
write.table(as.data.frame(activityNames), tidyActivityFile)
