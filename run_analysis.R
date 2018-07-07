library(tidyverse)
library(lubridate)

dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(dataurl, "./GetandCleanData/project/HARDataset.zip")
downloaddate <- Sys.time()

#read in features and drop row numbering
features <- read_fwf("./GetandCleanData/project/UCI HAR Dataset/features.txt",
           fwf_empty("./GetandCleanData/project/UCI HAR Dataset/features.txt"))

featurenames <- sapply(strsplit(features$X1, split=" "), function(x){x[2]})
str(featurenames)

#read fwf for X_train and use features as col names
x_train <- "./GetandCleanData/project/UCI HAR Dataset/train/X_train.txt"
x_t <- read_fwf(file=x_train,
               fwf_empty(x_train, col_names = featurenames)
               )
