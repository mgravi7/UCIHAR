## The code in this file needs to be run first before
## doing analysis with run_analysis.R
##
## Set the working directory properly. For example,
## the follwoing code sets the working directory based
## on relative path:
## setwd("../onedrive/documents/training/projects/GCD")
##
## This code creates a data directory if it does not exist.
## After that, it downloads the file from the web
## (url is in the variable UCI_HAR_URL) to the data directory.
## The zip file is unzipped afterwards.

## create data directory if needed
dataDirPath <- "./data"
if (!file.exists(dataDirPath))
{
	dir.create(dataDirPath)
}

## download the zip file and save it locally
UCI_HAR_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
UCI_HAR_ZipFile <- paste0(dataDirPath, "/", "UCI_HAR_Dataset.zip")
download.file(UCI_HAR_URL, UCI_HAR_ZipFile)

## unzip the file
unzip(UCI_HAR_ZipFile, exdir = dataDirPath)