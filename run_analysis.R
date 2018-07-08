library(tidyverse)

dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


#download.file(dataurl, "./GetandCleanData/project/HARDataset.zip")
#downloaddate <- Sys.time()

#read in features and drop row numbering
features <- read_fwf("./GetandCleanData/project/UCI HAR Dataset/features.txt",
           fwf_empty("./GetandCleanData/project/UCI HAR Dataset/features.txt"))

featurenames <- sapply(strsplit(features$X1, split=" "), function(x){x[2]})
str(featurenames)

#read fwf for X_train and use features as col names
x_train <- "./GetandCleanData/project/UCI HAR Dataset/train/X_train.txt"
x_trn <- read_fwf(file=x_train,
               fwf_empty(x_train, col_names = featurenames)
               )
#repeat for X_test
x_test <- "./GetandCleanData/project/UCI HAR Dataset/test/X_test.txt"
x_tst <- read_fwf(file=x_test,
                  fwf_empty(x_test, col_names = featurenames)
)

dim(x_trn);dim(x_tst)

#read in subject and activity
train_subject <- scan("./GetandCleanData/project/UCI HAR Dataset/train/subject_train.txt", what=integer())
train_activity <- scan("./GetandCleanData/project/UCI HAR Dataset/train/y_train.txt", what=integer())

test_subject <- scan("./GetandCleanData/project/UCI HAR Dataset/test/subject_test.txt", what=integer())
test_activity <- scan("./GetandCleanData/project/UCI HAR Dataset/test/y_test.txt", what=integer())

#column bind the subject and activity to respective data frames, rename
testdf <- as_tibble(cbind(test_subject, test_activity, x_tst))
traindf <- as_tibble(cbind(train_subject, train_activity, x_trn))

#clean up global env
#rm(list=c("x_trn", "x_tst"))

#check subject selection/randomization
unique(test_subject)
unique(train_subject)

#add selection variable and re-order
testdf <- testdf %>% mutate(selection = "test") %>% 
          select (test_subject, selection, test_activity, everything())
traindf <- traindf %>% mutate(selection = "train") %>% 
          select (train_subject, selection, train_activity, everything())
#rename in-common vars
testdf <- testdf %>% rename(subject = test_subject, activity = test_activity)
traindf <- traindf %>% rename(subject = train_subject, activity = train_activity)

#stackem
all <- as_tibble(rbind(testdf, traindf))

#find and select mean and std dev columns

grep("mean", colnames(all))
colnames(all)[grep("mean", colnames(all))]
sum(grepl("mean", colnames(all)))

grep("mean\\()", colnames(all))
colnames(all)[grep("mean\\()", colnames(all))]
sum(grepl("mean\\()", colnames(all)))

grep("std", colnames(all))
colnames(all)[grep("std", colnames(all))]
sum(grepl("std", colnames(all)))

all <- all %>% select(subject, selection, activity, colnames(all)[grep("mean\\()", 
                      colnames(all))], colnames(all)[grep("std", colnames(all))]  )

#add activity labels column

actlabel <- read_fwf("./GetandCleanData/project/UCI HAR Dataset/activity_labels.txt",
                     fwf_empty("./GetandCleanData/project/UCI HAR Dataset/activity_labels.txt", 
                     col_names = c("activity", "activityDescription")))

all <- left_join(all, actlabel, by = "activity") %>% 
       select(subject, selection, activity, activityDescription, everything())

#"creates a second, independent tidy data set with the average of each variable for each activity and each subject."
meancol <- colnames(all)[5:70]

sumall <- all %>% group_by(subject, activity, activityDescription) %>% summarise_at(mean, .vars = meancol ) 

colnames(sumall)[4:69] <- paste0(meancol, "_mean")

#nicer column names
names(sumall)<-gsub("^t", "time", names(sumall))
names(sumall)<-gsub("^f", "frequency", names(sumall))
names(sumall)<-gsub("Acc", "Accelerometer", names(sumall))
names(sumall)<-gsub("Gyro", "Gyroscope", names(sumall))

write.table(sumall, file="./GetandCleanData/project/sumall.txt", 
            row.names = FALSE, sep="," )

