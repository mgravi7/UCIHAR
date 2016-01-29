# UCI Human Activity Data Analysis
This repository contains R code for downloading and analyzing data found at
[UCI Machine Learning site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
You can read this [fun article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)
to understand more about the trends in wearable computing and the role of data in this.

List of code files:
* download_data.R
* run_analysis.R

List of data files downloaded to the *data* directory:
* UCI_HAR_Dataset.zip

The code unzips the above file creating *UCI HAR Dataset* directory in *data* directory.
Please see the *CodeBook.md* file for further details.

## Instructions for running the code
The code has been tested in RStudio environment. Please run the code in the following order:
1. Run *download_data.R* first.
2. If there are NO errors in step 1, run *run_analysis.R* next

Further details of what each file does is explained below.

### Details of *download_data.R*
The code in this file does the following:
* Downloads the *UCI_HAR_Dataset.zip* file from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Saves the file to *Data* directory
* Unzips the saved file

### Details of *run_analysis.R*
The code in this file does the following:
* Reads the feature names (561 in total) and subsets the ones that are mean and
standard deviation measurements (66 in total)
* Reads activity labels, subject index vector for training and test data set, and
activity index vector for training and data set
* Reads the training and test data set
* Combines training and test data set, combines activity index vector for training and test and
similarly for subject index vector
* Subsets the full data set (561 columns) to columns containing mean and standard deviation measurements (66 columns)
* Renames the column names to friendly columns names using regular expression (original names contained hard to
understand abbreviations for example)
* Renames the activity labels to friendly activity names
* Creates a new tidy data set where the mean of 66 columns in full data set are grouped by activity and subject
resulting in a 180 row, 68 column (66 columns + activity identifier + subject identifier) data set
* Saves the above tidy data set to *tidyDataset* directory in *data* directory.
In addition, saves the activity names to a file too.