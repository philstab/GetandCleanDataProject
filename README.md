# Get and Clean Data Project

## Background
This is a course project for the JHU Data Science Specialization

Archived original data and codebooks located here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The instructions for this project are to:

>You should create one R script called run_analysis.R that does the following.
>
>1. Merges the training and the test sets to create one data set.
>2. Extracts only the measurements on the mean and standard deviation for each measurement.
>3. Uses descriptive activity names to name the activities in the data set
>4. Appropriately labels the data set with descriptive variable names.
>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script Explanation
The first section of the run_analysis.R script loads the libraries used, and downloads the files. The download lines are commented out, but preserved for reproducability.

The next section reads in the features.txt file, because I wanted to use this for the `col_names = ` argument to `read_fwf` function, for easier naming of columns. V1, V2, V3... or X1, X2, X3... are the default names, but naming columns on import seemed easier to me. The following code sections use the `readr::read_fwf` from `tidyverse` to read in each flat file. features.txt needed to be split with `strsplit()` and `sapply()` as `read_fwf()` did not recognize the row numbering as it's own column.

With the main test and train data read in, with column names, the next step was to add subject and activity identifiers. I used the `scan()` function from base R to read these simple files directly into vectors, rather than `read.table()` or a `readr` function. These vectors were added to the test and train dfs using `cbind()` and the outputs set to `tbl_df` objects for easier viewing in console. 

Although not neccesary for this exercise, I added a character column for test and train and renamed the subject and activity columns to the same values before stacking the dfs with `rbind()`. At this point criteria 1 and 4 are met, although more work is done later to satisfy 4.

The next section involved satisfying criteria 2 from above. Using `grep()` with a regex to find columns with "mean()" and "std()" strings in column names, and selecting only those columns with `dplyr`. Column names were checked for variants on "mean" and "std" as well.

Criteria 3 involved adding activity labels, which I read in with `read_fwf` and then `dplyr::left_join` to the main dataframe.

Criteria 5 was satisfied by using `group_by()` on subject and activity variables and then this statement ```summarise_at(mean, .vars = meancol )``` which used ```meancol <- colnames(all)[5:70]``` to identify which variables to operate on.

The final step before reading out the data was to slightly expand some of the column descriptors using `gsub()` to futher satisfy criteria 4. 

The output of the `write.table()` is a tidy data set in wide format, with each row being a (summarized) observation and each column being a unqiue and atomic variable. The first 3 columns are the subject, the activity code, and the text description of the activity and the next 66 variables are the summaries of the variables specificed in criteria 2. See section 2.3 of this paper by Wickham for the definition of tidy data https://vita.had.co.nz/papers/tidy-data.pdf
