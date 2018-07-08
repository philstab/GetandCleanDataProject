## Code book for sumall dataset from run_analysis.R

> Major portions of this code book came from documentation of the original dataset for this project located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

sumall contains 180 observations and 69 variables. Variables besides the first 3 are tagged with "_mean" to distinguish them from the original variables of the source data set in the link above, as they have been summarized. This is a summarized subset of the data from the original source. The variables in question are of units: 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz

### Notes 
* Features (variables) are normalized and bounded within [-1,1] 
* Subjects number 1-30
* 6 activities with values and text
	* 1 WALKING
	* 2 WALKING_UPSTAIRS
	* 3 WALKING_DOWNSTAIRS
	* 4 SITTING
	* 5 STANDING
	* 6 LAYING


### Listing and Types

**Variable Name**  :                               **Type**

subject                                          : int  
activity                                         : int  
activityDescription                              : chr  
timeBodyAccelerometer-mean()-X_mean              : num  
timeBodyAccelerometer-mean()-Y_mean              : num  
timeBodyAccelerometer-mean()-Z_mean              : num  
timeGravityAccelerometer-mean()-X_mean           : num  
timeGravityAccelerometer-mean()-Y_mean           : num  
timeGravityAccelerometer-mean()-Z_mean           : num  
timeBodyAccelerometerJerk-mean()-X_mean          : num  
timeBodyAccelerometerJerk-mean()-Y_mean          : num  
timeBodyAccelerometerJerk-mean()-Z_mean          : num  
timeBodyGyroscope-mean()-X_mean                  : num  
timeBodyGyroscope-mean()-Y_mean                  : num  
timeBodyGyroscope-mean()-Z_mean                  : num  
timeBodyGyroscopeJerk-mean()-X_mean              : num  
timeBodyGyroscopeJerk-mean()-Y_mean              : num  
timeBodyGyroscopeJerk-mean()-Z_mean              : num  
timeBodyAccelerometerMag-mean()_mean             : num  
timeGravityAccelerometerMag-mean()_mean          : num  
timeBodyAccelerometerJerkMag-mean()_mean         : num  
timeBodyGyroscopeMag-mean()_mean                 : num  
timeBodyGyroscopeJerkMag-mean()_mean             : num  
frequencyBodyAccelerometer-mean()-X_mean         : num  
frequencyBodyAccelerometer-mean()-Y_mean         : num  
frequencyBodyAccelerometer-mean()-Z_mean         : num  
frequencyBodyAccelerometerJerk-mean()-X_mean     : num  
frequencyBodyAccelerometerJerk-mean()-Y_mean     : num  
frequencyBodyAccelerometerJerk-mean()-Z_mean     : num  
frequencyBodyGyroscope-mean()-X_mean             : num  
frequencyBodyGyroscope-mean()-Y_mean             : num  
frequencyBodyGyroscope-mean()-Z_mean             : num  
frequencyBodyAccelerometerMag-mean()_mean        : num  
frequencyBodyBodyAccelerometerJerkMag-mean()_mean: num  
frequencyBodyBodyGyroscopeMag-mean()_mean        : num  
frequencyBodyBodyGyroscopeJerkMag-mean()_mean    : num  
timeBodyAccelerometer-std()-X_mean               : num  
timeBodyAccelerometer-std()-Y_mean               : num  
timeBodyAccelerometer-std()-Z_mean               : num  
timeGravityAccelerometer-std()-X_mean            : num  
timeGravityAccelerometer-std()-Y_mean            : num  
timeGravityAccelerometer-std()-Z_mean            : num  
timeBodyAccelerometerJerk-std()-X_mean           : num  
timeBodyAccelerometerJerk-std()-Y_mean           : num  
timeBodyAccelerometerJerk-std()-Z_mean           : num  
timeBodyGyroscope-std()-X_mean                   : num  
timeBodyGyroscope-std()-Y_mean                   : num  
timeBodyGyroscope-std()-Z_mean                   : num  
timeBodyGyroscopeJerk-std()-X_mean               : num  
timeBodyGyroscopeJerk-std()-Y_mean               : num  
timeBodyGyroscopeJerk-std()-Z_mean               : num  
timeBodyAccelerometerMag-std()_mean              : num  
timeGravityAccelerometerMag-std()_mean           : num  
timeBodyAccelerometerJerkMag-std()_mean          : num  
timeBodyGyroscopeMag-std()_mean                  : num  
timeBodyGyroscopeJerkMag-std()_mean              : num  
frequencyBodyAccelerometer-std()-X_mean          : num  
frequencyBodyAccelerometer-std()-Y_mean          : num  
frequencyBodyAccelerometer-std()-Z_mean          : num  
frequencyBodyAccelerometerJerk-std()-X_mean      : num  
frequencyBodyAccelerometerJerk-std()-Y_mean      : num  
frequencyBodyAccelerometerJerk-std()-Z_mean      : num  
frequencyBodyGyroscope-std()-X_mean              : num  
frequencyBodyGyroscope-std()-Y_mean              : num  
frequencyBodyGyroscope-std()-Z_mean              : num  
frequencyBodyAccelerometerMag-std()_mean         : num  
frequencyBodyBodyAccelerometerJerkMag-std()_mean : num  
frequencyBodyBodyGyroscopeMag-std()_mean         : num  
frequencyBodyBodyGyroscopeJerkMag-std()_mean     : num  

